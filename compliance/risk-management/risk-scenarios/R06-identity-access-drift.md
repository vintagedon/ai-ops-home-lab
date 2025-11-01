# R6: Identity & Access Drift

**Risk ID:** R6  
**Risk Slug:** identity-access-drift  
**System Context:** All identity and access management across RadioAstronomy.io infrastructure (Google Workspace, service accounts, database permissions, NetBird ZTNA)  
**Category:** Infrastructure Security  
**Data Classes Involved:** All (excessive permissions enable unauthorized data access)  
**Consequential Decision:** No - Infrastructure access control  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** User onboarding/offboarding | Role change | Service account creation | Quarterly access review | Security incident

---

## 1. Threat Description

### What Could Go Wrong?

Identity and access drift occurs when user accounts, service accounts, and permission assignments accumulate over time without systematic review and cleanup. Unlike acute security incidents with clear detection moments, access drift manifests as gradual erosion of least-privilege principles—each permission grant individually justified, collectively creating excessive access that violates separation of duties and amplifies blast radius of compromised accounts.

The risk manifests in multiple ways at RadioAstronomy.io:
1. **Orphaned Accounts:** Departed personnel, contractors whose engagements ended, or volunteers who moved on retain active credentials enabling unauthorized infrastructure access
2. **Stale Group Memberships:** Users promoted, demoted, or transferred between roles accumulate permissions from previous assignments without losing old access
3. **Overly-Broad Service Accounts:** Automation accounts created for specific tasks gradually expand permissions as new features added, eventually possessing excessive authority
4. **Forgotten API Keys:** Long-lived API tokens created for temporary integrations remain valid indefinitely, unknown to current staff, potentially leaked or compromised
5. **Permission Creep:** Users request "temporary" elevated access for troubleshooting, access never revoked, accumulates across months of support requests

### Attack Vector / Failure Mode

**How it happens:**

1. **Orphaned Account Exploitation:**
   - Volunteer researcher departs RadioAstronomy.io after completing collaboration (2024-06)
   - Google Workspace account disabled but SSH keys, database credentials, NetBird access remain valid
   - Former volunteer's credentials compromised in unrelated breach (personal device malware, phishing)
   - Attacker uses leaked credentials to access RadioAstronomy.io infrastructure
   - Six months post-departure, no one remembers this account existed
   - Attacker has unrestricted access to Protected DESI datasets via orphaned database credentials

2. **Service Account Permission Creep:**
   - N8N workflow automation agent created (2024-Q1) with read-only database access for data export workflow
   - Q2: Developer adds "quick fix" granting write permissions for data cleanup task
   - Q3: Another developer adds network egress permission for external API integration
   - Q4: Agent now has database write + external network access—unintended powerful combination
   - Security review never conducted; each permission individually approved but aggregate risk never assessed
   - Compromised agent credentials enable data exfiltration and database manipulation

3. **Stale Group Membership:**
   - Engineer promoted from "Research Engineer" to "Operations Lead" (2024-08)
   - Added to "infrastructure-admins" Google Workspace group for Ansible/Proxmox access
   - Retains membership in "research-data-analysts" group from previous role
   - Now has both infrastructure admin AND unrestricted data access—separation of duties violated
   - Single compromised account provides complete infrastructure control plus Protected data access
   - Quarterly access review process exists but overwhelmed by group membership volume, misses this case

4. **Forgotten API Key:**
   - API key created for one-time data export to external collaborator (2023-12)
   - Collaboration completed (2024-02), key never revoked
   - Key documented in git commit message (developer troubleshooting authentication)
   - GitHub repository public; commit history includes key
   - External attacker discovers key via GitHub scanning tools
   - Attacker uses year-old key to access current data (key never rotated, no expiration)

**Attacker profile:** 
- **Primary:** Former insider (departed personnel, terminated contractors, ex-volunteers) using retained credentials
- **Secondary:** External attacker exploiting compromised credentials of overprivileged accounts
- **Tertiary:** Malicious current insider leveraging stale permissions from previous role

