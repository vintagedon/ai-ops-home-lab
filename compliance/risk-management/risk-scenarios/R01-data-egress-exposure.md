# R1: Data Egress & Exposure

**Risk ID:** R1  
**Risk Slug:** data-egress-exposure  
**System Context:** All AI systems processing Protected data within RadioAstronomy.io secure research enclave  
**Category:** Data Protection  
**Data Classes Involved:** Protected (DESI spectroscopy datasets, collaboration agreements, internal research)  
**Consequential Decision:** No - Internal research operations  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** Model/version change | New data source | Tool permission change | Security incident | Annual review

---

## 1. Threat Description

### What Could Go Wrong?

Protected data (DESI spectroscopy datasets, internal research findings under embargo, collaboration agreements with confidentiality clauses) could be exposed outside RadioAstronomy.io security controls through AI system interactions. This occurs when users inadvertently paste Protected content into AI service interfaces that lack adequate contractual protections, or when AI agents operating with excessive permissions extract and transmit data beyond approved boundaries.

The threat is particularly insidious because AI systems are designed to be helpful—they encourage detailed context in prompts, making it natural for users to include "just enough background" that crosses into Protected territory. Unlike traditional data exfiltration through email or cloud storage (where DLP controls trigger alerts), AI interfaces present novel pathways that may bypass conventional protections if not specifically addressed.

### Attack Vector / Failure Mode

**How it happens:**
1. User copies Protected data from internal systems (PostgreSQL query results, embargoed research notes, draft collaboration agreements)
2. User pastes content into AI service for assistance (summarization, analysis, code generation based on data structure)
3. AI service ingests data, potentially using it for model training or storing in vendor logs beyond RadioAstronomy.io control
4. Data now exists outside security perimeter, potentially accessible to vendor employees, subject to vendor's security posture and legal jurisdiction

**Attacker profile:** 
- **Primary:** Internal user error - well-intentioned researchers seeking productivity, unaware of classification boundaries or vendor data handling practices
- **Secondary:** Compromised AI service accounts - if attacker gains access to authenticated AI sessions, they can exfiltrate data through normal service usage
- **Tertiary:** Malicious insider - deliberate data theft disguised as legitimate AI assistance requests

**Prerequisites:**
- User has authenticated access to both Protected data sources and AI services
- User lacks clear understanding of data classification boundaries
- AI service lacks contractual no-training clauses or adequate DLP integration
- Monitoring insufficient to detect unusual data volumes in AI interactions

### Real-World Examples

- **Samsung semiconductor leak (2023):** Engineers pasted proprietary source code into ChatGPT for debugging assistance, exposing trade secrets. OpenAI's data retention policies meant Samsung could not guarantee code deletion.
- **JPMorgan Chase AI ban (2023):** Preemptive blocking of public AI services after risk assessment identified data leakage potential through financial analyst workflows.
- **RadioAstronomy.io near-miss (2025-Q3):** User prepared to paste 50+ lines of DESI data structure into Claude for schema optimization suggestions. Caught during peer review when colleague asked "is that data public?" User genuinely believed data structure (not data values) was safe to share.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | Medium | Potential exposure of researcher personal information if embedded in collaboration datasets; limited PII in astronomy research context |
| Operational Disruption | Medium | Collaboration agreement violations could result in dataset access revocation, halting active research projects dependent on DESI data |
| Reputational Damage | High | Loss of trusted researcher status in astronomy community; demonstrates inability to handle sensitive datasets responsibly |
| Financial Impact | Medium | Cost to remediate ($5-10K for legal review, notification, vendor engagement); potential loss of future collaboration opportunities |
| Regulatory/Compliance | Medium | Violation of data use agreements with DESI collaboration; Colorado SB-24-205 notification obligations if personal data involved |

**Impact Level (CIS-RAM):** Unacceptable

### Cascading Effects

**R2: Secrets Leakage Risk Amplification** - Data egress incidents often include embedded credentials or API keys within dataset documentation or code samples, triggering secondary security incidents.

**R6: Identity & Access Drift** - Post-incident response typically includes emergency permission revocation, creating orphaned access that must be tracked and remediated.

