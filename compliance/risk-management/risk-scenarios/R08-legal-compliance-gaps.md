# R8: Legal & Compliance Gaps

**Risk ID:** R8  
**Risk Slug:** legal-compliance-gaps  
**System Context:** All AI tool procurement, deployment, and usage across organization  
**Category:** Legal & Compliance  
**Data Classes Involved:** All (different compliance requirements apply based on data classification)  
**Consequential Decision:** Depends on system - Yes if AI influences decisions covered by Colorado SB-24-205  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** New AI tool/service procurement | Terms of Service update from vendor | Change in data processing scope | Regulatory enforcement action | Annual compliance review

---

## 1. Threat Description

### What Could Go Wrong?

Legal and compliance gaps in AI deployments arise when organizations inadvertently violate software licenses, contractual terms, regulatory requirements, or intellectual property protections through AI tool usage. Unlike traditional software compliance issues with clear audit trails and deployment boundaries, AI services introduce novel legal complexities: data processing occurs in vendor-controlled environments, model training data provenance is often opaque, terms of service prohibit certain use cases that seem legitimate, and output ownership remains contested legal territory.

The risk manifests across multiple legal domains:
1. **Software Licensing Violations:** AI code generation tools produce code that incorporates GPL, AGPL, or other copyleft-licensed components without attribution, creating downstream license compliance obligations the organization is unaware of
2. **Terms of Service Breaches:** Using AI services in ways prohibited by vendor agreements—competitive intelligence gathering, automated decision-making in regulated domains, processing protected categories of data, reverse-engineering models
3. **Data Processing Violations:** Submitting data to AI services that violates data sovereignty requirements, regulatory restrictions (HIPAA, FERPA, export control), or organizational data handling policies
4. **Intellectual Property Infringement:** AI systems trained on copyrighted materials reproducing substantial portions of protected works in outputs; unclear ownership of AI-generated content creating IP disputes
5. **Contractual Non-Compliance:** AI deployment violating terms of customer contracts, vendor agreements, or collaboration agreements that restrict automated processing, AI use, or data sharing with third parties

For research organizations operating with limited legal resources, these gaps create asymmetric risk: vendors operate at scale with sophisticated legal teams crafting terms that protect their interests, while small organizations lack resources to negotiate terms or fully analyze legal implications of every AI deployment.

### Attack Vector / Failure Mode

**How it happens:**

1. **Code License Contamination:**
   - Engineer uses AI code completion tool (GitHub Copilot, Tabnine) to accelerate development
   - Tool suggests function implementation pulled from GPL-licensed open-source project
   - Engineer accepts suggestion without recognizing license provenance
   - AI tool doesn't provide license attribution or warning (by design—prevents workflow interruption)
   - Code incorporated into proprietary internal tool intended for eventual commercial licensing
   - Six months later: Open-source maintainer discovers identical code in organization's repository
   - Legal cease-and-desist: Either release entire codebase under GPL or face copyright infringement suit
   - Organization forced to rewrite affected modules ($40K engineering cost) or abandon commercialization plans

2. **Terms of Service Violation - Automated Decision-Making:**
   - Operations team uses Claude API to automate contractor qualification screening
   - Process: Parse resume → Extract qualifications → Score against criteria → Flag top candidates
   - Deployed as "efficiency tool" without legal review; seems like straightforward automation
   - Anthropic Terms of Service: "You may not use the Services to make automated decisions affecting legal rights or material interests without human review"
   - Process violates ToS; contractor qualification affects employment opportunities (legal right)
   - Incident discovered during contractor complaint investigation
   - Potential consequences: Service termination (losing access mid-project), legal liability for discriminatory automated decision, Colorado SB-24-205 violation if contractor located in Colorado

3. **Data Processing Violation - Export Control:**
   - Researcher uses ChatGPT Plus to analyze astronomical observation data
   - Dataset includes International Traffic in Arms Regulations (ITAR) controlled technical data
   - OpenAI ToS: User grants OpenAI right to use inputs for model training (unless opted out)
   - ITAR prohibits sharing controlled data with foreign persons without export license
   - OpenAI operates internationally; data processed by servers/staff potentially outside U.S.
   - Submission constitutes unlicensed export of controlled technical data
   - Discovered during federal export compliance audit
   - Potential penalties: $1M+ fines, debarment from federal contracts, criminal prosecution