**Prerequisites:**
- Manual account provisioning/deprovisioning processes with human error opportunities
- Insufficient automation of access lifecycle management
- Lack of regular access reviews or ineffective review processes
- No enforced credential expiration or automatic rotation
- Inadequate monitoring of dormant account usage

### Real-World Examples

- **Tesla Former Employee Access (2023):** Fired employee retained VPN credentials for 6 months post-termination; downloaded 23GB of confidential data including trade secrets and personal information of 75,000 employees.
- **Capital One Breach (2019):** Compromised IAM credentials with overly broad S3 permissions enabled attacker to access 100 million customer records. Permissions accumulated over time without review.
- **RadioAstronomy.io near-miss (2024-Q4):** Quarterly access review discovered research collaborator who ended engagement 8 months prior still had active Google Workspace account and database access. No unauthorized activity detected but represented significant exposure window.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | Medium | Compromised credentials enable unauthorized access to collaborator personal information in datasets; potential privacy violations |
| Operational Disruption | High | Compromised overprivileged accounts enable infrastructure sabotage, data deletion, service disruption—recovery 8-48 hours |
| Reputational Damage | High | Access drift demonstrates governance failure; loss of collaborator trust; potential public disclosure damaging research credibility |
| Financial Impact | High | Incident response costs ($15-20K); comprehensive access audit and remediation labor (80+ hours); potential legal liability for unauthorized data access |
| Regulatory/Compliance | High | CIS Controls v8.1 violation (Control 5.3: Disable Dormant Accounts, 6.1: Establish Access Granting Process); potential Colorado SB-24-205 implications if unauthorized access affects consequential decisions |

**Impact Level (CIS-RAM):** Catastrophic

### Cascading Effects

**R1: Data Egress** - Orphaned accounts with database access enable bulk exfiltration of Protected datasets without detection.

**R2: Secrets Leakage** - Compromised accounts with excessive permissions can access credential stores, Ansible Vault files, infrastructure secrets.

**R3: Prompt Injection** - Service accounts with accumulated tool permissions provide high-value targets for prompt injection exploitation.

**R4: Infrastructure Drift** - Overprivileged accounts enable unauthorized infrastructure modifications disguised as legitimate changes.

**R10: Logging Blind Spots** - Compromised accounts with admin permissions can disable monitoring and logging to hide malicious activity.

### Recovery Complexity

- **Time to detect:** Days to months (orphaned accounts may go undetected until quarterly review; excessive permissions often invisible without comprehensive audit)
- **Time to contain:** Hours (immediate credential revocation for identified orphaned accounts; permission removal for excessive grants)
- **Time to recover:** Weeks to months (comprehensive identity audit across all systems; systematic permission remediation; implementation of automated lifecycle management; trust restoration)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Automated Provisioning/Deprovisioning | CIS 5.1 (Establish Centralized Account Management) | Google Workspace serves as identity source of truth; automated workflows trigger on user lifecycle events | ✅ Implemented |
| Time-Limited Access Grants | CIS 6.1 (Establish Access Granting Process) | Google Workspace groups have expiration dates for temporary access; calendar reminders for review | 🟡 Partial |
| Phishing-Resistant MFA | CIS 6.3 (Require MFA for Remote Access) | FIDO2/WebAuthn security keys required for all human accounts; SMS/TOTP prohibited | ✅ Implemented |
| Service Account Inventory | CIS 5.1 (Establish Centralized Account Management) | Comprehensive register of all service accounts with: owner, purpose, permissions, creation date, last review | ✅ Implemented |
| Least-Privilege by Default | CIS 5.4 (Restrict Administrator Privileges) | New accounts granted minimum permissions; elevated access requires documented justification and approval | ✅ Implemented |
| Credential Rotation | CIS 5.2 (Use Unique Passwords) | 90-day rotation for service account credentials; API keys have expiration dates; SSH keys rotated annually | 🟡 Partial |
| Separation of Duties | CIS 5.4 (Restrict Administrator Privileges) | Infrastructure admins cannot access Protected data; data analysts cannot access infrastructure controls | ✅ Implemented |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Quarterly Access Reviews | CIS 5.3 (Disable Dormant Accounts) | Security Lead conducts quarterly audit of all user accounts, group memberships, service accounts; identifies orphaned accounts and excessive permissions | ✅ Implemented |
| Dormant Account Detection | CIS 5.3 (Disable Dormant Accounts) | Google Workspace reports users with no login activity >60 days; automatic account suspension after 90 days inactivity | ✅ Implemented |
| Anomalous Access Monitoring | CIS 8.11 (Conduct Audit Log Reviews) | Wazuh SIEM alerts on unusual access patterns: off-hours access, geographic anomalies, failed authentication spikes | ✅ Implemented |
| Privilege Escalation Detection | CIS 8.5 (Collect Detailed Audit Logs) | Alerts when users invoke sudo, access credential stores, modify firewall rules, or use admin-level tools | ✅ Implemented |
| Service Account Activity Audit | CIS 8.2 (Collect Audit Logs) | Monthly review of service account actions; investigate unexpected tool usage or data access patterns | 🟡 Partial |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Emergency Access Revocation | CIS 5.3 (Disable Dormant Accounts) | Automated workflow to suspend user accounts and revoke all credentials within 15 minutes of compromise detection | ✅ Implemented |
| Permission Remediation | CIS 6.1 (Establish Access Granting Process) | Documented process for removing excessive permissions identified during access reviews; validates no operational impact | ✅ Implemented |
| Credential Reset | CIS 5.2 (Use Unique Passwords) | Force password reset for all potentially compromised accounts; SSH key regeneration; API key rotation | ✅ Implemented |
| Access Audit Forensics | CIS 8.11 (Conduct Audit Log Reviews) | Retrospective analysis of compromised account activity: what was accessed? what actions taken? when did unauthorized access begin? | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **Onboarding Workflow:** New user accounts provisioned through Google Workspace with: appropriate group memberships based on role, time-limited trial access for contractors/volunteers, phishing-resistant MFA setup verified, acceptable use policy acknowledgment required.