**R8: Legal & Compliance Gaps** - Single data egress incident can trigger review of all collaboration agreements, revealing previously unnoticed gaps in contractual protections.

### Recovery Complexity

- **Time to detect:** Hours to days (depends on DLP alerting and user self-reporting)
- **Time to contain:** Hours (requires vendor engagement to request data deletion; no guarantee of success with public AI services)
- **Time to recover:** Days to weeks (legal review of collaboration agreement breach, remediation planning, notification to affected parties, restoration of trust)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Data Loss Prevention (DLP) | CIS 3.3 (Configure Data Access Control Lists) | Kasm Workspaces with clipboard controls; monitors copy/paste from Protected systems to external services | ✅ Implemented |
| Inside-Perimeter AI | CIS 3.12 (Segment Data Processing) | Claude Max, Gemini Enterprise deployed within secure enclave; no internet egress for Protected data interactions | ✅ Implemented |
| No-Training Contract Clauses | CIS 15.3 (Manage Third-Party Service Providers) | All approved AI vendors have contractual no-training, no-retention clauses for user inputs | ✅ Implemented |
| Data Classification Labels | CIS 3.2 (Establish and Maintain Data Inventory) | PostgreSQL databases tagged with classification metadata; visual indicators in database clients | ✅ Implemented |
| Export Approval Workflow | Custom (Process Control) | Protected data export requires Security Lead approval with documented business justification | ✅ Implemented |
| Network Segmentation | CIS 12.2 (Establish and Maintain Network Segmentation) | VLAN isolation (10.25.20.0/24 compute, 10.25.10.0/24 management); NetBird ZTNA enforces perimeter | ✅ Implemented |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| AI Service Access Logging | CIS 8.2 (Collect Audit Logs) | All AI service authentication events logged to Wazuh SIEM; searchable by user, timestamp, service | ✅ Implemented |
| Kasm Session Recording | CIS 8.11 (Conduct Audit Log Reviews) | Kasm sessions with AI access recorded; available for post-incident review (not real-time monitored) | ✅ Implemented |
| Unusual Volume Alerts | CIS 8.5 (Collect Detailed Audit Logs) | Prometheus alerting on abnormal AI API usage patterns (>500 requests/day per user) | 🟡 Partial |
| Database Access Anomaly Detection | CIS 8.11 (Conduct Audit Log Reviews) | PostgreSQL audit logs analyzed quarterly for unusual export patterns | 🟡 Partial |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Vendor Data Deletion Requests | CIS 15.3 (Manage Third-Party Service Providers) | Documented process to request data deletion from AI vendors; SLA tracking | ✅ Implemented |
| Incident Response Playbook | CIS 17.1 (Designate Personnel for Incident Handling) | Data egress incident runbook with notification requirements, containment steps, lessons learned template | ✅ Implemented |
| User Access Suspension | CIS 5.3 (Disable Dormant Accounts) | Automated workflow to suspend AI service access pending investigation; requires ARO approval for restoration | ✅ Implemented |
| Collaboration Partner Notification | Custom (Legal/Compliance) | Template communications for dataset owners when their data potentially exposed | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **Data Classification Training (Quarterly):** All personnel with Protected data access complete 30-minute training covering classification criteria, examples of Protected content, and safe AI interaction patterns. Training includes scenario-based decision making ("Can I paste this into Claude?").

- **Peer Review for Complex Queries:** Users are encouraged (not mandated) to have colleagues review AI prompts when working with unfamiliar datasets or complex data transformations. Creates informal safety net without impeding productivity.

- **Export Approval Workflow:** Any movement of Protected data outside secure enclave requires documented business justification reviewed by Security Lead. Approval includes specific controls required (encryption, access restrictions, retention limits) and expiration date.

### Approval Workflows

- **Required approvals:** Security Lead approves all Protected data export requests; CTO approval required for exports to new vendors or collaborators
- **Escalation path:** Export denials can be appealed to Review Board; emergency export requests escalate to CTO with 4-hour SLA

### Training Requirements