4. **Contractual Breach - Third-Party Data Sharing:**
   - Organization has collaboration agreement with university: "Data provided for this research shall not be shared with third parties without written consent"
   - Engineer uploads data to Claude.ai to generate analysis script
   - Data stored on Anthropic servers (third-party) without university consent
   - Collaboration agreement breach; university notified by their audit of data usage
   - Legal consequences: Contract termination, potential damages claim, loss of future collaboration opportunities

**Attacker profile:** 
- **Primary:** Well-intentioned users unaware of legal restrictions (not malicious, just uninformed)
- **Secondary:** Vendors with terms of service that shift risk to customers (asymmetric contract terms)
- **Tertiary:** Compliance auditors or opposing parties in disputes who discover violations

**Prerequisites:**
- Decentralized AI tool procurement without legal review process
- Insufficient user training on AI service terms and acceptable use
- No data classification enforcement preventing Protected/Secrets data submission to external AI
- Lack of vendor contract review by legal counsel before AI service adoption
- Organizational culture treating AI tools as "just software" without unique legal considerations

### Real-World Examples

- **Samsung Semiconductor Trade Secret Leak (2023):** Samsung engineers used ChatGPT to debug source code and optimize database queries, inadvertently uploading proprietary semiconductor manufacturing code and internal meeting notes to OpenAI servers. Samsung's trade secrets potentially incorporated into ChatGPT training data. Company was forced to implement emergency ChatGPT ban and investigate scope of exposure. Incident highlighted risks of unclear data usage terms in AI services.

- **Italian ChatGPT Ban (2023):** Italian Data Protection Authority temporarily banned ChatGPT, finding OpenAI violated GDPR through: (1) Lack of legal basis for collecting personal data for model training, (2) Absence of age verification systems allowing minor access, (3) Providing inaccurate information about individuals. First major regulatory enforcement action against generative AI service, demonstrating that terms of service don't shield vendors from privacy violations.

- **Stability AI Copyright Lawsuits (2023-2024):** Getty Images, artists, and other rights holders sued Stability AI (Stable Diffusion) for copyright infringement, alleging model trained on billions of copyrighted images without permission or compensation. Lawsuits challenge whether AI training constitutes fair use. Organizations using Stable Diffusion outputs face potential secondary liability if outputs reproduce copyrighted works. Illustrates unsettled legal questions around AI-generated content ownership.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | Medium | Automated decision-making violations may affect individuals' employment, educational, or economic opportunities without proper human review or appeal mechanisms |
| Operational Disruption | High | Service termination for ToS violations disrupts active projects; license violations require emergency code rewrites; export control violations halt federal collaboration |
| Reputational Damage | High | Legal violations signal governance failures; collaboration partners and funders question organization's reliability; academic credibility damaged by compliance breaches |
| Financial Impact | High | License infringement litigation costs ($50-200K legal fees); regulatory fines for export control/privacy violations ($100K-1M+); lost revenue from abandoned commercialization; contract damages from third-party agreements |
| Regulatory/Compliance | High | Colorado SB-24-205 violations if ToS-prohibited use affects consequential decisions; GDPR/privacy law violations for improper data processing; export control violations carry criminal penalties |

**Impact Level (CIS-RAM):** Catastrophic

### Cascading Effects

**R1: Data Egress** - Legal compliance gaps often discovered after Protected data already submitted to external AI services in violation of terms.

**R2: Secrets Leakage** - Terms of service violations frequently involve inadvertent submission of credentials, API keys, or proprietary technical data to AI services.

**R7: Hallucination & Inaccurate Output** - Copyright infringement risk compounded when AI hallucinates attribution or licensing terms for generated code.

**R9: Cost & Tool Sprawl** - Shadow AI deployments specifically avoid legal review, increasing legal risk while hiding from governance.

### Recovery Complexity