- **Offboarding Checklist:** Departing personnel offboarding includes: immediate Google Workspace account suspension, SSH key removal from authorized_keys on all systems, database account disablement, API key revocation, NetBird access removal, credential rotation if sensitive access was granted.

- **Role Change Procedure:** When users change roles (promotion, transfer, demotion): review current permissions, remove inappropriate access from previous role, grant new role permissions, document permission changes with justification, Security Lead approval required for role changes involving elevated access.

- **Quarterly Access Review:** Security Lead conducts comprehensive review: Google Workspace account list verified against current personnel roster, group memberships validated against current roles, service account inventory checked for ownership and justification, dormant accounts identified and suspended, API keys without recent usage investigated.

### Approval Workflows

- **Required approvals:** 
  - New account creation: Manager approval for employees; CTO approval for contractors/volunteers
  - Elevated permissions (admin, infrastructure access, Protected data access): Security Lead approval with documented business justification and expiration date
  - Service account creation: System Owner approval; Security Lead approval if permissions exceed read-only
  - Group membership changes: Manager approval; Security Lead approval for security-sensitive groups

- **Escalation path:** Access request denied by Security Lead → Requestor provides additional justification and compensating controls → ARO reviews and makes final decision → If approved, time-limited with mandatory quarterly re-approval

### Training Requirements

- **Who needs training:** All managers (responsible for access requests and offboarding); Security Lead and Operations Lead (conducting access reviews); all personnel (recognizing when to request/relinquish access)
- **Training content:** Least-privilege principles, role-based access control, separation of duties, offboarding procedures, quarterly access review process, dormant account risks, credential hygiene
- **Frequency:** Annual comprehensive training (45 minutes); manager-specific training at promotion (60 minutes); security briefing after any identity-related incident (20 minutes)

---

## 5. Architectural Safeguards

### Design Principles

**Single Source of Truth:** Google Workspace Enterprise serves as authoritative identity source. All access decisions derive from Google Workspace groups; no local accounts on systems; no shadow IT identity systems. This architectural decision means account suspension in Google Workspace propagates to all infrastructure (NetBird, databases, SSH, applications) automatically.