- **Who needs training:** All personnel with Protected data access (researcher role, engineering role, operations role)
- **Training content:** Data classification decision tree, AI service contractual protections, DLP tool usage, incident reporting procedures, real-world examples of data egress scenarios
- **Frequency:** Quarterly refresher (15 minutes); comprehensive training at onboarding (60 minutes) and after any data egress incident

---

## 5. Architectural Safeguards

### Design Principles

**Inside-Perimeter AI Strategy:** RadioAstronomy.io deploys enterprise AI services (Claude Max, Gemini Enterprise) within the secure research enclave rather than relying on public web interfaces. This architectural decision means Protected data never traverses public internet to reach AI services—all interactions occur within controlled network boundaries with contractual no-training clauses.

**Defense-in-Depth Layers:** Single control failure does not result in data exposure. DLP at endpoint (Kasm), network segmentation at perimeter (NetBird ZTNA), contractual protections at vendor (no-training clauses), and process controls at human layer (training, peer review) create overlapping safeguards.

**Fail-Safe Defaults:** When classification is ambiguous, default to treating data as Protected until proven Public. When DLP blocks legitimate workflow, escalate to Security Lead rather than disabling controls.

### Network Segmentation

- **Compute VLAN (10.25.20.0/24):** Hosts Protected datasets on proj-pgsql01/02; isolated from internet egress
- **Management VLAN (10.25.10.0/24):** Administrative access only; no Protected data storage
- **NetBird ZTNA:** All external AI service access routes through zero-trust gateway with Google Workspace authentication; logs all connections
- **Firewall Rules:** Explicit deny for direct internet access from database servers; allows only approved AI service endpoints

### Data Classification

- **Public:** DESI data released in annual data releases; published research papers; open-source code
- **Protected:** Pre-release DESI datasets; embargoed research findings; collaboration agreements; internal operational documentation
- **Secrets:** Credentials, API keys, certificates (not handled through AI systems)

**Boundary Enforcement:** PostgreSQL row-level security enforces classification metadata; users cannot query Protected data without explicit role membership. Kasm DLP configured with Protected data regex patterns (e.g., DESI target IDs, collaboration agreement boilerplate).

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| DLP-001 | Kasm Clipboard Controls | Operations Lead | Configuration Export | Kasm admin console → Policies → DLP Settings | Quarterly |
| NET-001 | NetBird ZTNA Logs | Security Lead | Access Logs | Wazuh SIEM → NetBird index | Weekly |
| PROC-001 | Export Approvals | Security Lead | SharePoint Approval Records | SharePoint → AI Governance → Export Requests | Quarterly Audit |
| TRAIN-001 | Data Classification Training | Operations Lead | LMS Completion Records | Google Workspace → Training Tracker | Quarterly |
| CONTRACT-001 | No-Training Clauses | CTO | Contract Amendments | SharePoint → Legal → Vendor Contracts → AI Services | Annual Review |
| LOG-001 | AI Service Access Logs | Security Lead | Authentication Logs | Wazuh SIEM → AI Services index | Weekly |
| DB-001 | PostgreSQL RLS Policies | Security Lead | Database Configuration | proj-pgsql01 → pg_policies system catalog | Quarterly |

### Testing Procedures

- **Test scenario:** User attempts to copy Protected data (DESI query result) from Kasm session running database client, paste into external AI service web interface
- **Expected result:** DLP blocks clipboard operation; alert generated to Security Lead; user receives notification explaining classification violation
- **Test frequency:** Quarterly DLP effectiveness test using test accounts and synthetic Protected data patterns

### Audit Trail

**Pre-Incident Evidence:**
- NetBird connection logs: `timestamp, user_id, source_ip, destination_service, bytes_transferred`
- AI service authentication logs: `timestamp, user_id, service, auth_method, success/failure`
- Kasm session metadata: `session_id, user_id, duration, applications_accessed, clipboard_events`
- Export approval records: `request_id, requestor, data_classification, justification, approver, decision, timestamp`

