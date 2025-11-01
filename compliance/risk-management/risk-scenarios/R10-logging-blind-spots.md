# R10: Logging Blind Spots

**Risk ID:** R10  
**Risk Slug:** logging-blind-spots  
**System Context:** All AI systems, infrastructure, and operational workflows requiring audit trails for security, compliance, or investigation  
**Category:** Infrastructure Security  
**Data Classes Involved:** All (inadequate logging affects incident response for all data types)  
**Consequential Decision:** Depends on system - Yes if inability to audit AI decisions affects accountability for consequential decisions  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** Security incident requiring investigation | Compliance audit | New AI system deployment | Major infrastructure change | Annual logging review

---

## 1. Threat Description

### What Could Go Wrong?

Logging blind spots occur when critical events, decisions, or data access activities are not recorded in audit trails, creating gaps in organizational ability to detect security incidents, investigate policy violations, demonstrate compliance, or reconstruct what happened during failures. Unlike traditional applications where logging is architectural feature, AI systems introduce novel logging challenges: model inference decisions are often opaque, distributed API calls fragment audit trails, third-party AI services provide minimal visibility into their processing, and high-velocity AI interactions generate log volumes that overwhelm traditional SIEM systems.

The risk manifests across multiple operational domains:
1. **Security Incident Investigation Failure:** When compromise suspected, inadequate logs prevent determining: What data was accessed? By whom? When? What actions taken? Attackers exploit logging gaps to hide malicious activity.
2. **Compliance Demonstration Gaps:** Regulators require evidence of control implementation; missing logs mean inability to prove (or disprove) compliance with Colorado SB-24-205 notification requirements, GDPR data processing restrictions, or contractual data handling obligations.
3. **AI Decision Accountability Vacuum:** When AI system produces harmful or discriminatory output, inability to reconstruct decision path—what input data used, which model version, what parameters—prevents root cause analysis and remediation.
4. **Operational Troubleshooting Obstruction:** Production failures in AI workflows cannot be debugged without logs showing data flow, API responses, error conditions, and timing.
5. **Forensic Evidence Loss:** Legal disputes (employment discrimination claims, contract breaches, IP infringement allegations) require log evidence; gaps render organization unable to defend itself or substantiate claims.

For research organizations deploying AI at scale, logging gaps create asymmetric accountability: when things go right, no one notices missing logs; when things go wrong, absence of evidence becomes catastrophic—unable to prove innocence, unable to identify root cause, unable to prevent recurrence.

### Attack Vector / Failure Mode

**How it happens:**

1. **External AI Service Opacity:**
   - Organization uses Claude API for automated document analysis workflow
   - Workflow processes 10,000 documents monthly; subset contains Protected collaborator data
   - API logging captures: request timestamp, user ID, token count, HTTP status codes
   - API logging DOES NOT capture: actual content submitted, which documents processed, model responses, decision logic
   - Six months later: Collaborator alleges their proprietary data misused in organization publications
   - Investigation requires: Which specific documents submitted to API? What outputs generated? Who accessed results?
   - Existing logs insufficient to answer questions; organization cannot prove or disprove allegation
   - Legal exposure: Lack of evidence creates settlement pressure; reputation damage from "inability to track data usage"

2. **AI Agent Action Blind Spot:**
   - Autonomous AI agent deployed for infrastructure monitoring and automated response
   - Agent authorized to: Restart failed services, clear disk space, adjust resource allocations
   - Agent operates via API calls to infrastructure management platform (Proxmox, Ansible)
   - Application logs capture: "Agent executed action" with timestamp and user ID (service account)
   - Application logs MISS: Specific action taken, parameters provided, justification/reasoning, affected systems
   - Friday evening: Critical database server unexpectedly rebooted during active analysis job
   - Monday investigation: Was it agent decision? Manual admin action? Infrastructure failure?
   - Insufficient logging prevents root cause determination
   - Result: Cannot identify whether agent logic flawed, someone manually intervened, or hardware failure occurred
   - Remediation stalled; trust in autonomous agent undermined; manual oversight re-introduced (negating automation value)