**Group-Based Access Control:** Permissions granted through Google Workspace groups, never directly to individuals. Enables atomic role changes (add/remove from groups), simplifies access reviews (audit group memberships not individual permissions), and supports separation of duties (mutually exclusive groups prevent conflicting permissions).

**Time-Bounded Access:** Elevated permissions have explicit expiration dates (Google Workspace group expiration, calendar reminders for manual revocations). Prevents permanent accumulation—access automatically revokes if not explicitly renewed.

### Network Segmentation

- **NetBird ZTNA:** All infrastructure access routes through zero-trust network with Google Workspace authentication; account suspension immediately terminates network connectivity
- **SSH Bastion Pattern:** No direct SSH from workstations to production servers; all access through jump host with Google Workspace SSO and session recording
- **Database Access:** PostgreSQL authentication integrated with Google Workspace groups; account suspension revokes database access without manual intervention

### Data Classification

**Permission Matrix by Role:**
- **Research Engineers:** Read access to Public and Protected data; no infrastructure permissions
- **Operations Lead:** Infrastructure admin permissions; read-only access to Protected data for operational troubleshooting
- **Security Lead:** Infrastructure admin + audit access to all systems; no routine data access (prevents conflict of interest)
- **Service Accounts:** Minimum permissions for specific automation tasks; never admin-level; all actions logged

**Separation Enforcement:** Google Workspace organizational units enforce separation of duties; users cannot be in mutually exclusive groups (e.g., cannot be both infrastructure-admins and research-data-analysts).

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| PROV-001 | Automated Provisioning | Operations Lead | Google Workspace Audit Logs | Google Admin Console → Reporting → Audit → Account | Monthly |
| OFFBOARD-001 | Offboarding Checklist | Operations Lead | Offboarding Tracking Sheet | SharePoint → HR → Offboarding Log | Per Departure |
| MFA-001 | Phishing-Resistant MFA | Security Lead | Google Workspace Security Settings | Google Admin Console → Security → 2-Step Verification | Weekly |
| REVIEW-001 | Quarterly Access Reviews | Security Lead | Access Review Reports | SharePoint → Security → Quarterly Access Reviews | Quarterly |
| DORMANT-001 | Dormant Account Detection | Security Lead | Google Workspace Inactive User Reports | Google Admin Console → Reports → User Reports | Monthly |
| ROTATE-001 | Credential Rotation | Operations Lead | Rotation Calendar | SharePoint → IT Operations → Credential Management | Monthly Verification |
| SEPDUTY-001 | Separation of Duties | Security Lead | Group Membership Matrix | Google Workspace → Groups → Membership Exports | Quarterly |

### Testing Procedures

- **Test scenario 1 (Offboarding):** Simulate employee departure; execute offboarding checklist
- **Expected result:** Google Workspace account suspended within 1 hour; SSH access revoked within 2 hours; database access disabled within 4 hours; NetBird access terminated immediately; test login attempts fail
- **Test frequency:** Quarterly disaster recovery drill

- **Test scenario 2 (Dormant Account):** Create test account; leave inactive for 91 days
- **Expected result:** Account automatically suspended after 90 days; alert generated to Security Lead; account appears in dormant account report
- **Test frequency:** Annual (long test duration)

- **Test scenario 3 (Excessive Permissions):** During quarterly review, simulate discovery of user with conflicting group memberships
- **Expected result:** Security Lead identifies violation; permissions remediated within 24 hours; user notified of access change; justification documented or account adjusted
- **Test frequency:** Every quarterly access review

- **Test scenario 4 (Service Account Audit):** Select random service account; trace activity logs
- **Expected result:** All actions documented; activity matches documented purpose; no unexpected tool usage or data access; owner responsive when contacted for verification
- **Test frequency:** Monthly on rotating sample

### Audit Trail

**Pre-Incident Evidence:**
- Account lifecycle: `user_id, account_creation_date, created_by, role, group_memberships, last_login, account_status`
- Access grants: `access_grant_id, user_id, permission_type, granted_by, grant_date, expiration_date, business_justification`
- Group membership changes: `change_id, user_id, group_name, action (add/remove), changed_by, timestamp`
- Service account inventory: `service_account_id, owner, purpose, permissions, creation_date, last_review_date, activity_logs`
- MFA status: `user_id, mfa_method (FIDO2/WebAuthn), enrollment_date, last_used, backup_methods`

