# R4: PR Poisoning & Infrastructure Drift

**Risk ID:** R4  
**Risk Slug:** pr-poisoning-infrastructure-drift  
**System Context:** All infrastructure code managed through GitHub (Ansible playbooks, Terraform configs, CI/CD pipelines, container definitions)  
**Category:** Operational  
**Data Classes Involved:** Protected (infrastructure configurations), Secrets (if improperly committed)  
**Consequential Decision:** No - Infrastructure management  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** New repository added | Branch protection change | Review process modification | Infrastructure drift incident | Quarterly review

---

## 1. Threat Description

### What Could Go Wrong?

Infrastructure configuration drift occurs when unauthorized, inadequately reviewed, or AI-hallucinated changes are merged into production systems through pull request workflows. Unlike traditional security breaches that involve explicit exploitation, infrastructure drift manifests as gradual degradation of security posture through accumulated misconfigurations—each individually plausible, collectively dangerous.

AI-assisted development amplifies this risk because AI coding assistants can generate syntactically correct but operationally hazardous configurations. When developers accept AI suggestions without thorough review, or when AI agents directly commit to repositories, risks include: disabled security controls presented as "performance optimizations," overly permissive firewall rules that "just work," credential management shortcuts that bypass Vault, or monitoring blind spots introduced by configuration simplifications.

The "PR poisoning" attack vector involves an attacker (external or malicious AI output) submitting pull requests containing:
1. **Subtle Security Degradation:** Changes that individually appear reasonable but collectively weaken security posture
2. **Time-Bomb Configurations:** Valid configurations that create vulnerabilities only under specific future conditions
3. **Monitoring Evasion:** Modifications that disable alerting or logging for subsequent malicious activity
4. **Automation Fatigue Exploitation:** Voluminous changes designed to overwhelm reviewers, hiding malicious modifications among legitimate updates

### Attack Vector / Failure Mode

**How it happens:**

1. **AI-Generated Misconfiguration:**
   - Developer asks Claude/Copilot to "optimize Ansible playbook for faster execution"
   - AI suggests removing SSH key validation checks as "unnecessary overhead"
   - Developer accepts suggestion without recognizing security implications
   - Pull request created with weakened security controls

2. **Automated Agent Commits:**
   - Dependency update agent (Dependabot, Renovate) proposes package upgrades
   - Upgraded package introduces breaking changes requiring configuration modifications
   - Developer applies AI-suggested fixes to make tests pass
   - Fixes include relaxed security constraints that "resolve the compatibility issue"

3. **Review Process Bypass:**
   - Large infrastructure refactoring PR (500+ lines changed)
   - Reviewer focuses on functional correctness, overlooks security implications
   - Hidden within legitimate changes: firewall rule allowing 0.0.0.0/0 instead of specific IPs
   - Approved due to automation fatigue, PR appears to pass all automated tests

4. **Cumulative Drift:**
   - Multiple small PRs over time, each individually acceptable
   - No single PR disables security, but aggregate effect is compromised posture
   - Example sequence: PR1 extends credential rotation from 90 to 120 days, PR2 adds exception for "legacy system," PR3 adds another exception, PR4 disables rotation alerting as "too noisy"

**Attacker profile:** 
- **Primary:** Internal user error - developers trusting AI suggestions without adequate review
- **Secondary:** Automation fatigue - reviewers overwhelmed by change volume, miss security implications
- **Tertiary:** Malicious actor - external attacker or insider submitting poisoned PRs disguised as legitimate improvements

**Prerequisites:**
- Infrastructure managed as code in GitHub repositories
- AI coding assistants with write access or developer trust in AI suggestions
- Insufficient branch protection or review rigor
- Lack of automated security testing in CI/CD pipeline
- Inadequate monitoring of configuration drift over time

### Real-World Examples