3. **API Key Compromise - Detection Delay:**
   - Organization uses OpenAI API with secret key for research automation
   - Key accidentally committed to public GitHub repository (R2: Secrets Leakage)
   - External attacker discovers key; uses for unauthorized image generation (DALL-E)
   - OpenAI dashboard shows usage spike; no detailed logs of what generated
   - Existing logs: API calls from organization's infrastructure (expected traffic)
   - Missing logs: API calls from external IPs using same key (attacker traffic)
   - Detection delay: 3 weeks until OpenAI bill arrives showing $8,000 in image generation charges
   - Investigation hampered: Cannot determine what images generated, when attacker access began, what other APIs called
   - If attacker generated harmful/illegal content using organization's key, organization liability unclear due to logging gaps

4. **Prompt Injection Investigation Failure:**
   - AI-powered customer support bot provides troubleshooting assistance
   - User submits malicious prompt attempting to extract system configuration details
   - Bot's response includes snippet of internal documentation not intended for public disclosure
   - Incident discovered through external report two weeks later
   - Investigation requires: What was exact prompt? How did it bypass safety filters? What internal data exposed?
   - Existing logs: User session ID, message count, response time
   - Missing logs: Full prompt text, model response, reasoning chain, filter evaluation results
   - Cannot determine: Was this one-off incident or pattern? Are similar prompts still succeeding?
   - Remediation uncertain without understanding root cause

**Attacker profile:** 
- **Primary:** External attackers leveraging logging gaps to hide malicious activity
- **Secondary:** Malicious insiders who know which actions aren't logged
- **Tertiary:** No attacker—operational failures and compliance audits reveal gaps

**Prerequisites:**
- Insufficient logging architecture planning during AI system design
- Default reliance on third-party AI service vendor logging (minimal)
- No centralized log aggregation for AI system events across platforms
- Log retention policies inadequate for incident investigation timelines
- Lack of AI-specific log requirements in security standards
- Budget constraints preventing deployment of adequate log storage infrastructure

### Real-World Examples

- **SolarWinds Supply Chain Attack (2020):** Attackers compromised build systems by exploiting logging blind spots—key malicious actions occurred in environments without adequate audit trails. Investigation hampered by inability to reconstruct attacker timeline. Incident demonstrated that logging gaps enable attackers to operate undetected for extended periods (9+ months in SolarWinds case). While not AI-specific, pattern directly applicable to AI infrastructure.

- **Uber Data Breach Cover-Up (2016):** Uber breach exposed 57 million records; incident initially covered up partly because inadequate logging made full impact assessment difficult. When finally disclosed, insufficient forensic evidence hampered investigation into exactly what data accessed and how breach occurred. Regulatory penalties included charges related to inadequate security monitoring and incident response capabilities.

- **Clearview AI Breach (2020):** Facial recognition company suffered breach exposing customer list and search history. Company's limited logging prevented comprehensive determination of: How long attacker had access, what specific queries were exposed, whether training data was accessed. Lack of detailed audit trails amplified regulatory scrutiny, with critics arguing inadequate logging demonstrates insufficient data protection controls for sensitive biometric processing.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | High | Cannot determine if Protected data mishandled, cannot identify affected individuals for breach notification; inability to prove non-discrimination in AI decisions |
| Operational Disruption | High | Security incidents unresolvable without forensic evidence; production failures undebuggable; manual workarounds replace automated workflows due to lack of auditability |
| Reputational Damage | High | Inability to demonstrate basic security hygiene; collaborators/funders lose confidence; "organization cannot account for data usage" perception |
| Financial Impact | High | Extended incident response costs ($20-50K) due to investigation difficulties; regulatory fines for inadequate controls ($50K-500K); litigation settlement pressure from inability to provide evidence; lost productivity from manual oversight replacing unauditable automation |
| Regulatory/Compliance | High | Colorado SB-24-205 transparency requirements unmet if cannot reconstruct AI decisions; GDPR Article 30 processing records incomplete; CIS Control 8 (Audit Log Management) non-compliance |