**Post-Incident Evidence:**
- Access review findings: `review_date, orphaned_accounts_found, excessive_permissions_identified, remediation_actions, completion_date`
- Compromise timeline: `compromise_detection, unauthorized_access_duration, data_accessed, actions_taken, containment_time`
- Credential revocation: `revocation_timestamp, credentials_revoked_list, systems_affected, validation_checks`
- Forensic analysis: `compromised_account, access_patterns, privilege_escalation_attempts, lateral_movement_indicators`

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map 1.1:** Organizational context and priorities determined → Least-privilege principles reflect organizational security priorities
- **Measure 2.7:** AI system security and resilience practices documented → Service account permissions, access reviews, separation of duties
- **Manage 2.3:** Mechanisms established to enable regular feedback incorporation → Quarterly access reviews incorporate lessons from near-misses and incidents
- **Govern 1.4:** Organizational policies for AI system use established → Group-based access control ensures appropriate AI system access
- **Govern 2.1:** Accountability structures in place → Clear approval workflows, Security Lead oversight, documented permission grants

### NIST Trustworthiness Characteristics

- ✅ Valid and Reliable - Prevents unauthorized access that could corrupt system operation
- ✅ Safe - Protects against compromised credentials causing operational failures
- ✅ Secure and Resilient - Core objective of identity and access management controls
- ✅ Accountable and Transparent - Comprehensive audit logging enables accountability for all access grants
- ⬜ Explainable and Interpretable - N/A for identity management
- ✅ Privacy-Enhanced - Prevents unauthorized access to Protected personal data
- ⬜ Fair (Bias-Free) - N/A for identity management

### Colorado SB-24-205 Compliance

**Not directly applicable** - Identity management is foundational control, not specific to high-risk systems

However, identity drift could violate SB-24-205 if unauthorized access:
- Enables algorithmic discrimination through unauthorized AI system modification
- Prevents required impact assessment evidence collection through logging tampering
- Creates liability for deployer due to inadequate access controls protecting consequential decision systems

### ISO 42001 Mapping

- **6.1.3.1:** Access control → Least-privilege, separation of duties, phishing-resistant MFA, time-bounded access
- **6.1.3.2:** Log management → Comprehensive audit trail of all access grants and usage
- **7.2:** Competence → Training requirements for managers and security personnel
- **8.2:** Change management → Role change procedures, access review process
- **9.1:** Monitoring and measurement → Quarterly access reviews, dormant account detection, service account audits

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| System Owner | Request appropriate access for team members; remove access when personnel depart or change roles; ensure service accounts under their control have documented owners and purposes; participate in quarterly access reviews |
| Security Lead | Conduct quarterly access reviews; approve elevated access requests; maintain service account inventory; investigate anomalous access alerts within 30 minutes; enforce phishing-resistant MFA; oversee offboarding process; approve exceptions to least-privilege policies |
| Operations Lead | Execute account provisioning/deprovisioning workflows; configure Google Workspace group memberships; implement credential rotation; maintain offboarding checklist; provide training on access request procedures; respond to dormant account alerts |
| ARO | Accept residual risk for identity and access management approach; approve access exceptions requiring policy deviations; review quarterly access review findings; ensure identity controls align with organizational risk tolerance; approve architectural changes to identity infrastructure |
| All Managers | Approve access requests for direct reports; initiate offboarding procedures when personnel depart; notify Security Lead of role changes requiring permission adjustments; validate group memberships during quarterly reviews |
| All Personnel | Request minimum necessary access; notify manager when access no longer needed; use phishing-resistant MFA; complete identity security training; report suspicious account activity |

**Primary Owner:** Security Lead (ultimate accountability for identity and access security posture)

---

## 9. Incident Response

### Detection Indicators

- Quarterly access review: Orphaned account discovered (employee departed months ago, account still active)
- Dormant account alert: User with no login activity for 90+ days, but account not suspended
- Anomalous access alert: Failed authentication attempts from unusual location, off-hours access pattern, geographic impossibility
- Privilege escalation alert: User invokes sudo, accesses credential files, modifies security controls
- User report: "I can still access systems from my old role" or "Former colleague accessed our shared drive"
- External notification: Collaborator reports seeing RadioAstronomy.io IP address in their logs from departed personnel