- **CircleCI SSH Key Exposure (2023):** Configuration change in CI/CD pipeline inadvertently logged SSH private keys in build output. Passed review because "just added more verbose logging for debugging." Exposed thousands of customer credentials.
- **Toyota Leaked Credentials (2023):** Infrastructure code committed with hardcoded AWS keys, remained undetected for 5 years. Original developer accepted AI suggestion to "simplify configuration" by embedding credentials.
- **RadioAstronomy.io near-miss (2025-Q2):** Developer accepted Copilot suggestion to "streamline Ansible Vault usage" that would have stored PostgreSQL passwords in plaintext environment variables. Caught during peer review when reviewer questioned why Vault references were removed.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | Low | No direct individual impact unless drift enables data breach (then cascades to High) |
| Operational Disruption | High | Misconfigured infrastructure causes service outages, failed deployments, broken automation—recovery 4-24 hours depending on drift severity |
| Reputational Damage | Medium | Demonstrates inadequate change management; loss of infrastructure reliability reputation; embarrassment if security degradation publicly disclosed |
| Financial Impact | High | Emergency remediation costs ($10-15K); potential infrastructure rebuild if drift extensive; lost productivity during outage recovery |
| Regulatory/Compliance | High | CIS Controls v8.1 violation (Control 4.1: Secure Configurations); demonstrates governance failure; could trigger compliance audit |

**Impact Level (CIS-RAM):** Unacceptable

### Cascading Effects

**R2: Secrets Leakage** - Infrastructure drift often includes credential management shortcuts, enabling subsequent secrets exposure.

**R6: Identity & Access Drift** - Configuration changes that relax RBAC boundaries or extend credential lifetimes amplify identity management risks.

**R10: Logging Blind Spots** - Drift frequently involves disabling "noisy" monitoring and alerting, creating detective control gaps.

**R1: Data Egress** - Firewall rule misconfigurations or DLP control degradation enable data exfiltration.

### Recovery Complexity

- **Time to detect:** Hours to weeks (depends on infrastructure testing rigor, configuration drift monitoring, and incident that exposes the misconfiguration)
- **Time to contain:** Hours (revert problematic commit, redeploy known-good configuration)
- **Time to recover:** Days to weeks (comprehensive infrastructure audit to identify all drift, systematic remediation, validation testing, trust restoration in automation)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Branch Protection Rules | CIS 4.1 (Establish and Maintain Secure Configurations) | GitHub branch protection: main branch requires PR approval, no force push, status checks must pass | ✅ Implemented |
| Mandatory Code Review | CIS 4.1 (Establish and Maintain Secure Configurations) | All infrastructure changes require peer review by someone other than author; Security Lead review for sensitive changes | ✅ Implemented |
| Automated Security Testing | CIS 18.3 (Remediate Penetration Test Findings) | GitHub Actions runs: ansible-lint, terraform validate, checkov security scanning, secret scanning on all PRs | ✅ Implemented |
| Configuration Drift Detection | CIS 4.2 (Baseline Configurations) | Ansible playbooks idempotent; weekly runs detect configuration drift from desired state; alerts on deviations | 🟡 Partial |
| GitOps Workflow | CIS 4.1 (Establish and Maintain Secure Configurations) | All infrastructure changes via Git; no manual SSH configuration changes; audit trail for all modifications | ✅ Implemented |
| AI Suggestion Review Policy | Custom (AI-Specific) | Policy requires human verification of AI-generated infrastructure code; explicit review of security implications | ✅ Implemented |
| PR Size Limits | Custom (Process Control) | Infrastructure PRs >200 lines require additional reviewer and security assessment; discourages overwhelming reviewers | 🟡 Partial |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Infrastructure Testing | CIS 18.1 (Establish Penetration Testing Program) | Automated testing in staging environment before production merge; validates functionality and security controls | ✅ Implemented |
| Configuration Compliance Scanning | CIS 4.1 (Establish and Maintain Secure Configurations) | Weekly Wazuh scans comparing actual system configs against CIS Benchmarks; alerts on deviations | ✅ Implemented |
| Security Control Validation | CIS 4.2 (Baseline Configurations) | Monthly validation that critical security controls remain enabled (SSH key auth, firewall rules, logging, MFA) | 🟡 Partial |
| Commit Audit Trail | CIS 8.2 (Collect Audit Logs) | All Git commits logged with author, timestamp, files changed, approver; retained for compliance evidence | ✅ Implemented |
| Reviewer Activity Monitoring | Custom (Process Control) | Track review thoroughness (time spent, comments made, approval patterns); identify automation fatigue | ❌ Planned |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Configuration Rollback | CIS 11.3 (Protect Recovery Data) | Git history enables instant rollback to any previous configuration state; tested quarterly | ✅ Implemented |
| Infrastructure Audit | CIS 4.2 (Baseline Configurations) | Post-incident comprehensive audit comparing current configs to security baselines; identify all drift | ✅ Implemented |
| Emergency Change Control | CIS 4.1 (Establish and Maintain Secure Configurations) | Expedited review process for critical security fixes; security-fix branch bypasses some automated gates with enhanced human review | ✅ Implemented |
| Lessons Learned Process | CIS 17.9 (Conduct Post-Incident Reviews) | Blameless postmortem after infrastructure incidents; updates review procedures, testing, or training based on findings | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **Security-Focused Code Review:** Infrastructure reviewers trained to look beyond functional correctness to security implications. Review checklist includes: Are credentials properly managed? Are firewall rules least-privilege? Are logging and monitoring preserved? Are security controls strengthened or weakened?