**Impact Level (CIS-RAM):** Catastrophic

### Cascading Effects

**R1: Data Egress** - Without comprehensive logging, data exfiltration goes undetected for extended periods.

**R2: Secrets Leakage** - Cannot determine when credentials compromised or what unauthorized access occurred.

**R3: Prompt Injection** - Inability to reconstruct attack patterns prevents defensive improvements.

**R6: Identity & Access Drift** - Insufficient logging of account usage prevents detection of orphaned accounts or privilege abuse.

**R7: Hallucination & Inaccurate Output** - Cannot trace AI outputs back to training data or model versions for quality investigation.

**R8: Legal & Compliance Gaps** - Missing logs prevent demonstration of terms of service compliance or regulatory obligations.

### Recovery Complexity

- **Time to detect:** Variable (some logging gaps never discovered until incident occurs requiring investigation)
- **Time to contain:** Hours to days (once gap identified, assess scope of missing information and impact on active investigations)
- **Time to recover:** 2-6 months (deploy enhanced logging infrastructure; backfill historical data where possible; implement log aggregation; train staff on new logging capabilities; validate effectiveness)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Comprehensive Logging Architecture | CIS 8.2 | All AI systems instrumented to log: inputs, outputs, decisions, user context, model versions, API calls, errors; centralized SIEM aggregation | 🟡 Partial |
| AI-Specific Logging Standards | CIS 8.5 | Documented requirements for AI system logs: prompt text, model response, reasoning chain (where available), confidence scores, data sources accessed | ✅ Implemented |
| Log Retention Policy | CIS 8.3 | Minimum retention: 90 days operational logs, 1 year security logs, 7 years compliance logs (Colorado SB-24-205 impact assessments) | ✅ Implemented |
| Immutable Log Storage | CIS 8.9 | Write-once log archives prevent tampering; cryptographic integrity verification; separate access controls from operational systems | 🟡 Partial |
| API Request/Response Logging | CIS 8.2 | Middleware captures full API payloads (input prompts, responses) for external AI services; sanitizes secrets before storage | ❌ Planned |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Log Completeness Monitoring | CIS 8.11 | Automated checks verify expected log volume; alerts on silent systems (stopped logging); validates log format integrity | 🟡 Partial |
| Audit Trail Testing | CIS 8.10 | Quarterly validation: Reconstruct sample workflow from logs; verify all critical events captured; identify gaps | ✅ Implemented |
| SIEM Alert Review | CIS 8.11 | Weekly review of security alerts; identifies both malicious activity and logging deficiencies flagged during investigations | ✅ Implemented |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Gap Remediation Workflow | N/A (Process) | When logging gap discovered: immediate assessment of impact, prioritized backfill of missing logs (if possible), deployment of enhanced logging | ✅ Implemented |
| Incident Investigation Escalation | CIS 17.3 | When investigation hampered by logging gaps, escalate to CTO + Security Lead for emergency logging enhancement | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **AI System Logging Requirements:** Before production deployment, system must demonstrate: (1) All API calls logged, (2) User actions auditable, (3) AI decisions traceable, (4) Errors captured with context, (5) Logs forwarded to central SIEM
- **Logging Architecture Review:** Security Lead reviews logging design during architecture phase; ensures adequate coverage before development begins
- **Quarterly Audit Trail Validation:** Select 5 random workflows; attempt to reconstruct complete timeline from logs; document gaps; prioritize remediation
- **Incident Response Logging Checklist:** During every security incident, document which logs were essential vs. which were missing; feed findings into logging improvement roadmap

### Approval Workflows

- **Required approvals:** New AI system deployment: Security Lead must approve logging architecture before production release
- **Escalation path:** If investigation hampered by logging gaps, immediate escalation to Security Lead + CTO for emergency logging enhancement decision