### Immediate Response Steps

1. **Assessment (within 30 minutes of detection):**
   - Identify compromised/orphaned account: Who was the account for? What permissions granted? When did they depart/stop needing access?
   - Determine unauthorized access scope: What systems accessed? What data viewed/modified? What actions taken?
   - Evaluate urgency: Active compromise in progress? Or historical access discovered during audit?

2. **Containment (within 1 hour of assessment):**
   - Immediately suspend compromised account in Google Workspace (cascades to all systems)
   - Revoke all credentials: SSH keys, API tokens, database passwords, application-specific credentials
   - Terminate active sessions: Force logout from all systems, kill SSH sessions, invalidate authentication tokens
   - Isolate affected systems: If unauthorized modifications suspected, network-isolate systems pending forensic analysis

3. **Investigation (within 4 hours of containment):**
   - Review audit logs: Comprehensive timeline of unauthorized account activity across all systems
   - Identify data accessed: Which datasets queried? Which files viewed/downloaded? Which APIs called?
   - Determine persistence mechanisms: Any backdoor accounts created? SSH keys added? Configuration changes made?
   - Assess blast radius: Did unauthorized access enable lateral movement? Were other accounts compromised?

4. **Remediation (within 24 hours for high-severity, 1 week for medium):**
   - Rotate all credentials accessible from compromised account (database passwords, service account keys)
   - Remove any backdoors or persistence mechanisms discovered during investigation
   - Validate system integrity: Verify no unauthorized modifications to configurations, data, or code
   - Enhance controls: Address specific gaps that enabled unauthorized access (improved offboarding, faster dormant account detection)

### Communication Plan

- **Internal:** 
  - Immediate: Slack alert to #security-incidents channel with affected account and containment actions
  - 4 hours: Email to CTO, ARO, affected System Owners with investigation findings and remediation plan
  - Weekly: Status updates until remediation complete and enhanced controls validated
  - 30 days: Postmortem presentation to all staff with lessons learned and process improvements

- **External:** 
  - Collaboration Partners: If unauthorized access affected partner data, notify within 24 hours per agreement terms; provide incident timeline, scope of compromise, remediation actions
  - Former Personnel: If orphaned account belonged to departed employee who may have been compromised, courtesy notification offering identity theft protection resources
  - Colorado AG: If unauthorized access affected high-risk AI system with discriminatory impact, disclosure required per SB-24-205

### Post-Incident Actions

- [ ] Root cause analysis: Why was account orphaned? Offboarding process failure? Quarterly review miss? Manual cleanup error?
- [ ] Control hardening: Automate offboarding steps missed; enhance dormant account detection; improve quarterly review procedures
- [ ] Policy update if needed: Clarify offboarding responsibilities; adjust dormant account thresholds; enhance access review rigor
- [ ] Lessons learned documentation: Add incident as training case study; update offboarding checklist; document new access drift patterns to monitor
- [ ] Process validation: Test offboarding procedures to ensure incident gaps addressed; verify dormant account automation working correctly
- [ ] Proactive remediation: Conduct immediate comprehensive access audit across entire organization; identify and remediate any similar drift

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (personnel turnover, role changes, and permission accumulation occur frequently; human error in access management inevitable)
- **Safeguard Reliability:** High (automated provisioning/deprovisioning, Google Workspace integration, phishing-resistant MFA, quarterly reviews create robust controls)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Catastrophic Impact × Very High Expectancy (common threat, no controls) = 10/10
- **Qualitative Rating:** Critical

**Residual Risk:**
- **Calculated Score:** Catastrophic Impact × Low Expectancy (common threat, high reliability safeguards) = 4/10
- **Qualitative Rating:** Medium

### Risk Treatment Decision

**Treatment:** Mitigate (implement comprehensive identity lifecycle management to reduce risk to acceptable level)

**Rationale:** 

