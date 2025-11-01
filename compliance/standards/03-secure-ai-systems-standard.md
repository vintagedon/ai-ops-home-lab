# Secure AI Systems Standard v1.1

Document ID: STD-003  
Version: 1.1  
Effective Date: 2025-10-26  
Last Updated: 2025-10-26  
Document Owner: CTO  
Review Cycle: Annual (or upon material AI service changes)  
Status: Active

---

## Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-01-15 | CTO | Initial standard based on NIST AI RMF |
| 1.1 | 2025-10-26 | CTO | SECURITY CORRECTION: Fixed Protected data controls (removed Gemini from Protected tier), removed all unapproved OpenAI/ChatGPT references, updated to 4-tier data classification, added Z.ai/GLM-4.6 with training constraint, added two new risk scenarios (Z.ai training, classification confusion). Re-acknowledgment required. |

---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Scope](#2-scope)
3. [Data Classification & AI Tool Mapping](#3-data-classification--ai-tool-mapping)
4. [Access Control](#4-access-control)
5. [Data Handling](#5-data-handling)
6. [Model Security](#6-model-security)
7. [Logging and Monitoring](#7-logging-and-monitoring)
8. [Incident Response](#8-incident-response)
9. [Third-Party AI Services](#9-third-party-ai-services)
10. [Risk Scenarios and Controls](#10-risk-scenarios-and-controls)
11. [Compliance Mapping](#11-compliance-mapping)
12. [References](#12-references)
13. [Appendices](#13-appendices)

---

## 1. Purpose

This standard establishes security requirements for AI systems deployed or used within RadioAstronomy.io operations. It ensures:

- Confidentiality of organizational data processed by AI systems
- Integrity of AI models and their outputs
- Availability of AI services for authorized personnel
- Compliance with NIST AI RMF, CIS Controls v8, ISO 31000:2018, and Colorado SB24-205

This standard applies to:

- Commercial AI services (cloud-based APIs and platforms)
- Self-hosted AI models (on-premises or private cloud)
- AI development and deployment infrastructure
- Data used to train, fine-tune, or prompt AI systems

---

## 2. Scope

### 2.1 In Scope

AI Systems:

- Large Language Models (LLMs) used for code generation, documentation, analysis
- Computer vision models for astronomical image processing
- Natural language processing tools
- Machine learning models for data analysis and prediction
- AI-powered development tools and assistants

Infrastructure:

- AI model serving infrastructure (proj-gpu01, agents01)
- API gateways and authentication systems
- Data storage systems used by AI workflows
- Network paths between users and AI services

Personnel:

- All employees, contractors, and authorized users of RadioAstronomy.io AI systems
- Third-party developers with API access
- AI system administrators and operators

### 2.2 Out of Scope

- General IT security policies (covered in separate IT Security Policy)
- Non-AI data processing systems
- Personnel hiring and background checks (covered in HR policies)
- Physical security of facilities (covered in Physical Security Policy)

### 2.3 Related Policies

- POL-001: AI Governance Policy (overarching framework)
- STD-001: AI System Assessment Standard (risk assessment methodology)
- STD-002: AI Transparency & Disclosure Standard (transparency requirements)
- AUP-001: AI Acceptable Use Policy (user behavior and data classification)

---

## 3. Data Classification & AI Tool Mapping

### 3.1 Data Classification Scheme

RadioAstronomy.io uses a four-tier data classification scheme to govern which AI tools may process which data types:

| Data Classification | Description | AI Processing Rules | Examples |
|---------------------|-------------|---------------------|----------|
| PUBLIC-INTERNAL | RadioAstronomy.io controlled content that is publicly shareable but represents our intellectual property | Any approved tool with training opt-out enabled | Published research papers, public GitHub repositories owned by RadioAstronomy.io, technical blog posts, open-source documentation we author |
| PUBLIC-EXTERNAL | Astronomy and data science research code, scientific analysis workflows, and external community repositories | Any approved tool including those that train on data | Astronomy analysis pipelines, data processing scripts, scientific computation code, research workflows, external GitHub repositories, open-source projects we contribute to, published third-party research |
| PROTECTED | Internal confidential information not for public disclosure | Claude Max via Kasm workspace isolation (CTO only) OR local models only | Draft research papers, internal system configurations, unpublished methodologies, business strategies, internal meeting notes |
| SECRETS | Credentials, authentication tokens, encryption keys, personally identifiable information (PII) | NEVER use AI for secrets processing | API keys, passwords, SSH keys, access tokens, database credentials, PII |

### 3.2 Approved AI Services by Data Classification

| Data Classification | Approved AI Services |
|---------------------|---------------------|
| PUBLIC-INTERNAL | Gemini 2.5 Flash/Pro (Google Workspace), Claude Max (CTO access), Z.ai GLM-4.6 (Engineer role, see note), Local models (Llama 3.1 8B on proj-gpu01) |
| PUBLIC-EXTERNAL | Gemini 2.5 Flash/Pro, Claude Max, Z.ai GLM-4.6 (Engineer role only, trains on data), Local models |
| PROTECTED | Claude Max via Kasm workspace isolation (CTO only), Local models only |
| SECRETS | None - Never use AI for secrets |

Critical Notes:

1. Gemini (Google Workspace): Public-Internal and Public-External only. Training opt-out enabled at workspace level. NOT approved for Protected data.

2. Claude Max (Anthropic): CTO access only. Standard use for Public data; Protected data requires Kasm workspace isolation for additional security controls.

3. Z.ai GLM-4.6: Engineer role only. Trains on submitted data. Restricted to Public-External classification only (astronomy and data science research code where training is acceptable). NEVER use for Public-Internal (infrastructure, agents, proprietary code) or Protected data. Engineer role distinguishes research code from infrastructure IP.

4. Local Models (Llama 3.1 8B): Available to all personnel. Air-gapped from internet. Approved for all classifications including Protected data.

5. Personal AI Accounts: Prohibited for work purposes. Examples: free Claude accounts, consumer Google Gemini (non-Workspace), unapproved personal API keys.

### 3.3 Tool Selection Decision Tree

```markdown
START: What data am I processing?

├─ Is it credentials, keys, tokens, or PII?
│  └─ YES → SECRETS tier → DO NOT USE ANY AI SYSTEM
│  └─ NO → Continue
│
├─ Is it internal confidential information (drafts, configs, strategies)?
│  └─ YES → PROTECTED tier
│     ├─ CTO? → Use Claude Max via Kasm workspace
│     └─ Not CTO? → Use local model (Llama 3.1 8B)
│  └─ NO → Continue
│
├─ Is it astronomy or data science research code?
│  └─ YES → PUBLIC-EXTERNAL tier
│     └─ Use: Gemini (primary), Claude Max (CTO), Z.ai (Engineer role), or local model
│     └─ Note: Research code will be published; training on data is acceptable
│  └─ NO → Continue
│
└─ Is it RadioAstronomy.io infrastructure, agents, or proprietary code?
   └─ YES → PUBLIC-INTERNAL tier
      └─ Use Gemini, Claude Max (CTO), or local model
         (NOT Z.ai - trains on data, protects competitive IP)
```

---

## 4. Access Control

### 4.1 Authentication

Requirement: Multi-factor authentication (MFA) required for all AI service access.

Implementation:

| AI Service | Authentication Method | MFA Enforcement |
|------------|----------------------|-----------------|
| Gemini (Workspace) | Google Workspace SSO | Enforced via Google Admin (Titan Security Keys or TOTP) |
| Claude Max | Anthropic account | CTO personal account with MFA enabled |
| Z.ai GLM-4.6 | Z.ai account | Engineer role account with MFA enabled |
| Local Models (proj-gpu01) | SSH key + Proxmox VE auth | SSH key required, Proxmox VE MFA enforced |

Controls:

- CIS 6.3: MFA for all user authentication
- CIS 6.5: Centralized authentication (Google Workspace SSO where available)

### 4.2 Authorization

Principle: Least privilege access to AI services based on role and data classification needs.

Access Matrix:

| Role | Gemini (Workspace) | Claude Max | Z.ai GLM-4.6 | Local Models |
|------|-------------------|------------|--------------|--------------|
| CTO | ✓ (Public) | ✓ (Public + Protected via Kasm) | ✗ | ✓ (All tiers) |
| Engineer | ✓ (Public) | ✗ | ✓ (Public-External only) | ✓ (All tiers) |
| Researcher | ✓ (Public) | ✗ | ✗ | ✓ (All tiers) |

Technical Enforcement:

- Google Workspace: Managed via organizational units and group policies
- Claude Max: CTO personal subscription (no technical enforcement needed—single user)
- Z.ai: OAuth restricted to RadioAstronomy.io domain, Engineer role via RBAC
- Local Models: SSH key-based access with RBAC via groups

Quarterly Access Review:

- Security Lead reviews AI service access quarterly
- Verify roles still appropriate
- Remove access for separated personnel
- Document review in access control log

Controls:

- CIS 5.1: Establish and maintain an inventory of accounts
- CIS 5.3: Disable dormant accounts
- CIS 6.1: Establish an access granting process
- CIS 6.2: Establish an access revoking process
- CIS 6.8: Define and maintain role-based access control

### 4.3 Session Management

Requirements:

- Automatic session timeout after 30 minutes of inactivity (where technically feasible)
- Forced re-authentication after 8 hours for cloud services
- No session sharing between users

Implementation:

| AI Service | Session Timeout | Re-auth Period |
|------------|-----------------|----------------|
| Gemini (Workspace) | Configured via Google Admin | 8 hours (Google session) |
| Claude Max | Browser-based (30 min idle) | 24 hours (Anthropic session) |
| Z.ai | Browser-based (30 min idle) | Vendor default |
| Local Models | SSH timeout (15 min idle) | Per SSH key rotation policy |

---

## 5. Data Handling

### 5.1 Data Minimization

Principle: Only process minimum necessary data through AI systems.

Requirements:

- Remove unnecessary PII before AI processing
- Use anonymized or synthetic data for testing
- Sanitize examples in prompts (no real credentials/PII)
- Delete temporary data after processing complete

Examples:

✓ Good: "Review this code snippet for security issues" (code only)  
✗ Bad: "Review credentials.yaml for security issues" (contains secrets)

✓ Good: "Analyze this dataset structure" (sample with synthetic values)  
✗ Bad: "Analyze customer_data.csv" (real PII)

Controls:

- CIS 3.1: Establish and maintain a data management process
- CIS 3.12: Segment data processing and storage

### 5.2 Data Retention

Principle: Different AI services have different data retention policies. Choose appropriate service based on data sensitivity and retention requirements.

| AI Service | Input Retention | Conversation History | Training Usage |
|------------|-----------------|---------------------|----------------|
| Gemini (Workspace) | 18 months | Deletable by user | Training opt-out enabled |
| Claude Max | Per Anthropic policy | Deletable by user | Training opt-out enabled |
| Z.ai GLM-4.6 | Per Z.ai policy | Deletable by user | **Trains on submitted data** |
| Local Models | Not transmitted | Local only (not cloud) | Air-gapped (no external training) |

Critical Consideration: Z.ai trains on all submitted data. This is acceptable ONLY for Public-External classification (astronomy/research code). Never use Z.ai for Public-Internal (our infrastructure/IP) or Protected data.

Data Deletion Procedures:

- Gemini: Users can delete conversation history via Google Account settings
- Claude Max: CTO can delete via Anthropic web interface
- Z.ai: Contact vendor for data deletion requests
- Local Models: Delete files/logs on proj-gpu01 as needed

Controls:

- CIS 3.3: Configure data access control lists
- CIS 3.11: Encrypt sensitive data at rest

### 5.3 Data Loss Prevention (DLP)

Kasm Workspaces DLP (for Protected Data):

When CTO uses Claude Max for Protected data, Kasm workspace isolation provides:

- Copy/paste blocking (no data exfiltration via clipboard)
- Screenshot prevention
- Download blocking
- Session recording for audit trail
- Network isolation (only allowed destinations)

Local Model Air-Gapping (for Protected Data):

- proj-gpu01 has no direct internet access
- Models downloaded separately and transferred via secure channel
- No telemetry or phone-home capability
- All inference local to infrastructure

Controls:

- CIS 3.10: Encrypt sensitive data in transit
- CIS 13.3: Deploy a data loss prevention solution

### 5.4 Data Classification Labeling

Requirement: Clearly mark data classification in documentation, file headers, or conversation context.

Implementation Examples:

Code Files:
```python
# Classification: PUBLIC-INTERNAL
# Description: RadioAstronomy.io data processing pipeline
```

Conversation Prompts:
```
[PUBLIC-EXTERNAL] Review this external library code for security issues...
```

Document Headers:
```
Classification: PROTECTED
Handling: Claude Max via Kasm only, or local models
```

Benefits:

- Prevents accidental misclassification
- Reminds users of appropriate tool selection
- Creates audit trail of data handling decisions

---

## 6. Model Security

### 6.1 Model Provenance

Requirement: All AI models must have verified provenance and integrity.

Approved Model Sources:

- Official vendor APIs (Gemini, Claude, Z.ai)
- Verified model repositories (Hugging Face verified publishers)
- Official model releases (Meta Llama via official channels)

Prohibited Sources:

- Random GitHub repos with pre-trained models
- Torrents or file-sharing sites
- Unverified third-party fine-tunes
- Models with unknown training data or licensing

Verification Process:

1. Check official model card or documentation
2. Verify checksum/hash if available
3. Review model license compatibility
4. Document source in model inventory
5. Security Lead approval before deployment

Controls:

- CIS 2.1: Establish and maintain a software inventory
- CIS 2.6: Address unapproved software

### 6.2 Model Isolation

Requirement: Separate models by data classification to prevent cross-contamination.

Implementation:

- proj-gpu01 hosts local models (all classifications supported)
- Gemini via Workspace (Public-Internal/Public-External only)
- Claude Max (Public data standard; Protected via Kasm isolation)
- Z.ai (Public-External only—research code where training acceptable)

No Shared Context Across Classifications:

- Don't use same conversation for Public and Protected data
- Start new session when changing classification levels
- Clear conversation history between contexts

Controls:

- CIS 12.6: Use network segmentation to isolate sensitive systems

### 6.3 Model Updates and Versioning

Requirement: Track model versions and assess security impact of updates.

Monitoring:

- Commercial APIs: Vendor announces model updates (monitor release notes)
- Local Models: Pin to specific versions, test before upgrading
- Breaking Changes: Assess impact on system behavior and security posture

Process:

1. Vendor announces new model version
2. Security Lead reviews changelog for security/privacy changes
3. Test new version in non-production context
4. Document decision to adopt or defer
5. Update model inventory

Controls:

- CIS 7.1: Establish and maintain a vulnerability management process
- CIS 16.11: Leverage vetted modules or services for application security components

### 6.4 Prompt Injection Prevention

Threat: Malicious inputs crafted to manipulate AI system behavior or exfiltrate data.

Controls:

Input Validation:

- Sanitize user inputs before AI processing
- Remove suspicious patterns (encoded payloads, excessive instructions)
- Validate input length and format
- Reject inputs containing obvious injection attempts

Output Validation:

- Verify AI outputs match expected format/constraints
- Don't blindly execute code generated by AI
- Human review for high-consequence actions
- Rate limiting on API calls to prevent abuse

Monitoring:

- Log unusual prompt patterns or outputs
- Alert on excessive token usage or API calls
- Review conversation histories for suspicious activity

Controls:

- CIS 16.10: Apply secure design principles in application architectures
- CIS 17.1: Designate personnel to manage incident handling

---

## 7. Logging and Monitoring

### 7.1 Audit Logging

Requirement: Log all AI system access and usage for security monitoring and compliance.

What to Log:

- User authentication (success/failure)
- AI service access (which service, which user, timestamp)
- Data classification of prompts (labeled or inferred)
- Unusual activity (excessive usage, off-hours access, anomalous prompts)
- Administrative actions (account provisioning, access changes)

Implementation:

| AI Service | Logging Method | Retention |
|------------|----------------|-----------|
| Gemini (Workspace) | Google Workspace audit logs | 1 year (Workspace default) |
| Claude Max | Anthropic usage logs (CTO review) | Per vendor policy |
| Z.ai | Vendor logs (if available) | Per vendor policy |
| Local Models | SSH access logs + application logs | 1 year (Graylog SIEM) |

Centralized Logging:

- All SSH access to proj-gpu01 logged to Graylog SIEM
- Local model inference logged with timestamp, user, data classification tag
- Periodic review by Security Lead (monthly minimum)

Controls:

- CIS 8.2: Collect audit logs
- CIS 8.3: Ensure adequate audit log storage
- CIS 8.5: Collect detailed audit logs

### 7.2 Security Monitoring

Automated Alerts:

- Failed authentication attempts (>3 in 10 minutes)
- Access to AI services from unusual locations (if detectable)
- Excessive API usage (>10x normal baseline)
- Off-hours access without prior notification
- Potential prompt injection patterns

Manual Review:

- Security Lead reviews AI usage logs monthly
- Quarterly access review (Section 4.2)
- Incident-triggered deep dive when alerts fire

Metrics:

- AI service usage by user/role
- Data classification distribution (Public/Protected/Secrets)
- Cost per service (detect shadow AI via unexpected charges)
- Error rates and failure modes

Controls:

- CIS 8.11: Conduct audit log reviews
- CIS 13.1: Centralize security event alerting
- CIS 13.2: Deploy a host-based intrusion detection solution

### 7.3 Privacy Monitoring

Requirement: Detect and prevent PII or secrets in AI prompts.

Techniques:

- Keyword scanning for common secret patterns (API keys, tokens, "password=")
- PII detection (names, emails, SSNs via regex)
- Alert on classification violations (Protected data to Gemini)
- Manual spot-checks of conversation samples

Response:

- Alert user immediately if secrets detected
- Rotate any exposed credentials as precaution
- Document incident in security log
- Provide remediation guidance to user

Controls:

- CIS 3.2: Establish and maintain a data inventory
- CIS 3.13: Deploy an automated data classification mechanism

---

## 8. Incident Response

### 8.1 AI-Specific Incidents

Definition: Security events involving AI systems, including:

- Secrets or PII exposed to AI service
- Unauthorized access to AI systems
- Data classification violations (e.g., Protected data sent to Gemini)
- Prompt injection attacks
- AI system compromise or abuse
- Vendor data breach notification
- Z.ai training on internal code (Public-Internal misclassified as Public-External)

### 8.2 Incident Classification

| Severity | Definition | Examples | Response Time |
|----------|------------|----------|---------------|
| Critical | Active compromise, secrets exposed, PII breach | API keys in Gemini prompt, PII processed by Z.ai, unauthorized access to Protected data | Immediate (within 1 hour) |
| High | Policy violation with significant risk | Protected data sent to Gemini, Z.ai used on Public-Internal code | Within 4 hours |
| Medium | Policy violation with moderate risk | Missing MFA, excessive API usage, unusual access pattern | Within 24 hours |
| Low | Minor policy deviation, no material risk | Incorrect data classification (self-corrected), documentation gap | Within 1 week |

### 8.3 Incident Response Procedure

Step 1: Detection and Reporting

- Anyone can report incident via <security@radioastronomy.io>
- No penalty for good-faith reporting
- Automated alerts via Graylog SIEM

Step 2: Initial Assessment (Security Lead)

- Classify severity
- Identify affected systems/data
- Determine if secrets exposed
- Notify CTO for High/Critical incidents

Step 3: Containment

- Rotate exposed credentials immediately
- Disable compromised accounts
- Isolate affected systems if necessary
- Preserve evidence (logs, conversation history)

Step 4: Eradication

- Remove unauthorized access
- Patch vulnerabilities
- Update configurations to prevent recurrence

Step 5: Recovery

- Restore services to normal operation
- Verify no residual compromise
- Monitor for related activity

Step 6: Post-Incident Review

- Document timeline and root cause
- Identify policy/control gaps
- Update procedures to prevent recurrence
- Share lessons learned with team (anonymized if personnel error)

Controls:

- CIS 17.1: Designate personnel to manage incident handling
- CIS 17.2: Establish and maintain contact information for reporting security incidents
- CIS 17.4: Establish and maintain an incident response process

### 8.4 Vendor Breach Response

If AI service vendor notifies RadioAstronomy.io of data breach:

1. Security Lead assesses impact based on vendor disclosure
2. Determine which data classifications were processed via that vendor
3. Assume worst case (all data sent to vendor is compromised)
4. If Protected data was involved:
   - Notify CTO immediately
   - Assess re-identification risk
   - Consider regulatory notification requirements (GDPR, etc.)
5. If only Public data involved:
   - Document incident
   - No external notification typically required
6. Review vendor evaluation and consider service termination
7. Update vendor risk register

---

## 9. Third-Party AI Services

### 9.1 Vendor Evaluation

Requirement: New AI service vendors must pass security review before approval.

Evaluation Criteria (see Appendix B: Vendor Evaluation Checklist):

- Data handling and retention policies
- Training opt-out availability (required for Public-Internal data)
- Security certifications (SOC 2 Type II preferred)
- Encryption (TLS 1.3+ in transit, AES-256 at rest)
- MFA support
- Incident response and breach notification procedures
- Privacy policy and GDPR compliance
- Terms of Service review

Approval Authority:

- Security Lead conducts initial evaluation
- CTO makes final approval/rejection decision
- Document rationale in vendor evaluation form

Prohibited Without Approval:

- Shadow AI (personal subscriptions for work use)
- Free/trial versions of commercial AI services
- AI services without training opt-out (for Public-Internal)

### 9.2 Contractual Requirements

Minimum Contract Terms:

- Clear data retention and deletion policy
- Training opt-out where applicable
- Breach notification within 72 hours
- Audit rights (ability to request security documentation)
- Data residency (US or EU preferred)
- Service Level Agreement (SLA) with availability targets
- Right to terminate with data deletion guarantee

For Approved Vendors:

- Gemini (Google Workspace): Enterprise agreement with training opt-out
- Claude Max: Anthropic terms with training opt-out via account settings
- Z.ai: Engineer role only, training acknowledged (Public-External acceptable)
- Llama 3.1 8B: Open source (no vendor contract; Meta license only)

### 9.3 Vendor Risk Monitoring

Ongoing Requirements:

- Quarterly review of vendor security posture
- Monitor vendor status pages for outages/incidents
- Review vendor release notes for security changes
- Annual vendor risk re-assessment
- Update vendor risk register with findings

Vendor Risk Register:

| Vendor | Last Assessment | Risk Level | Training Opt-Out | Next Review |
|--------|-----------------|------------|------------------|-------------|
| Google (Gemini) | 2025-10-26 | Low | Yes | 2026-10-26 |
| Anthropic (Claude) | 2025-10-26 | Low | Yes | 2026-10-26 |
| Z.ai (GLM-4.6) | 2025-10-26 | Medium | No (trains on data) | 2026-10-26 |
| Meta (Llama) | 2025-10-26 | Low | N/A (local) | 2026-10-26 |

---

## 10. Risk Scenarios and Controls

This section documents RadioAstronomy.io-specific AI risk scenarios, their likelihood/impact, and implemented controls.

### 10.1 R1: Data Exfiltration via AI Prompts

Scenario: User accidentally or intentionally submits sensitive data (Protected or Secrets) to AI service, leading to unauthorized disclosure.

Likelihood: Medium (accidental is probable; intentional is low)  
Impact: High (confidentiality breach, regulatory violation, competitive disadvantage)  
Risk Level: HIGH

Examples:

- Copy/pasting code with embedded API keys into Gemini
- Sending draft research paper to Z.ai (violates classification policy)
- Asking Claude Max to review credentials.yaml file

Controls:

- Data classification training (all personnel, onboarding + annual)
- Four-tier classification system with clear tool mapping (Section 3)
- Kasm DLP for Protected data via Claude Max (copy/paste blocking)
- Local models for Protected data (air-gapped from internet)
- Prompt review culture (encourage peer review for high-consequence prompts)
- Monitoring and alerting on classification violations (Section 7)

Residual Risk: MEDIUM (controls reduce likelihood, but user error remains possible)

### 10.2 R2: Unauthorized Access to AI Services

Scenario: Attacker gains access to AI services through compromised credentials, leading to data exposure or system abuse.

Likelihood: Low (MFA enforcement significantly reduces risk)  
Impact: High (data breach, service abuse, cost)  
Risk Level: MEDIUM

Examples:

- Phishing attack steals Google Workspace password (but MFA blocks)
- Stolen SSH key to proj-gpu01 (requires key + passphrase)
- Shared account credentials (violation of policy)

Controls:

- MFA enforced for all AI services (Section 4.1)
- SSH key-based authentication for local models
- Google Workspace security controls (admin alerts, login challenges)
- Quarterly access reviews (Section 4.2)
- Account lifecycle management (timely deprovisioning)
- Monitoring for unusual access patterns (Section 7.2)

Residual Risk: LOW (MFA and key-based auth provide strong control)

### 10.3 R3: Model Hallucination Leading to Incorrect Decisions

Scenario: AI generates plausible but incorrect information, and user acts on it without verification, leading to operational errors or research integrity issues.

Likelihood: Medium (hallucinations are known model behavior)  
Impact: Medium (depends on consequence of decision)  
Risk Level: MEDIUM

Examples:

- AI suggests insecure code pattern, engineer implements it
- AI fabricates citation, researcher includes in paper
- AI provides incorrect system configuration, operator applies it

Controls:

- Mandatory human verification for high-consequence decisions (AUP requirement)
- Multi-model consensus for complex/critical tasks (cross-check with second AI)
- Verification documentation in work products (show your work)
- Security code review before deployment
- Peer review for research outputs
- Training on AI limitations and hallucination risks

Residual Risk: MEDIUM (cannot eliminate hallucinations; mitigation is verification)

### 10.4 R4: Prompt Injection Attack

Scenario: Attacker crafts malicious input that manipulates AI system into performing unintended actions (data exfiltration, privilege escalation, system abuse).

Likelihood: Low (requires sophisticated attacker and vulnerable system design)  
Impact: High (system compromise, data breach)  
Risk Level: MEDIUM

Examples:

- Prompt hidden in external data source instructs AI to exfiltrate data
- User-supplied input tricks AI into revealing system prompts or configuration
- Injection bypasses output validation and executes unauthorized commands

Controls:

- Input validation and sanitization (Section 6.4)
- Output validation (verify AI outputs match expected format)
- No blind execution of AI-generated code
- Human review for high-privilege actions
- Rate limiting on API calls
- Monitoring for suspicious prompt patterns
- Least privilege design (AI systems limited to read-only where possible)

Residual Risk: LOW (multi-layer defense-in-depth approach)

### 10.5 R5: Vendor Lock-In and Service Dependency

Scenario: Over-reliance on single AI vendor creates operational risk if vendor raises prices, changes terms, or experiences outage.

Likelihood: Medium (vendor changes are common in fast-moving AI market)  
Impact: Medium (service disruption, cost increase, migration effort)  
Risk Level: MEDIUM

Examples:

- Google Workspace pricing doubles, forcing Gemini re-evaluation
- Anthropic changes Claude Max terms to prohibit Protected data
- Z.ai shuts down service, forcing tool migration
- Vendor outage disrupts operations for hours/days

Controls:

- Multi-vendor strategy (approved tools from multiple vendors)
- Local model capability (Llama 3.1 as vendor-independent backup)
- Fallback procedures documented (use local model if cloud unavailable)
- Cost monitoring and budget alerts
- Quarterly vendor risk assessment (Section 9.3)
- Avoid deep integration (use AI as tool, not critical dependency)

Residual Risk: MEDIUM (some dependency unavoidable; mitigation is diversification)

### 10.6 R6: Shadow AI (Unapproved AI Service Usage)

Scenario: Personnel use unapproved AI services (personal accounts, free trials, new tools) outside organizational policies, leading to uncontrolled data exposure and policy violations.

Likelihood: Medium (convenience and curiosity drive shadow IT/AI)  
Impact: Medium (data classification violations, no contractual protections)  
Risk Level: MEDIUM

Examples:

- Engineer uses free Claude.ai account for work tasks (no training opt-out)
- Researcher tries new AI service (not security evaluated)
- Personnel shares Gemini personal account credentials with team

Controls:

- Clear approved tool list (Section 3.2) and prohibition of alternatives
- Training on shadow AI risks (all personnel onboarding)
- Cost monitoring (unexplained charges indicate shadow subscriptions)
- Periodic access audits (check for unapproved service usage)
- Easy access to approved tools (reduce incentive for shadow AI)
- No-penalty reporting culture (encourage disclosure of accidental shadow AI)

Residual Risk: MEDIUM (difficult to prevent entirely without draconian network controls)

### 10.7 R7: Model Poisoning or Supply Chain Attack

Scenario: Malicious actor compromises AI model or training data, causing model to produce biased, incorrect, or harmful outputs.

Likelihood: Low (reputable vendors have strong supply chain security)  
Impact: High (subtle model manipulation could persist undetected)  
Risk Level: MEDIUM

Examples:

- Compromised Hugging Face model contains backdoor
- Vendor insider manipulates training data to bias model outputs
- Adversarial patches in training data cause specific failure modes

Controls:

- Model provenance verification (Section 6.1)
- Use only verified model sources (official vendor APIs, verified publishers)
- Monitor for model behavior changes after updates
- Checksum/hash verification for downloaded models
- Vendor security posture assessment (SOC 2 Type II)
- Output validation and human review

Residual Risk: LOW (controls significantly reduce likelihood and impact)

### 10.8 R8: Z.ai Training on Infrastructure Code

Scenario: Engineer uses Z.ai on RadioAstronomy.io infrastructure or proprietary code (Public-Internal tier), causing our competitive IP to become part of Z.ai's training dataset.

Likelihood: Medium (classification confusion or convenience could lead to violation)  
Impact: High (loss of intellectual property control, competitive disadvantage)  
Risk Level: HIGH

Examples:

- Engineer uses Z.ai to review agent orchestration code (Public-Internal)
- Z.ai used on proprietary tooling or infrastructure scripts
- Engineer forgets Z.ai trains on data and uses for internal repo

Controls:

- Four-tier classification training emphasizing domain boundaries (astronomy code vs infrastructure code)
- Z.ai restricted to Engineer role only (RBAC enforcement)
- Clear policy: Z.ai only for Public-External research code, not infrastructure
- Repo tagging/labeling (visual indicators of classification)
- Monitoring for Z.ai usage patterns (review logs for Public-Internal violations)
- Training on "when to use which tool" decision tree (Section 3.3)

Residual Risk: MEDIUM (technical controls and training reduce risk; user error remains possible)

### 10.9 R9: Data Classification Confusion

Scenario: Personnel are uncertain whether code is Public-Internal (infrastructure) vs Public-External (research), leading to accidental tool misuse.

Likelihood: Medium (edge cases and lack of clear guidance can cause confusion)  
Impact: Medium (classification violation, potential data exposure)  
Risk Level: MEDIUM

Examples:

- Engineer unsure if astronomy analysis script is Public-External (research code) or Public-Internal (our IP)
- Unclear whether forked external repo is Public-External or Public-Internal
- Personnel guesses classification instead of asking

Controls:

- Clear classification examples in Appendix C (with edge cases)
- Decision framework for ambiguous cases (Section 3.1)
- Security Lead available for classification questions (no penalty for asking)
- Training materials emphasize domain boundaries (research vs infrastructure)
- Default to higher classification when uncertain (more restrictive)
- Repo tagging and documentation (proactive classification labeling)

Residual Risk: MEDIUM (ambiguity inherent in knowledge work; controls provide guidance)

### 10.10 R10: Cost Overrun and Budget Exhaustion

Scenario: Uncontrolled AI usage leads to excessive costs, exhausting budget and forcing service disruption.

Likelihood: Low (current tools have fixed or predictable costs)  
Impact: Medium (budget strain, potential service cutoff)  
Risk Level: LOW

Examples:

- Gemini usage spikes unexpectedly (but Workspace cost is fixed)
- Engineer uses Z.ai excessively (if per-API-call pricing)
- Local model GPU compute saturates resources

Controls:

- Budget monitoring (monthly cost review per vendor)
- Usage alerts (notify if spending exceeds baseline)
- Per-user quotas or rate limits where available
- Quarterly cost review as part of vendor risk assessment
- Shadow AI detection (unexplained charges)

Residual Risk: LOW (current tools have manageable cost structure)

---

## 11. Compliance Mapping

This standard implements requirements from multiple compliance frameworks:

### 11.1 NIST AI Risk Management Framework (AI RMF 1.0)

| AI RMF Function | NIST AI RMF Categories | This Standard Sections |
|-----------------|------------------------|------------------------|
| GOVERN | Accountability, policies, oversight | Section 1 (Purpose), Section 2.3 (Related Policies) |
| MAP | Context, categorization, risks | Section 3 (Data Classification), Section 10 (Risk Scenarios) |
| MEASURE | Metrics, testing, validation | Section 7 (Logging and Monitoring) |
| MANAGE | Risk response, resources, awareness | Section 8 (Incident Response), Section 9 (Vendor Management) |

### 11.2 CIS Controls v8

| CIS Control | Control Name | This Standard Sections |
|-------------|--------------|------------------------|
| 1 | Inventory and Control of Enterprise Assets | Section 6.1 (Model Provenance) |
| 2 | Inventory and Control of Software Assets | Section 6.1, Section 9.3 (Vendor Risk Register) |
| 3 | Data Protection | Section 3 (Data Classification), Section 5 (Data Handling) |
| 4 | Secure Configuration | Section 6 (Model Security) |
| 5 | Account Management | Section 4 (Access Control) |
| 6 | Access Control Management | Section 4 (Access Control) |
| 7 | Continuous Vulnerability Management | Section 6.3 (Model Updates) |
| 8 | Audit Log Management | Section 7 (Logging and Monitoring) |
| 12 | Network Infrastructure Management | Section 6.2 (Model Isolation) |
| 13 | Network Monitoring and Defense | Section 7.2 (Security Monitoring) |
| 16 | Application Software Security | Section 6.4 (Prompt Injection Prevention) |
| 17 | Incident Response Management | Section 8 (Incident Response) |

### 11.3 ISO 31000:2018 (Risk Management)

| ISO 31000 Principle | This Standard Implementation |
|---------------------|------------------------------|
| Integrated | Standard integrates with broader POL-001 governance framework |
| Structured and comprehensive | Section 10 documents risk scenarios systematically |
| Customized | Risk scenarios tailored to RadioAstronomy.io context |
| Inclusive | Multi-stakeholder input (CTO, Security Lead, personnel) |
| Dynamic | Quarterly reviews and continuous monitoring (Section 7, 9.3) |
| Best available information | Evidence-based risk assessment (STD-001 methodology) |
| Human and cultural factors | Training and awareness programs |
| Continual improvement | Incident lessons learned feed back to policy (Section 8.3) |

### 11.4 Colorado SB24-205 (AI Algorithmic Discrimination)

| SB24-205 Requirement | This Standard Implementation |
|----------------------|------------------------------|
| Risk assessment for high-risk AI | STD-001 (AI System Assessment Standard) |
| Reasonable care to avoid algorithmic discrimination | Section 10 risk scenarios include fairness considerations |
| Transparency and disclosure | STD-002 (AI Transparency & Disclosure Standard) |
| Accountability and governance | POL-001 (AI Governance Policy) establishes roles and oversight |

---

## 12. References

### Internal Documents

- POL-001: AI Governance Policy
- STD-001: AI Risk Assessment & Management Standard
- STD-002: AI Transparency & Disclosure Standard
- AUP-001: AI Acceptable Use Policy

### External Standards and Frameworks

- NIST AI Risk Management Framework (AI RMF 1.0): <https://www.nist.gov/itl/ai-risk-management-framework>
- CIS Controls v8: <https://www.cisecurity.org/controls/v8>
- ISO 31000:2018 Risk Management: <https://www.iso.org/iso-31000-risk-management.html>
- Colorado SB24-205: <https://leg.colorado.gov/bills/sb24-205>

### Vendor Documentation

- Google Gemini Security: <https://workspace.google.com/security/>
- Anthropic Claude Security: <https://www.anthropic.com/security>
- Z.ai Documentation: <https://z.ai/docs>
- Meta Llama: <https://ai.meta.com/llama/>

---

## 13. Appendices

### Appendix A: Glossary

| Term | Definition |
|------|------------|
| Data Classification | Categorization of data by sensitivity and handling requirements (Section 3.1) |
| DLP (Data Loss Prevention) | Technical controls preventing unauthorized data exfiltration |
| Hallucination | AI model generating plausible but factually incorrect information |
| MFA (Multi-Factor Authentication) | Authentication requiring two or more verification factors |
| Model Provenance | Documented origin, training data, and integrity of AI model |
| Prompt Injection | Attack technique manipulating AI via crafted inputs |
| Protected Data | Confidential organizational information (Tier 2 classification) |
| Public-Internal Data | RadioAstronomy.io controlled public content (Tier 1a classification) |
| Public-External Data | Community-controlled public content (Tier 1b classification) |
| RBAC (Role-Based Access Control) | Access control based on organizational roles |
| Secrets | Credentials, keys, tokens, PII (Tier 3 classification) |
| Shadow AI | Use of unapproved AI services outside organizational policies |
| Training Opt-Out | Policy preventing AI vendor from using customer data for model training |

### Appendix B: Vendor Evaluation Checklist

Use this checklist when evaluating new AI service vendors for approval per Section 9.1.

Vendor Information:

- Vendor Name: _______________________
- Service Name: _______________________
- Requesting User/Team: _______________________
- Business Justification: _______________________
- Date: _______________________

Data Handling:

- [ ] Clear data retention policy documented
- [ ] Data deletion process available
- [ ] Training opt-out available (for enterprise)
- [ ] Data residency options (US/EU preferred)
- [ ] Data not used for vendor's model training by default

Security Posture:

- [ ] SOC 2 Type II or equivalent certification
- [ ] Encryption in transit (TLS 1.3+)
- [ ] Encryption at rest
- [ ] Multi-factor authentication supported
- [ ] Incident response procedures documented
- [ ] Breach notification policy (within 72 hours)
- [ ] Regular third-party security audits

Compliance:

- [ ] GDPR compliance documented
- [ ] Willing to sign BAA if processing PII
- [ ] Privacy policy reviewed and acceptable
- [ ] Terms of Service reviewed and acceptable

Availability:

- [ ] Published SLA (target 99.9%+)
- [ ] Status page for service health
- [ ] Incident communication process
- [ ] Acceptable pricing model

Transparency:

- [ ] Model capabilities documented
- [ ] Known limitations disclosed
- [ ] Bias/fairness information available
- [ ] Model update changelog available

Risk Assessment:

- [ ] Residual risk assessment completed (attach STD-001 assessment)
- [ ] Data classification compatibility confirmed
- [ ] Integration plan documented
- [ ] User training plan developed

Approval:

- Security Lead Review: _______________________ Date: _______
- CTO Approval/Rejection: _______________________ Date: _______
- Rationale: _______________________

If approved, add service to Section 3.2 and communicate to all personnel.

### Appendix C: Data Classification Examples

Use these examples to determine appropriate data classification per Section 3.

#### PUBLIC-INTERNAL Examples

Clearly Public-Internal:

- Published research papers authored by RadioAstronomy.io
- Public GitHub repositories owned by RadioAstronomy.io organization
- Technical blog posts on radioastronomy.io domain
- Open-source documentation we author and maintain
- Public-facing website content
- Published conference presentations

Edge Cases (Public-Internal):

- Draft of paper submitted for publication (becomes Public-Internal after acceptance, Protected before)
- Code in public repo but not yet documented (Public-Internal if in org repo)
- Internal documentation intended for eventual publication (Protected until published, then Public-Internal)

#### PUBLIC-EXTERNAL Examples

Clearly Public-External:

- Astronomy analysis pipelines (data processing, calibration, reduction)
- Data science research code (statistical analysis, modeling, visualization)
- Scientific computation code (numerical methods, simulations)
- Research workflows and automation scripts
- External GitHub repositories (not owned by RadioAstronomy.io)
- Open-source projects we contribute to (not owned by us)
- Community forums and discussions
- Published research papers by other organizations
- Public astronomical datasets
- Stack Overflow and similar Q&A sites

Edge Cases (Public-External):

- Astronomy code in our repository (Public-External if research code, even in our repo)
- Our fork of external astronomy tools (Public-External for research analysis portions)
- Our contributions to external projects (Public-External once merged upstream)

#### PROTECTED Examples

Clearly Protected:

- Draft research papers (before publication)
- Internal system configurations
- Unpublished methodologies or algorithms
- Business strategies and plans
- Internal meeting notes and decisions
- Personnel information (non-PII)
- Vendor contracts and agreements
- Financial information (budget, spending)

Edge Cases (Protected):

- Paper accepted but not yet published (Protected until publication date)
- Internal tool source code not intended for open-source (Protected unless we decide to publish)
- Anonymized research data (may be Public-Internal if truly anonymized; Protected if re-identification risk exists)

#### SECRETS Examples

Clearly Secrets:

- API keys and access tokens
- Passwords and passphrases
- SSH private keys
- Database connection strings with credentials
- OAuth client secrets
- Encryption keys
- Personally Identifiable Information (PII): names, emails, addresses, phone numbers, SSN, etc.

Edge Cases (Secrets):

- Expired credentials (still Secrets; don't use AI)
- Test/dummy credentials (Secrets if resemble real format; Public-Internal if obviously synthetic like "user:password")

#### Decision Framework

When Uncertain:

1. Default to higher classification (more restrictive)
2. Ask yourself: Would I be comfortable if this appeared in Z.ai's training data? If no → NOT Public-External
3. Ask yourself: Would I be comfortable if a competitor saw this? If no → Protected
4. Ask yourself: Does this contain credentials or PII? If yes → Secrets
5. Still uncertain? Ask Security Lead before processing (no penalty for asking)

### Appendix D: Incident Response Contact Information

| Role | Name | Email | Phone |
|------|------|-------|-------|
| Security Lead | [Name] | <security@radioastronomy.io> | [Phone] |
| CTO | [Name] | <cto@radioastronomy.io> | [Phone] |
| AI System Administrator | [Name] | <ai-admin@radioastronomy.io> | [Phone] |

After-Hours Contact: [Phone/On-Call System]

Anonymous Reporting Form: <https://radioastronomy.io/security-report> (future)

### Appendix E: Change Log

| Version | Date | Section | Change Summary |
|---------|------|---------|----------------|
| 1.0 | 2025-01-15 | All | Initial standard creation based on NIST AI RMF |
| 1.1 | 2025-10-26 | 3.1, 3.2 | SECURITY CORRECTION: Updated to 4-tier data classification (added Public-External); corrected Protected data controls (removed Gemini, specified Kasm isolation for Claude Max) |
| 1.1 | 2025-10-26 | 3.2, Throughout | Removed all unapproved OpenAI/ChatGPT/GPT-4 references (8+ locations); added Z.ai/GLM-4.6 with training constraint |
| 1.1 | 2025-10-26 | 4.2 | Updated access matrix with Z.ai (Engineer role only) |
| 1.1 | 2025-10-26 | 5.2 | Added Z.ai to data retention table with training disclosure |
| 1.1 | 2025-10-26 | 10.1 | Updated R1 (Data Exfiltration) examples and controls for correct tool set |
| 1.1 | 2025-10-26 | 10.6 | Updated R6 (Shadow AI) examples for correct prohibited tools |
| 1.1 | 2025-10-26 | 10.8 | NEW: Added R8 (Z.ai Training on Internal Code) risk scenario |
| 1.1 | 2025-10-26 | 10.9 | NEW: Added R9 (Data Classification Confusion) risk scenario |
| 1.1 | 2025-10-26 | Appendix C | Expanded data classification examples with edge cases and decision framework |

---

## Document Approval

Document Owner: CTO  
Effective Date: 2025-10-26

Acknowledgment Required: All personnel must acknowledge this standard within 30 days of effective date.

Acknowledgment Statement:
"I have read and understood the Secure AI Systems Standard v1.1. I agree to comply with all requirements and will seek clarification from the Security Lead if I have questions about data classification or tool selection."