**Post-Incident Evidence:**
- DLP violation logs: `timestamp, user_id, source_application, destination_application, blocked_content_hash, user_notification_sent`
- Incident response timeline: `detection_time, containment_time, notification_time, resolution_time`
- Vendor data deletion confirmation: `request_id, vendor, data_description, deletion_confirmed_date, confirmation_evidence`

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map 5.1:** Organizational risk tolerances are determined and documented → Data egress defined as "Unacceptable" impact in risk register
- **Measure 2.7:** AI system security and resilience practices are documented → This risk scenario documents DLP, network segmentation, contractual controls
- **Measure 2.11:** Fairness is evaluated → N/A for data egress (no discriminatory impact)
- **Manage 2.3:** Mechanisms are established to enable AI actors to regularly incorporate adjudicated feedback → Data egress incidents trigger policy review and control enhancement
- **Govern 1.4:** Organizational policies for AI system use are established → Data classification and export approval policies address data egress risk

### NIST Trustworthiness Characteristics

- ✅ Valid and Reliable - Ensures AI operates on appropriate datasets
- ✅ Safe - Prevents operational harm from data exposure
- ✅ Secure and Resilient - DLP, network segmentation, contractual protections
- ✅ Accountable and Transparent - Audit logs, export approvals, incident response
- ⬜ Explainable and Interpretable - N/A for data protection risk
- ✅ Privacy-Enhanced - Core objective of data egress controls
- ⬜ Fair (Bias-Free) - N/A for data protection risk

### Colorado SB-24-205 Compliance

**Not a high-risk system** under Colorado definition (no consequential decisions affecting individuals), however:

- **§ 6-1-1703(2)(a):** If RadioAstronomy.io deployed high-risk AI using Protected datasets, this risk scenario demonstrates due care in preventing discriminatory outcomes through data protection
- **§ 6-1-1706(1)(b):** Impact assessment requirement satisfied through this risk scenario documentation
- **§ 6-1-1707(2)(a):** If personal data involved in egress incident, notification obligations triggered within 90 days of discovery

### ISO 42001 Mapping

- **6.1.2.1:** Data management (protection of training and operational data) → DLP, classification, network segmentation
- **6.1.2.2:** Data quality → Protected data integrity maintained through access controls
- **6.1.3.2:** Log management → Comprehensive audit logging of AI service access
- **6.1.3.3:** Information security → CIS Controls v8.1 baseline implementation

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| System Owner | Ensure all systems processing Protected data comply with data classification policy; verify DLP controls operational before production deployment; conduct quarterly review of export approval logs |
| Security Lead | Approve all Protected data export requests; investigate DLP violations within 24 hours; maintain vendor contract register with no-training clause status; conduct quarterly DLP effectiveness testing |
| Operations Lead | Configure and monitor Kasm DLP policies; respond to DLP violation alerts; maintain training materials and track completion; provide user support for legitimate workflow blocked by DLP |
| ARO | Accept residual risk for data egress after controls implemented; approve exceptions to export approval workflow when business justification compelling; review data egress incidents and approve lessons learned |
| All Personnel | Complete data classification training; apply classification labels to new datasets; obtain approval before exporting Protected data; report suspected data egress incidents immediately |

**Primary Owner:** Security Lead (ultimate accountability for data protection controls)

---

## 9. Incident Response

### Detection Indicators

- DLP alert: Clipboard operation blocked between internal system and external AI service
- Unusual AI service usage: User API calls >500/day when typical usage <100/day
- User self-report: "I think I accidentally pasted Protected data into ChatGPT"
- Vendor notification: AI service provider alerts to unusual data volume from RadioAstronomy.io account
- Collaboration partner inquiry: Dataset owner asks "did you share our data with third parties?"

### Immediate Response Steps

1. **Containment (within 1 hour of detection):**
   - Suspend affected user's AI service access immediately via automated workflow
   - Capture affected session logs from Kasm, NetBird, AI service authentication records
   - Identify scope: Which datasets accessed in 24 hours prior to incident? Classification level?

2. **Assessment (within 4 hours of detection):**
   - Interview user to understand what data was shared and with which service
   - Review vendor contract for data deletion rights and procedures
   - Determine if personal data involved (triggers Colorado notification obligations)
   - Assess if collaboration agreement violated (requires partner notification)