- **Time to detect:** Months to years (violations often discovered through external notification—vendor audit, third-party complaint, regulatory investigation—not internal monitoring)
- **Time to contain:** 1-2 weeks (legal counsel assessment; immediate cessation of violating activity; preservation of evidence; initial damage assessment)
- **Time to recover:** 3-12 months (license violation remediation through code rewrite or licensing negotiation; regulatory investigation response; contract renegotiation with affected parties; potential litigation defense)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Pre-Procurement Legal Review | N/A (Process) | All AI service contracts reviewed by legal counsel before procurement; documented approval required | ✅ Implemented |
| Data Classification Enforcement | CIS 3.2 | Technical controls prevent submission of Protected/Secrets data to external AI services; DLP policies block sensitive data patterns | ✅ Implemented |
| Approved AI Service Registry | CIS 2.1 | Centralized inventory of legally-reviewed AI tools; procurement restricted to approved list; terms documented | ✅ Implemented |
| User Terms of Service Training | N/A (Process) | Mandatory training on AI service acceptable use, prohibited use cases, data handling restrictions before tool access granted | 🟡 Partial |
| Code Attribution Scanning | CIS 18.3 | Automated scanning of AI-generated code contributions for license attribution; flagging GPL/copyleft components | ❌ Planned |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| AI Service Usage Monitoring | CIS 8.2 | Log analysis identifies when users access AI services; alerts on unusual patterns or unapproved tools | 🟡 Partial |
| Data Egress Monitoring | CIS 13.1 | Network monitoring detects large file uploads to AI service domains; triggers investigation | ✅ Implemented |
| Vendor ToS Change Alerts | N/A (Process) | Monitoring service tracks terms of service updates for approved AI vendors; triggers legal re-review | ❌ Planned |
| License Compliance Scanning | CIS 2.5 | Software composition analysis tools scan repositories for license violations in dependencies and AI-generated code | 🟡 Partial |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Legal Incident Response Protocol | N/A (Process) | Documented procedure for legal violation response: immediate escalation, evidence preservation, outside counsel engagement | ✅ Implemented |
| Breach Notification Process | N/A (Process) | Protocol for notifying affected parties (collaborators, regulators, customers) of contractual or regulatory violations | ✅ Implemented |
| Emergency Service Replacement | N/A (Process) | Contingency plans for rapid migration to alternative tools if primary AI service terminated for ToS violation | 🟡 Partial |

---

## 4. Process Controls

### Procedural Safeguards

- **AI Service Procurement Workflow:** New AI tools require: (1) Technical evaluation, (2) Legal counsel ToS review, (3) ARO risk assessment, (4) Budget approval, (5) Documented training before rollout
- **Data Classification Review:** Before submitting any data to external AI service, user must verify data classification and confirm service approved for that classification level
- **Third-Party Agreement Audit:** When onboarding new collaboration/customer agreement, legal team identifies AI use restrictions and documents in central registry
- **License Attribution Standard:** All code commits (human or AI-generated) require license header comments; automated CI/CD checks reject commits missing attribution

### Approval Workflows

- **Required approvals:** AI service procurement: ARO (risk assessment) + Legal (contract review) + Budget owner (cost approval)
- **Escalation path:** If user discovers potential legal violation (already occurred), immediate escalation to ARO and General Counsel; preserve evidence, cease violating activity

### Training Requirements

- **Who needs training:** All staff with access to AI services (technical and non-technical)
- **Training content:** AI vendor terms of service overview; prohibited use cases (automated decisions, regulated data processing, competitive intelligence); data classification restrictions; copyright considerations for AI-generated content; consequence of violations
- **Frequency:** Annual mandatory training; additional training when new AI service approved or vendor terms updated

---

## 5. Architectural Safeguards

### Design Principles

**Centralized Procurement, Decentralized Usage:** AI tools procured and legally vetted centrally (IT + Legal), then made available for distributed use. Prevents shadow AI procurement that bypasses legal review.

**Data Classification Boundaries:** Technical architecture enforces that external AI services can only access Public data classification by default. Protected/Secrets data requires architectural exception approval (e.g., on-premises model deployment).

**Contractual Risk Allocation:** When negotiating enterprise AI service contracts, legal counsel pursues terms that: (1) Opt-out of training data use by default, (2) Establish data processing addendums for GDPR compliance, (3) Limit liability for user misuse, (4) Provide indemnification for IP infringement claims.

### Network Segmentation

**DLP at Egress Points:** Data Loss Prevention (DLP) policies at network egress points detect and block transmission of Protected/Secrets data patterns to external AI service domains. Provides technical backstop for policy compliance.

### Data Classification