- **AI Suggestion Skepticism:** Policy explicitly requires human verification of AI-generated infrastructure code. Questions reviewers must ask: Why is AI suggesting this specific approach? What are security trade-offs? Does this align with organizational security standards? Could this be hallucinated or subtly malicious?

- **Incremental Change Philosophy:** Large infrastructure refactorings broken into smaller PRs (preferably <200 lines each). Enables more thorough review, easier rollback if issues discovered, reduces cognitive load on reviewers.

- **Staging Environment Validation:** All infrastructure changes deployed to staging environment first, tested for 24+ hours before production merge. Catches functional issues and provides window for security assessment under realistic conditions.

### Approval Workflows

- **Required approvals:** 
  - Standard infrastructure changes: 1 peer reviewer (must have infrastructure write permissions)
  - Security-sensitive changes (firewall rules, credential management, access controls, logging configuration): Security Lead approval required
  - Architectural changes affecting multiple systems: Review Board discussion and approval

- **Escalation path:** Reviewer unsure about security implications → escalate to Security Lead → Security Lead performs deep review → approves, requests modifications, or escalates to Review Board for architectural discussion

### Training Requirements

- **Who needs training:** All personnel with infrastructure repository write permissions; all code reviewers
- **Training content:** Secure infrastructure patterns (CIS Benchmarks), common AI hallucination patterns in infrastructure code, code review security checklist, GitOps workflow, configuration drift detection tools, incident response for infrastructure issues
- **Frequency:** Quarterly refresher (30 minutes); comprehensive training at onboarding (90 minutes); emergency training after any infrastructure drift incident

---

## 5. Architectural Safeguards

### Design Principles

**Infrastructure as Code (IaC):** All RadioAstronomy.io infrastructure configurations managed in Git repositories. This architectural decision provides: version control (audit trail of all changes), code review workflow (peer verification before application), automated testing (security scanning in CI/CD), instant rollback (revert to any previous state), disaster recovery (rebuild entire infrastructure from Git).

**GitOps Enforcement:** Manual SSH configuration changes prohibited; all modifications via Git. This prevents untracked drift and ensures every change has approver accountability. Ansible playbooks run in check mode weekly to detect manual modifications that violate GitOps principle.

**Defense-in-Depth Validation:** Multiple independent validation layers: (1) automated security scanning (ansible-lint, checkov), (2) peer review (human judgment), (3) staging environment testing (catches runtime issues), (4) configuration drift detection (catches post-merge deviations), (5) CIS Benchmark compliance scanning (validates security posture). Single layer failure does not result in production security degradation.

### Network Segmentation

- **Management VLAN (10.25.10.0/24):** Hosts Ansible controller (proj-ansible01) where infrastructure code executes; isolated from compute nodes to limit blast radius of misconfiguration
- **Staging Environment:** Separate infrastructure for testing changes before production; allows validation without production risk
- **Jump Host Pattern:** All infrastructure modifications route through proj-ansible01 with full audit logging; no direct SSH from developer workstations to production servers

### Data Classification

**Infrastructure Code Classification:**
- **Public:** General Ansible playbook structure, role templates, publicly documented configurations
- **Protected:** System-specific configurations (IP addresses, hostnames, service architectures), production deployment playbooks
- **Secrets:** Ansible Vault files containing credentials (never in Git plaintext; encrypted at rest)