3. **Notification (timing depends on severity):**
   - Internal: Notify CTO and ARO immediately; Review Board within 24 hours
   - Vendor: Submit data deletion request per vendor's published procedure (SLA tracking required)
   - External: If collaboration agreement violated, notify partner within 48 hours per agreement terms
   - Regulatory: If personal data and high-risk system involved, Colorado AG notification within 90 days per SB-24-205

### Communication Plan

- **Internal:** 
  - Immediate: Slack alert to #security-incidents channel
  - 24 hours: Email to CTO, ARO, Review Board with incident summary
  - Weekly: Status updates until incident closed
  - 30 days post-incident: Lessons learned presentation to all staff

- **External:** 
  - Collaboration partners: Use template notification letter, include incident timeline, data scope, remediation actions, point of contact for questions
  - Vendors: Submit deletion request using vendor's designated process; escalate to account manager if no response within vendor's SLA
  - Colorado AG: If applicable, formal Impact Assessment disclosure per SB-24-205 Section 6-1-1706

### Post-Incident Actions

- [ ] Root cause analysis: Why did user believe data was safe to share? Control failure or training gap?
- [ ] Control hardening: Update Kasm DLP rules based on actual data patterns that bypassed detection
- [ ] Policy update if needed: Clarify ambiguous classification guidance that contributed to incident
- [ ] Lessons learned documentation: Add incident as training scenario; update data egress playbook with new edge cases discovered
- [ ] User remediation: Determine if additional training sufficient or if access restrictions required
- [ ] Vendor relationship review: If deletion request handled poorly, consider vendor replacement

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (copy/paste errors are frequent human behavior; AI interfaces encourage detailed context)
- **Safeguard Reliability:** High (multiple independent controls: DLP, inside-perimeter AI, network segmentation, contractual protections, training)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Unacceptable Impact × Very High Expectancy (common threat, no controls) = 8/10
- **Qualitative Rating:** High

**Residual Risk:**
- **Calculated Score:** Unacceptable Impact × Low Expectancy (common threat, high reliability safeguards) = 3/10
- **Qualitative Rating:** Low

### Risk Treatment Decision

**Treatment:** Mitigate (implement multiple layered controls to reduce risk to acceptable level)

**Rationale:** 

Data egress represents one of the highest inherent risks in AI-assisted research workflows because Protected datasets are the core value of RadioAstronomy.io's work. Loss of trusted researcher status in the astronomy community would be organizationally catastrophic, and collaboration agreement violations could result in dataset access revocation that halts active research projects.

However, the organization cannot eliminate this risk entirely without abandoning AI productivity tools, which would create competitive disadvantage and reduce research output quality. Therefore, mitigation through defense-in-depth is the appropriate strategy.

RadioAstronomy.io implements:
1. **Technical Controls:** DLP at endpoint, network segmentation at perimeter, inside-perimeter AI deployment
2. **Contractual Controls:** No-training clauses with all AI vendors, legally enforceable data deletion rights
3. **Process Controls:** Export approval workflow, peer review culture, quarterly training
4. **Architectural Controls:** Compute VLAN isolation, zero-trust network access, fail-safe defaults

These overlapping controls reduce expectancy from "Very High" (inherent) to "Low" (residual), bringing risk into "Acceptable" range per organizational risk tolerance. Residual risk primarily consists of:
- Sophisticated social engineering attacks targeting user training gaps
- DLP bypass through encoding or obfuscation of Protected data
- Vendor contract breach (vendor uses data despite no-training clause)

These residual scenarios are either rare (sophisticated attacks) or contractually actionable (vendor breach), making the remaining risk acceptable given the productivity and research quality benefits of AI tool access.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: new AI vendor added, DLP incident occurs, collaboration agreement changed)
- **Conditions:** 
  - DLP effectiveness tested quarterly with synthetic Protected data
  - All personnel complete data classification training within 30 days of Protected data access grant
  - Export approval workflow audit conducted quarterly
  - Any DLP violation triggers immediate incident response and lessons learned review
  - Vendor contracts reviewed annually to ensure no-training clauses remain in effect

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on RadioAstronomy.io operational controls and near-miss incident | David Thompson |