**Public Only for External AI:** External AI services (Claude API, GPT, Gemini) restricted to Public data classification. Protected data requires approved on-premises AI deployment. Secrets data never processed by AI systems.

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| AI-LEGAL-001 | Pre-Procurement Legal Review | Legal Counsel | Signed contract review memos | Legal repository | Per procurement |
| AI-LEGAL-002 | Data Classification Enforcement | Security Lead | DLP policy configurations, block logs | DLP console | Monthly |
| AI-LEGAL-003 | Approved AI Service Registry | ARO | Inventory with legal review dates | AI governance repository | Quarterly |
| AI-LEGAL-004 | User Training | HR/Training | Training completion records | LMS | Annual |
| AI-LEGAL-005 | AI Service Usage Monitoring | Security Lead | Access logs, usage dashboards | SIEM | Weekly |
| AI-LEGAL-006 | License Compliance Scanning | Engineering Lead | SCA scan reports | CI/CD pipeline logs | Per commit |

### Testing Procedures

- **Test scenario:** Attempt to upload file marked as "Protected" classification to external AI service; verify DLP blocks transmission and alerts security team
- **Expected result:** Upload blocked at network egress; alert generated; user receives policy reminder
- **Test frequency:** Quarterly for each AI service endpoint

### Audit Trail

- **Procurement Records:** For each approved AI service: original vendor ToS, legal counsel review memo, risk assessment, approval chain, training materials
- **Data Processing Records:** Logs of all data submitted to external AI services (metadata only—timestamps, user, file size, classification label) for audit reconstruction
- **Violation Incidents:** When legal gap discovered: incident report, legal counsel analysis, remediation actions, notification records, updated controls

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map:** MAP 1.2 (Legal and regulatory requirements documented), MAP 1.5 (Organizational risk tolerances determined), MAP 2.3 (Data provenance documented)
- **Measure:** MEASURE 1.1 (Appropriate metrics identified), MEASURE 3.3 (Processes for tracking failures established)
- **Manage:** MANAGE 1.3 (Responses to third-party risks prioritized), MANAGE 2.3 (Mechanisms for tracking and responding to incidents), MANAGE 4.3 (Incident response plan maintained)
- **Govern:** GOVERN 1.3 (Legal and regulatory requirements mapped), GOVERN 1.6 (AI policies embedded in organizational practices), GOVERN 5.1 (Organizational policies for third-party AI resources)

### NIST Trustworthiness Characteristics

- ⬜ Valid and Reliable
- ⬜ Safe
- ✅ Secure and Resilient (third-party risk management, secure procurement)
- ✅ Accountable and Transparent (compliance documentation, audit trails)
- ⬜ Explainable and Interpretable
- ✅ Privacy-Enhanced (data processing restrictions, classification enforcement)
- ✅ Fair (Bias-Free) (ToS compliance prevents prohibited automated decisions)

### Colorado SB-24-205 Compliance

**Direct Applicability:**
- Developer documentation: "Statement regarding any known limitations of the high-risk artificial intelligence system, including whether the system was not developed or tested for the specific use case for which it is being used by a deployer" (§6-1-1702(2)(a)) — requires understanding vendor service limitations documented in ToS
- Deployer duty: "A deployer shall not use a high-risk artificial intelligence system in a manner that is materially inconsistent with the developer's disclosed intended use" (§6-1-1703(1)) — violating vendor ToS by using service for prohibited purposes violates SB-24-205
- Risk management program: Must address third-party AI service risks and contractual limitations (§6-1-1703(2))

### ISO 42001 Mapping

- **Clause 4.2:** Understanding external parties including AI service vendors; documenting contractual relationships
- **Clause 5.2:** AI policy addresses legal compliance, intellectual property, and contractual obligations
- **Clause 6.1:** Risk assessment includes legal and compliance risks from third-party AI services
- **Clause 7.5:** Documented information maintained on contracts, terms of service, legal reviews
- **Clause 10.10:** Third-party risk management for AI service providers (vendor due diligence, contractual controls, ongoing monitoring)
- **Clause 12.1:** Privacy principles embedded in AI policies; data processing restrictions documented
- **Clause 13.1:** Cybersecurity risks from third-party AI services addressed (data egress controls, vendor security assessments)

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| Legal Counsel | Review AI service terms of service; identify prohibited use cases; negotiate enterprise contracts; provide legal guidance on compliance questions; lead violation response |
| ARO | Maintain approved AI service registry; assess legal and compliance risks in AI procurement; approve AI service additions; investigate violation incidents; update policies based on legal developments |
| Security Lead | Implement DLP controls preventing unauthorized data submission; monitor AI service usage; detect and investigate policy violations; maintain technical controls for compliance enforcement |
| Procurement | Route AI service purchases through legal review workflow; verify approved service registry before contracting; maintain vendor contract repository |
| System Owner | Ensure AI usage within team complies with service ToS and organizational policies; provide training; investigate suspected violations |
| All Users | Complete required training; adhere to AI service acceptable use policies; report suspected violations; verify data classification before AI submission |