**Separation Enforcement:** Secrets never committed to Git unencrypted; pre-commit hooks scan for credential patterns; GitHub Secret Scanning provides backstop detection.

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| BRANCH-001 | Branch Protection Rules | Security Lead | GitHub Configuration Export | GitHub Enterprise → Settings → Branch Protection | Monthly |
| REVIEW-001 | Mandatory Code Review | Operations Lead | PR Approval Logs | GitHub Enterprise → Pull Requests → Merged PRs | Weekly Sample |
| SCAN-001 | Automated Security Testing | Security Lead | GitHub Actions Workflow Results | GitHub Enterprise → Actions → Workflow Runs | Per PR |
| DRIFT-001 | Configuration Drift Detection | Operations Lead | Ansible Check Mode Reports | proj-ansible01 → /var/log/ansible/check-mode-reports | Weekly |
| GITOPS-001 | GitOps Enforcement | Operations Lead | SSH Session Logs | Wazuh SIEM → SSH Access index (should show no manual config changes) | Monthly |
| TEST-001 | Staging Validation | Operations Lead | Staging Deployment Logs | GitHub Actions → staging-deploy workflow results | Per PR |
| AUDIT-001 | CIS Benchmark Compliance | Security Lead | Wazuh Compliance Reports | Wazuh → Compliance → CIS Benchmarks | Weekly |

### Testing Procedures

- **Test scenario 1 (Branch Protection):** User attempts to force-push to main branch or merge without PR approval
- **Expected result:** Git push rejected; error message explains branch protection rules
- **Test frequency:** Quarterly using test developer account

- **Test scenario 2 (Security Scanning):** Submit PR containing deliberately insecure configuration (hardcoded password, overly permissive firewall rule)
- **Expected result:** GitHub Actions workflow fails; checkov or ansible-lint catches security issue; PR cannot merge until fixed
- **Test frequency:** Quarterly using test repository

- **Test scenario 3 (Configuration Drift Detection):** Manually modify production server configuration via SSH (change SSH port, disable service)
- **Expected result:** Weekly Ansible check mode run detects deviation; alert generated; manual change documented in deviation report
- **Test frequency:** Quarterly in staging environment (never in production)

- **Test scenario 4 (Rollback):** Merge configuration change that breaks service; execute emergency rollback
- **Expected result:** Git revert command executed; previous configuration restored within 15 minutes; service recovered
- **Test frequency:** Quarterly disaster recovery drill

### Audit Trail

**Pre-Incident Evidence:**
- Git commit history: `commit_hash, author, timestamp, files_changed, commit_message, approver, PR_number`
- PR review comments: `PR_id, reviewer, comment_text, timestamp, files_discussed`
- GitHub Actions results: `workflow_run_id, PR_number, tests_run, scan_results, pass/fail, timestamp`
- Ansible deployment logs: `playbook, execution_time, changes_made, host, result, user`
- Drift detection reports: `scan_date, hosts_checked, deviations_found, deviation_details`

**Post-Incident Evidence:**
- Infrastructure audit findings: `audit_date, systems_reviewed, security_gaps_found, gap_severity, remediation_plan`
- Rollback timeline: `incident_detection, rollback_decision, rollback_execution, validation_complete, service_restored`
- Postmortem documentation: `incident_date, root_cause, contributing_factors, lessons_learned, control_enhancements`

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map 1.1:** Organizational context and priorities are determined → GitOps workflow reflects organizational priority on infrastructure reliability and security
- **Measure 2.7:** AI system security and resilience practices are documented → Infrastructure drift detection, AI suggestion review policy
- **Measure 4.1:** Feedback processes for end users and impacted communities are established → Postmortem process enables learning from infrastructure incidents
- **Manage 2.3:** Mechanisms are established to enable AI actors to regularly incorporate adjudicated feedback → Lessons learned feed into review procedures and testing enhancements
- **Govern 2.1:** Accountability structures are in place → Clear approver roles, Security Lead oversight, Review Board escalation

### NIST Trustworthiness Characteristics

- ✅ Valid and Reliable - Prevents configuration drift that would cause unreliable infrastructure operation
- ✅ Safe - Protects against misconfigurations that could cause service disruption or security incidents
- ✅ Secure and Resilient - Core objective of preventing security control degradation
- ✅ Accountable and Transparent - Git audit trail provides complete accountability for all infrastructure changes
- ⬜ Explainable and Interpretable - N/A for infrastructure management
- ✅ Privacy-Enhanced - Prevents misconfigurations that could expose Protected data
- ⬜ Fair (Bias-Free) - N/A for infrastructure management

### Colorado SB-24-205 Compliance