### Training Requirements

- **Who needs training:** Developers (instrumentation best practices), Security team (log analysis for AI systems), ARO (compliance requirements for audit trails)
- **Training content:** CIS Control 8 requirements, AI-specific logging needs (prompts, responses, model versions), SIEM query techniques, compliance record retention
- **Frequency:** Onboarding for new technical staff; annual refresher; event-driven (when major logging gap discovered)

---

## 5. Architectural Safeguards

### Design Principles

**Comprehensive by Default:** AI systems instrumented with detailed logging from initial development, not retrofitted after deployment. "If it's worth deploying, it's worth logging" principle.

**Defense in Depth Logging:** Multiple log sources provide redundant coverage: application logs (AI system), infrastructure logs (servers/containers), network logs (API calls), vendor logs (third-party AI services).

**Privacy-Aware Logging:** Logs capture sufficient detail for investigation without creating secondary data exposure risk. Example: Log prompt metadata (length, classification label, user) not full prompt text if contains Protected data—unless required for compliance.

### Network Segmentation

**Centralized Log Aggregation:** All AI systems forward logs to central SIEM (Splunk, ELK, Grafana Loki). Creates single investigation interface; enables correlation across systems; provides tamper-resistant storage.

### Data Classification

**Log Classification Matching:** Logs inherit data classification of content they reference. Logs containing Protected data snippets stored with equivalent protections; access controls match source data.

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| AI-LOG-001 | Comprehensive Logging Architecture | Security Lead | SIEM ingestion reports showing log volume by source | SIEM dashboard | Weekly |
| AI-LOG-002 | AI-Specific Logging Standards | ARO | Documented logging requirements per AI system type | AI governance repository | Quarterly |
| AI-LOG-003 | Log Retention Policy | Security Lead | SIEM retention configuration; archive storage capacity | SIEM configuration | Monthly |
| AI-LOG-004 | Immutable Log Storage | Security Lead | Write-once storage configuration; integrity verification logs | Log archive system | Quarterly |
| AI-LOG-005 | Log Completeness Monitoring | Security Lead | Monitoring alerts for silent log sources | SIEM alert console | Daily |
| AI-LOG-006 | Audit Trail Testing | Security Lead | Quarterly test reports documenting reconstruction successes and gaps | Security test records | Quarterly |

### Testing Procedures

- **Test scenario:** Simulate security incident (test user submits malicious prompt to AI system); attempt to reconstruct complete timeline from logs: who, what, when, how, why
- **Expected result:** Logs provide: user identity, full prompt text, model response, timestamp, system version, API calls made, decision reasoning
- **Test frequency:** Quarterly for each AI system; after any major logging architecture change

### Audit Trail

- **Logging Coverage Inventory:** For each AI system: documented logging capabilities, gaps identified, remediation plans, test results
- **Investigation Log Usage:** During security incidents: document which logs were consulted, which were useful, which were missing; feed into logging improvement roadmap
- **Compliance Log Access:** Maintain records of: Who accessed logs, when, why (investigation, audit, compliance demonstration), what time period reviewed

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map:** MAP 5.1 (Organizational risk tolerance includes requirements for auditability and accountability)
- **Measure:** MEASURE 3.1 (Mechanisms for tracking identified risks require comprehensive logging), MEASURE 3.3 (Processes for tracking failures depend on logs)
- **Manage:** MANAGE 2.3 (Mechanisms for tracking and responding to incidents require audit trails), MANAGE 3.1 (AI system risks monitored on ongoing basis via logs)
- **Govern:** GOVERN 1.4 (AI risk management processes documented and transparent via audit trails), GOVERN 3.2 (Accountability structures include logging of decisions)

### NIST Trustworthiness Characteristics