Identity and access drift represents a fundamental security risk because it directly undermines all other security controls—an attacker with valid credentials appears indistinguishable from legitimate users. Orphaned accounts, excessive permissions, and stale group memberships create persistent security exposure that compounds over time without systematic remediation.

RadioAstronomy.io cannot eliminate this risk without prohibiting all personnel changes (impossible for dynamic research organization) or implementing perfect manual access management (unrealistic given human error rates). However, uncontrolled identity drift would create catastrophic risk exposure—every departed employee is potential backdoor, every overprivileged account is lateral movement opportunity.

Therefore, RadioAstronomy.io implements defense-in-depth identity management strategy:

1. **Automated Lifecycle Management (Preventive):** Google Workspace as authoritative identity source enables automated propagation of account status changes across all systems. Account suspension cascades to infrastructure, databases, applications automatically.

2. **Phishing-Resistant MFA (Preventive):** FIDO2/WebAuthn security keys prevent credential compromise even if passwords leaked. Protects against most common attack vector for exploiting orphaned or excessive permissions.

3. **Time-Bounded Access (Preventive):** Elevated permissions have explicit expiration dates. Prevents permanent accumulation—access automatically revokes if not explicitly renewed with justification.

4. **Separation of Duties (Preventive):** Architectural enforcement via mutually exclusive Google Workspace groups prevents single account from having both infrastructure control and Protected data access.

5. **Quarterly Access Reviews (Detective):** Systematic audit identifies orphaned accounts, excessive permissions, stale group memberships. Provides backstop for automation failures or policy violations.

6. **Dormant Account Detection (Detective):** Automatic suspension after 90 days inactivity catches accounts missed during offboarding or abandoned after temporary engagement.

7. **Anomalous Access Monitoring (Detective):** Real-time alerting on unusual access patterns enables rapid detection of compromised credentials before significant damage.

8. **Rapid Revocation (Corrective):** Emergency workflows enable 15-minute credential revocation when compromise detected, limiting attacker window.

These layered controls reduce expectancy from "Very High" (inherent) to "Low" (residual), bringing risk into "Medium" overall range. Residual risk consists of:
- Fast-moving compromise before quarterly review cycle (attacker exploits orphaned account immediately after departure)
- Automation failures where Google Workspace suspension doesn't propagate to all systems
- Social engineering where attacker convinces manager to approve excessive access
- Insider threats exploiting legitimate but overly broad permissions
- Service accounts with accumulated permissions operating autonomously without effective oversight

RadioAstronomy.io accepts this residual risk level because:
- Alternative (prohibit personnel changes, manual-only access management) would be operationally infeasible
- Defense-in-depth provides reasonable protection against most realistic scenarios
- Quarterly review cycle provides systematic remediation even when automated controls miss cases
- Phishing-resistant MFA significantly raises bar for credential exploitation
- Most RadioAstronomy.io systems require network access through NetBird ZTNA, providing additional authentication layer

The organization monitors identity drift as key risk indicator through quarterly metrics (orphaned accounts found, excessive permissions remediated, offboarding compliance rate), adjusting controls if residual risk trends upward.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: identity-related security incident occurs, offboarding failure detected, Google Workspace integration issues identified, organizational turnover increases significantly)
- **Conditions:** 
  - Google Workspace serves as authoritative identity source with automated propagation
  - Phishing-resistant MFA (FIDO2/WebAuthn) enforced for all human accounts
  - Quarterly access reviews conducted with findings remediated within 30 days
  - Dormant account detection operational with 90-day automatic suspension
  - Offboarding checklist executed for all departures with verification
  - Service account inventory maintained with quarterly ownership verification
  - Separation of duties enforced through mutually exclusive Google Workspace groups
  - Time-bounded access implemented for all elevated permissions (auto-expiration or calendar reminders)
  - Anomalous access monitoring operational with <30 minute alert response
  - All managers complete annual identity management training
  - Emergency credential revocation procedures tested quarterly
  - Any identity-related incident triggers immediate comprehensive access audit
  - Review Board conducts annual assessment of identity lifecycle management effectiveness

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on RadioAstronomy.io near-miss (2024-Q4) and operational identity controls | David Thompson |