**Not applicable** - Infrastructure management does not involve consequential decisions affecting individuals

However, infrastructure drift could enable violations of SB-24-205 if it:
- Disables logging required for impact assessment evidence
- Weakens security controls protecting high-risk AI systems
- Creates blind spots preventing algorithmic discrimination detection

### ISO 42001 Mapping

- **6.1.3.1:** Access control → Branch protection rules, mandatory code review
- **6.1.3.2:** Log management → Git commit audit trail, deployment logs
- **6.1.3.3:** Information security → CIS Benchmark compliance scanning, configuration drift detection
- **7.2:** Competence → Training requirements for infrastructure reviewers
- **8.2:** Change management → GitOps workflow, staging validation, rollback procedures

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| System Owner | Ensure all infrastructure under their control managed via GitOps; verify no manual SSH configuration changes; conduct quarterly review of configuration drift reports |
| Security Lead | Review and approve security-sensitive infrastructure changes; maintain branch protection rules; investigate drift detection alerts; conduct monthly CIS Benchmark compliance review; approve exceptions to PR size limits |
| Operations Lead | Execute Ansible playbooks for infrastructure deployment; monitor drift detection reports; maintain staging environment; provide reviewer training; respond to infrastructure incidents within SLA |
| ARO | Accept residual risk for infrastructure drift scenarios; approve architectural changes affecting multiple systems; review postmortem findings and approve control enhancements; ensure infrastructure change management aligns with organizational risk tolerance |
| All Infrastructure Developers | Follow GitOps workflow for all changes; obtain peer review before merge; verify AI suggestions for security implications; deploy to staging before production; participate in postmortem process |

**Primary Owner:** Operations Lead (ultimate accountability for infrastructure reliability and configuration management)

---

## 9. Incident Response

### Detection Indicators

- GitHub Actions workflow fails: Security scanning detects misconfiguration in PR
- Configuration drift alert: Weekly Ansible check mode finds deviation from desired state
- Service disruption: Infrastructure change causes operational failure (service down, broken authentication, networking issue)
- CIS Benchmark violation: Wazuh compliance scan identifies security control degradation
- User report: "Something changed in the infrastructure and now X doesn't work"
- Security incident: Misconfiguration exploited by attacker (overly permissive firewall rule, disabled logging)

### Immediate Response Steps

1. **Assessment (within 1 hour of detection):**
   - Identify the problematic change: Review recent merged PRs (Git log for last 7 days)
   - Determine impact: Which systems affected? Service disruption or security degradation?
   - Evaluate urgency: Is this causing active outage? Security exposure? Or latent risk?

2. **Containment (timing depends on severity):**
   - **Critical (service down):** Immediate rollback to last known-good configuration within 15 minutes
   - **High (security exposure):** Rollback within 2 hours after verifying rollback won't cause additional disruption
   - **Medium (latent risk):** Scheduled fix within 24 hours with proper review process

3. **Remediation (within 4 hours for critical, 24 hours for high, 1 week for medium):**
   - Execute Git revert for problematic commit
   - Deploy corrected configuration via Ansible
   - Validate fix in staging environment
   - Deploy to production with enhanced monitoring
   - Verify service restoration and security controls operational

4. **Verification (within 24 hours of remediation):**
   - Run comprehensive infrastructure audit comparing current state to security baselines
   - Identify any additional drift introduced during incident response
   - Confirm all CIS Benchmark controls pass compliance scanning
   - Test affected functionality end-to-end

### Communication Plan

- **Internal:** 
  - Immediate: Slack alert to #infrastructure channel with affected systems and estimated resolution time
  - 2 hours: Email to CTO, ARO, Review Board if security degradation or prolonged outage
  - 24 hours: Incident report with timeline, root cause, remediation actions
  - 1 week: Postmortem presentation to engineering team with lessons learned

- **External:** 
  - Collaboration partners: If infrastructure issue affects partner data access or violates SLA, notify within 4 hours
  - Users: If service disruption expected >4 hours, status page update and estimated restoration time
  - Colorado AG: Not applicable unless infrastructure drift enables high-risk AI system violation

### Post-Incident Actions