- ⬜ Valid and Reliable
- 🟡 Safe (incident response depends on logs for failure analysis)
- ✅ Secure and Resilient (logging is primary detection and investigation capability)
- ✅ Accountable and Transparent (audit trails enable accountability; transparency requires evidence)
- 🟡 Explainable and Interpretable (decision reconstruction requires logs)
- ✅ Privacy-Enhanced (data processing records required for privacy compliance)
- 🟡 Fair (Bias-Free) (discrimination investigation requires decision audit trails)

### Colorado SB-24-205 Compliance

**Direct Requirements:**
- Impact assessment documentation: "The deployer shall maintain the impact assessment for as long as the high-risk artificial intelligence system is in use" (§6-1-1703(3)) — requires comprehensive logging of AI system decisions and data processing for ongoing assessment updates
- Consumer notification obligation: "Statement disclosing the principal reason or reasons for the consequential decision" (§6-1-1703(4)(b)(I)) — cannot provide explanation without logs reconstructing AI decision
- Compliance demonstration: "Rebuttable presumption" of reasonable care requires documented evidence (§6-1-1703(9)) — logs provide evidence of control implementation

### ISO 42001 Mapping

- **Clause 7.5:** Documented information (records) maintained throughout AI lifecycle
- **Clause 8.5:** Traceability maintained for AI decision-making processes
- **Clause 9.1:** Performance evaluation requires monitoring data (logs)
- **Clause 9.2:** Internal audit requires objective evidence (audit trails)
- **Clause 9.3:** Management review based on information from monitoring and measurement (log analysis)
- **Clause 11.9:** Documentation and audit trails maintained for validation and verification
- **Clause 13.2:** AI-specific incident response plan requires forensic capabilities (comprehensive logs)

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| Security Lead | Define logging requirements; deploy and maintain SIEM; conduct log completeness monitoring; investigate logging gaps discovered during incidents; approve AI system logging architecture |
| ARO | Document AI-specific logging standards; ensure logging requirements in impact assessments; review quarterly audit trail testing; validate compliance log retention |
| System Owner | Instrument AI systems per logging standards; ensure logs forwarded to SIEM; investigate application-level logging issues |
| Developers | Implement logging in AI systems; test log output during development; document logging architecture decisions |
| Incident Response Team | Use logs to investigate security incidents; document when logging gaps impede investigations; recommend logging enhancements |
| Legal Counsel | Define compliance log retention requirements; advise on log evidence preservation during legal matters |

**Primary Owner:** Security Lead (logging infrastructure and policy accountability)

---

## 9. Incident Response

### Detection Indicators

- Security incident investigation reveals critical logs missing (cannot determine what happened)
- Audit trail validation test fails (cannot reconstruct workflow from logs)
- SIEM alert: Expected log source silent for >4 hours (logging failure)
- Compliance audit requests log evidence; gaps identified
- Vendor notification of API abuse; organization lacks logs to investigate
- User self-reports suspicious activity; investigation hampered by insufficient logs

### Immediate Response Steps

1. **Assess Impact (within 4 hours):**
   - What logs are missing? What timeframe affected?
   - Which active investigations or compliance obligations impacted?
   - Can missing logs be recovered from vendor, backups, or alternative sources?

2. **Emergency Logging Enhancement (within 24 hours):**
   - If gap discovered during active investigation: Deploy emergency logging immediately
   - If gap discovered during audit: Assess whether remediation needed before audit completion
   - Prevent gap from expanding (fix logging failure if ongoing)

3. **Investigation Adaptation (within 48 hours):**
   - If incident investigation hampered: Document alternative evidence sources used
   - If compliance demonstration affected: Work with Legal counsel on defensibility
   - Notify stakeholders (executives, legal, auditors) about logging limitation and impact

### Communication Plan

- **Internal:**
  - Immediate: Security Lead + CTO (logging gap assessment)
  - 4 hours: Incident Response Team if active investigation affected
  - 24 hours: ARO if compliance obligations impacted
  - 1 week: Executive leadership if material compliance risk
  - Monthly: All technical staff via security bulletin summarizing gap and remediation