**Primary Owner:** Legal Counsel (legal compliance accountability)

---

## 9. Incident Response

### Detection Indicators

- Vendor notification of terms of service violation or account suspension
- Third-party (collaborator, customer, regulator) complaint about data processing or contractual breach
- Automated alert: DLP blocks Protected data submission to AI service
- Software composition analysis flags copyleft license in AI-generated code
- Internal audit discovers unapproved AI service in use (shadow AI)
- Employee self-reports potential violation (positive indicator of compliance culture)

### Immediate Response Steps

1. **Cease Activity (within 2 hours):**
   - Suspend user access to AI service if ongoing violation
   - Preserve all evidence: logs, communications, data artifacts
   - Notify ARO and Legal Counsel immediately

2. **Assess Scope (within 24 hours):**
   - Legal counsel determines violation severity and legal exposure
   - Identify: Which ToS term violated? Which data processed? Who affected?
   - Determine notification obligations (contractual, regulatory, ethical)

3. **Contain & Remediate (within 48 hours):**
   - Implement immediate remediation (delete improperly submitted data from vendor systems if possible)
   - Contact vendor if cooperation needed (data deletion request under GDPR/privacy law)
   - Notify affected third parties if contractual breach discovered

### Communication Plan

- **Internal:**
  - Immediate: ARO + Legal Counsel (first responders)
  - 4 hours: CTO + affected System Owner (containment planning)
  - 24 hours: Executive leadership if material legal exposure (board notification threshold)
  - 1 week: All-staff summary if systemic policy issue requiring awareness

- **External:**
  - AI Service Vendor: If violation discovered, transparent communication to seek cooperation (e.g., data deletion, account review)
  - Affected Third Parties: If contractual breach, notification within 48 hours per agreement terms or ethical duty
  - Regulators: If violation triggers mandatory reporting (export control, privacy breach, discriminatory decision), consult legal counsel on timing and content
  - Collaboration Partners: If partner data improperly processed, immediate notification with remediation plan

### Post-Incident Actions