- [ ] Root cause analysis: Was this AI hallucination accepted without adequate review? Automation fatigue? Insufficient testing? Malicious PR?
- [ ] Control hardening: Enhance automated security scanning to catch similar issues; update review checklist; improve staging test coverage
- [ ] Policy update if needed: Clarify review requirements for specific configuration types; adjust PR size limits; enhance AI suggestion review guidance
- [ ] Lessons learned documentation: Add incident as training case study; update infrastructure troubleshooting runbooks; document new drift patterns to monitor
- [ ] Reviewer coaching: If incident resulted from inadequate review, provide additional training to responsible reviewer (blameless, focused on skill development)
- [ ] Testing enhancement: Add new test cases to CI/CD pipeline that would have caught this specific misconfiguration

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (developers regularly make configuration mistakes; AI suggestions frequently include subtle security trade-offs; automation fatigue is pervasive in DevOps)
- **Safeguard Reliability:** High (GitOps workflow, mandatory review, automated scanning, drift detection, staging validation create multiple independent layers)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Unacceptable Impact × Very High Expectancy (common threat, no controls) = 8/10
- **Qualitative Rating:** High

**Residual Risk:**
- **Calculated Score:** Unacceptable Impact × Low Expectancy (common threat, high reliability safeguards) = 3/10
- **Qualitative Rating:** Low

### Risk Treatment Decision

**Treatment:** Mitigate (implement defense-in-depth to reduce risk to acceptable level)

**Rationale:** 

Infrastructure configuration drift represents a significant operational risk because accumulated misconfigurations can degrade security posture gradually—each change individually plausible, collectively dangerous. AI-assisted development amplifies this risk by making it easier to generate syntactically correct but operationally hazardous configurations.

RadioAstronomy.io cannot eliminate this risk without abandoning AI-assisted infrastructure development and automation, which would severely reduce operational efficiency. Manual configuration changes would be slower, more error-prone, and lack the audit trail and rollback capabilities that GitOps provides.

Therefore, RadioAstronomy.io implements defense-in-depth strategy with multiple independent validation layers:

1. **Automated Security Scanning:** ansible-lint, checkov, secret scanning catch common misconfigurations before human review
2. **Mandatory Code Review:** Peer and Security Lead review provide human judgment on security implications
3. **Staging Environment Validation:** 24-hour bake time catches runtime issues and provides security assessment window
4. **Configuration Drift Detection:** Weekly Ansible check mode runs detect post-merge deviations from desired state
5. **CIS Benchmark Compliance:** Weekly Wazuh scans validate security controls remain operational
6. **GitOps Enforcement:** Prohibition on manual changes ensures all modifications tracked and auditable
7. **Instant Rollback:** Git history enables 15-minute recovery from problematic configurations

These layered controls reduce expectancy from "Very High" (inherent) to "Low" (residual), bringing risk into "Low" overall range. Residual risk primarily consists of:
- Sophisticated attack where multiple reviewers and automated tools all miss security implications
- Widespread automation fatigue where review quality degrades across entire team
- Cumulative drift scenario where series of individually acceptable changes aggregate to unacceptable security posture
- Configuration time-bombs that don't manifest issues until specific future conditions occur

RadioAstronomy.io accepts this residual risk level because:
- Alternative (manual infrastructure management) would introduce higher operational risk through human error and lack of audit trail
- Defense-in-depth provides reasonable protection against most realistic scenarios
- GitOps enables rapid detection and rollback when issues discovered
- Postmortem process ensures organizational learning from incidents
- Infrastructure reliability and security critical to research mission success

The organization monitors infrastructure drift as key risk indicator, adjusting controls if residual risk proves unacceptable in practice.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: infrastructure drift incident occurs, new infrastructure automation deployed, GitHub branch protection weakened, review process modified)
- **Conditions:** 
  - Branch protection rules maintained on all infrastructure repositories
  - All infrastructure changes require peer review (no self-merge)
  - Security-sensitive changes require Security Lead approval
  - Automated security scanning operational in all GitHub Actions workflows
  - Configuration drift detection runs weekly with <4 hour alert response
  - CIS Benchmark compliance scanning runs weekly with findings triaged
  - Staging environment validation required for all production changes
  - All infrastructure developers complete quarterly training
  - Emergency rollback procedures tested quarterly
  - Postmortem process executed for all infrastructure incidents
  - Review Board conducts annual assessment of infrastructure change management effectiveness
  - Any security degradation incident triggers immediate lessons learned and control enhancement

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on RadioAstronomy.io near-miss (2025-Q2) and operational GitOps controls | David Thompson |