- **External:**
  - AI Service Vendors: Request enhanced logging if vendor systems are gap source; negotiate access to detailed logs
  - Auditors: Transparent disclosure of logging limitations during compliance audits; demonstrate remediation plans
  - Legal Counsel: Notify if logging gap affects pending litigation or regulatory investigation
  - No breach notification typically required (logging gap itself isn't data breach—but may obscure whether breach occurred)

### Post-Incident Actions

- [ ] Root cause analysis: Why was logging inadequate? Architecture oversight? Budget constraint? Vendor limitation? Technical failure?
- [ ] Remediation: Deploy comprehensive logging for gap area; test effectiveness; validate log forwarding to SIEM
- [ ] Architecture review: Assess other AI systems for similar gaps; proactive enhancement before incidents occur
- [ ] Standards update: Incorporate lessons learned into AI-specific logging standards; prevent recurrence in new systems
- [ ] Compliance impact assessment: Did logging gap create compliance violations? Notification obligations? Documentation gaps?
- [ ] Incident response process update: Add "verify adequate logging" step to incident response checklist; prevent future investigation failures

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (AI systems often deployed rapidly without adequate logging architecture; third-party services provide minimal visibility; log storage costs incentivize minimal retention; novel AI use cases lack established logging patterns)
- **Safeguard Reliability:** Medium-High (CIS Control 8 provides clear framework; SIEM technology mature; organizational commitment to logging strong; but AI-specific logging requirements still emerging, creating implementation gaps)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Catastrophic Impact × Very High Expectancy (common threat, no controls) = 10/10
- **Qualitative Rating:** Critical

**Residual Risk:**
- **Calculated Score:** Catastrophic Impact × Low Expectancy (common threat, medium-high reliability safeguards) = 4/10
- **Qualitative Rating:** Medium

### Risk Treatment Decision

**Treatment:** Mitigate (implement comprehensive logging architecture, standards, and validation processes to reduce risk to acceptable level)

**Rationale:**

Logging blind spots cannot be eliminated entirely—some AI system internals remain opaque (proprietary model reasoning, third-party service processing), log storage has economic constraints, and perfect foresight about what to log is impossible. However, unmitigated logging gaps create catastrophic risk: organization rendered unable to investigate security incidents, demonstrate compliance, hold systems accountable, or defend against legal claims.

The asymmetry is stark: adequate logging costs relatively little (storage is cheap, instrumentation is one-time engineering effort, SIEM infrastructure is multi-use), but inadequate logging amplifies impact of every other risk scenario. When R1 (Data Egress) occurs, without logs organization cannot determine scope. When R6 (Identity Drift) manifests, without logs cannot detect orphaned accounts. When R7 (Hallucination) investigated, without logs cannot reconstruct decision process.

For research organization, logging failures create existential threat in several scenarios:
- **Regulatory Investigation:** Colorado SB-24-205 requires demonstrating reasonable care; lack of audit trails suggests negligence even if controls existed
- **Collaboration Disputes:** Partner alleges data misuse; organization cannot prove negative without logs
- **Federal Funding:** Research misconduct allegations require forensic evidence; insufficient logs prevent exoneration
- **Security Incidents:** Breach notification timelines depend on impact assessment; without logs, cannot determine what data compromised

Therefore, RadioAstronomy.io implements defense-in-depth logging strategy treating audit trails as critical infrastructure:

1. **Comprehensive Logging Architecture (Preventive):** All AI systems instrumented to log: inputs (prompts, data sources), processing (model versions, parameters), outputs (responses, decisions), context (user identity, timestamp, system state), errors (failures, safety filter triggers). This is foundation—creates raw material for all downstream uses.

2. **AI-Specific Logging Standards (Preventive):** Documented requirements tailored to AI characteristics: prompt text, model reasoning (where available), confidence scores, data provenance, API calls. Addresses gap where traditional application logging standards insufficient for AI transparency needs.

3. **Centralized SIEM Aggregation (Architecture):** All logs forwarded to central SIEM (Grafana Loki + Prometheus stack). Creates: (1) Single investigation interface, (2) Correlation capability across systems, (3) Tamper-resistant storage, (4) Backup in case primary systems compromised.

4. **Log Retention Policy (Preventive/Compliance):** Tiered retention: 90 days operational (troubleshooting), 1 year security (incident investigation), 7 years compliance (Colorado SB-24-205 impact assessments, federal research records). Balances storage costs with investigative and regulatory needs.

5. **Immutable Log Storage (Security):** Write-once archives with cryptographic integrity verification. Prevents attackers or insiders from covering tracks by deleting or modifying logs. Provides admissible forensic evidence.

6. **API Request/Response Logging (AI-Specific):** Middleware captures full payloads for external AI services—what was submitted, what was returned. Addresses third-party opacity blind spot. Secret sanitization prevents creating secondary credential exposure.

7. **Log Completeness Monitoring (Detective):** Automated checks verify expected log volume from each source. Alerts on "silent" systems (stopped logging). Detects logging failures before they impact investigations.

8. **Quarterly Audit Trail Validation (Assurance):** Systematic testing: Select random workflows, reconstruct timeline from logs, document gaps. Provides ground truth on logging effectiveness; drives continuous improvement.

These layered controls reduce expectancy from "Very High" (inherent) to "Low" (residual), bringing overall risk from "Critical" to "Medium" level. Residual risk consists of:
- Third-party AI services where vendor provides minimal logging (organizational leverage limited)
- Novel AI use cases where logging requirements not yet defined (emerging technology)
- Log storage constraints limiting retention beyond 7 years (economic trade-off)
- Adversarial attackers specifically targeting logging infrastructure (sophisticated threat)
- Privacy considerations limiting what can be logged (regulatory compliance)

RadioAstronomy.io accepts this residual risk level because:
- Alternative (perfect logging of every AI interaction including full model internals) is technically impossible and economically infeasible
- Defense-in-depth approach captures sufficient evidence for vast majority of investigation, compliance, and accountability needs
- CIS Control 8 framework provides industry-standard baseline demonstrating due diligence
- Quarterly validation testing ensures logging effectiveness monitored and improved continuously
- For remaining gaps (vendor opacity), contract terms establish vendor log retention obligations and access procedures
- Most severe consequences (inability to investigate security incidents, failed compliance audits) adequately addressed by implemented controls

Organization monitors logging risk through quarterly metrics: SIEM ingestion rates, audit trail test success rates, investigation effectiveness (percentage resolved via logs), logging gap discoveries, vendor log access requests. If residual risk trends upward (more test failures, investigations hampered), controls will be strengthened through enhanced instrumentation or additional SIEM capacity.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: major logging gap discovered during incident, compliance audit flags inadequate logs, new high-risk AI system deployed, SIEM capacity constraints, vendor materially reduces log availability)
- **Conditions:**
  - All production AI systems forward logs to centralized SIEM (no exceptions)
  - AI-specific logging standards enforced via architecture review before deployment
  - Log retention policy implemented: 90 days operational, 1 year security, 7 years compliance
  - Immutable log storage deployed for security and compliance logs
  - API request/response logging operational for all external AI services (with secret sanitization)
  - Log completeness monitoring operational with <4 hour detection of silent sources
  - Quarterly audit trail validation testing conducted with documented results
  - Logging architecture review required for all new AI system deployments
  - Incident response team trained on AI system log analysis
  - SIEM capacity monitored monthly; scaling plan prepared for growth
  - Vendor contracts include log retention and access provisions for third-party AI services
  - Any investigation hampered by logging gaps triggers immediate remediation and similar system review
  - Review Board conducts annual assessment of logging infrastructure effectiveness
  - Legal counsel consulted on compliance log retention requirements annually

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on CIS Control 8 framework and AI accountability requirements | David Thompson |