- [ ] Root cause analysis: Why did violation occur? Policy gap? Training failure? Insufficient technical controls?
- [ ] Control hardening: Strengthen DLP rules; enhance pre-procurement review; improve user training; implement monitoring gaps
- [ ] Policy update if needed: Clarify acceptable use policies; update approved service registry; document lessons learned
- [ ] Legal review: Outside counsel assessment of remediation adequacy; litigation risk evaluation; insurance notification if potential claim
- [ ] Proactive audit: Review similar AI service usage across organization; identify unremediated risks; validate controls effective elsewhere

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (complex AI service terms updated frequently; users lack legal training; procurement decentralization creates visibility gaps; novel legal questions lack clear precedent)
- **Safeguard Reliability:** Medium (legal review process effective but depends on user compliance; DLP controls strong for data classification but can't detect all ToS violations; training effectiveness varies by audience)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Catastrophic Impact × Very High Expectancy (common threat, no controls) = 10/10
- **Qualitative Rating:** Critical

**Residual Risk:**
- **Calculated Score:** Catastrophic Impact × Low Expectancy (common threat, medium reliability safeguards) = 4/10
- **Qualitative Rating:** Medium

### Risk Treatment Decision

**Treatment:** Mitigate (implement centralized legal review, technical controls, and training to reduce risk to acceptable level)

**Rationale:**

Legal and compliance gaps in AI usage cannot be eliminated without prohibiting external AI services entirely—which would sacrifice significant productivity benefits and competitive positioning. The legal landscape for AI is rapidly evolving, with new court precedents, regulatory interpretations, and vendor terms of service updates occurring continuously. No control framework can provide 100% certainty.

However, unmitigated legal risk is catastrophic for research organization. Unlike technical failures that affect internal operations, legal violations create existential risks: criminal prosecution for export control violations, debarment from federal funding, litigation consuming limited organizational resources, reputational damage destroying collaboration opportunities. Small research organizations lack deep legal resources and cannot sustain prolonged legal battles.

Furthermore, asymmetric risk characterizes AI services: vendors operating at massive scale can absorb litigation risks and craft protective terms of service, while individual organizations lack negotiating leverage and expertise to identify hidden legal landmines. Without systematic legal review, organizations inadvertently accept risks they don't understand.

Therefore, RadioAstronomy.io implements integrated legal risk management approach:

1. **Pre-Procurement Legal Review (Preventive):** Every AI service contract reviewed by legal counsel before procurement. Counsel identifies prohibited use cases, data processing restrictions, liability allocations, and IP considerations. Creates approved service registry with documented constraints. This is primary control—legal expertise applied before risk manifests.

2. **Data Classification Enforcement (Preventive/Technical):** DLP policies technically prevent users from submitting Protected or Secrets data to external AI services. Provides fail-safe for policy violations—even if user doesn't understand restrictions, technology blocks harmful action.

3. **Centralized Procurement (Preventive/Governance):** AI services procured through IT/Procurement workflow requiring legal approval. Prevents shadow AI adoption that bypasses review. Creates visibility into organizational AI usage.

4. **User Training (Preventive):** All AI service users complete training on acceptable use, prohibited applications, data handling requirements, and consequences of violations. Establishes user awareness and accountability.

5. **License Compliance Scanning (Preventive/Detective):** Automated tools scan AI-generated code for license violations. Software composition analysis (SCA) tools identify GPL/copyleft components requiring attribution or license compatibility resolution. Catches issues before code deployment.

6. **Usage Monitoring (Detective):** Logging and SIEM analysis track AI service access patterns. Unusual activity (large file uploads, after-hours access, unapproved service use) triggers investigation. Enables early violation detection.

7. **Vendor ToS Monitoring (Detective):** Systematic tracking of terms of service updates from approved vendors. Legal re-review triggered when vendors materially change terms. Prevents "silent" policy violations when vendor rules change.

8. **Legal Incident Response (Corrective):** Documented protocol for violation response: immediate cessation, evidence preservation, legal counsel engagement, remediation, notification. Limits damage when violations occur despite preventive controls.

These layered controls reduce expectancy from "Very High" (inherent) to "Low" (residual), bringing overall risk from "Critical" to "Medium" level. Residual risk consists of:
- Users circumventing DLP controls through personal devices/networks (BYOD gap)
- Novel legal theories not anticipated in legal review (unsettled law)
- Vendor terms of service violations that aren't technically detectable (e.g., prohibited competitive intelligence use)
- Export control violations when technical data classification ambiguous
- License violations when AI-generated code substantially transforms but still infringes

RadioAstronomy.io accepts this residual risk level because:
- Alternative (prohibit external AI services) would eliminate productivity benefits and competitive disadvantage vs. peers
- Centralized legal review provides strong protection against known risks; residual risks are edge cases
- Research organization mission prioritizes innovation; some legal uncertainty is inherent in frontier technology adoption
- Strong incident response process limits damage from residual risk manifestation
- Industry standard for responsible AI adoption is legal review + technical controls—this approach meets/exceeds best practices
- Federal research funding agencies increasingly expect (but don't yet require) AI governance; proactive approach positions organization well for future requirements

Organization monitors legal risk through quarterly metrics: number of legal review requests, violations detected, terms of service updates requiring re-review, training completion rates, shadow AI discoveries. If residual risk trends upward (more violations detected, vendor terms becoming more restrictive), controls will be strengthened through additional training, enhanced DLP rules, or reduced service portfolio.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: legal violation incident occurs, major AI-related enforcement action in industry, Colorado SB-24-205 enforcement establishes precedent, vendor materially changes terms of service, significant regulatory development affecting AI)
- **Conditions:**
  - All AI service procurement routed through legal review workflow (no exceptions)
  - Approved AI service registry maintained with documented use restrictions
  - DLP policies block Protected/Secrets data submission to external AI services
  - Annual mandatory training for all AI service users (100% completion required)
  - Software composition analysis integrated into CI/CD pipeline for license compliance
  - AI service usage monitoring operational with weekly dashboard review
  - Vendor terms of service monitoring process established (legal re-review on material updates)
  - Legal incident response protocol tested annually through tabletop exercise
  - Third-party agreements audited for AI use restrictions; documented in central registry
  - Quarterly legal compliance metrics reviewed by ARO and General Counsel
  - Outside legal counsel available for complex legal questions and incident response
  - Review Board conducts annual assessment of legal risk management effectiveness
  - Any legal violation triggers immediate comprehensive audit of similar AI usage

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on industry incidents and legal compliance best practices | David Thompson |
