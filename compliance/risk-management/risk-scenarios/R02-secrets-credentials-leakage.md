# Risk Scenario: Secrets & Credentials Leakage to AI Systems

**Risk ID:** R02  
**Category:** Technical Security  
**Last Updated:** 2025-01-26  
**Owner:** CTO / Security Lead

---

## Risk Description

AI systems (particularly cloud-based LLMs and code-assist tools) receive user inputs that may inadvertently contain sensitive credentials, API keys, passwords, private keys, tokens, or other secrets. When these secrets are submitted to AI models—whether through chat interfaces, code generation requests, or automated workflows—they risk:

1. **Exposure to model training data** (if model trains on inputs)
2. **Storage in vendor logs** (chat history, debugging logs, abuse monitoring)
3. **Exposure to model outputs** (AI may echo secrets in responses, suggestions, or completions)
4. **Cross-tenant leakage** (in multi-tenant environments with insufficient isolation)
5. **Downstream propagation** (AI-generated code containing secrets gets committed to repositories)

This risk is particularly acute in AI-native organizations where AI assists with infrastructure code, configuration management, deployment scripts, and automation workflows—contexts where secrets naturally appear.

**Example Scenarios:**
- Developer uses Claude to debug authentication code and pastes AWS access key in conversation
- Engineer asks ChatGPT to review Terraform configuration containing database passwords
- Automation script sends API logs to AI for analysis; logs contain bearer tokens
- Code completion tool suggests SSH private key fragment from another user's training data
- AI-generated deployment script includes hardcoded credentials that get committed to Git

---

## Risk Assessment

### Likelihood

**Rating:** HIGH

**Factors Increasing Likelihood:**
- AI-native workflows mean AI touches most operational tasks, increasing exposure surface
- Developers naturally paste code/configs containing secrets when seeking help
- Automation pipelines may inadvertently include secrets in prompts or context
- Copy-paste habits from non-AI tools (Stack Overflow, documentation) carry over to AI
- Insufficient user training on what NOT to share with AI systems
- Code completion tools operate on full file context, may see secrets in comments or nearby code

**Factors Decreasing Likelihood:**
- Training opt-out models reduce (but don't eliminate) training data exposure
- Growing awareness of AI security risks in developer community
- Pre-commit hooks and secret scanning tools catch some leakage before AI involvement

### Impact

**Rating:** HIGH

**Potential Impacts:**
- **Technical:** Unauthorized access to systems, data breaches, infrastructure compromise, service disruption
- **Business:** Incident response costs, system remediation, credential rotation across all systems, productivity loss during lockdown
- **Reputational:** Loss of customer trust, public disclosure requirements, damage to security posture perception
- **Legal/Compliance:** Data breach notification obligations, potential GDPR/CCPA violations if customer data accessed, SOC 2/ISO 27001 non-compliance
- **Safety:** In astronomy context, potential unauthorized access to telescope control systems, data repositories, or research collaboration platforms
- **Financial:** Direct costs of incident response, credential rotation, potential fines, increased insurance premiums, lost business opportunities

**Impact Quantification:**
- Single AWS key compromise: $50K+ in unauthorized compute costs before detection
- Database credential exposure: All customer data at risk, mandatory breach notification
- SSH key leakage: Lateral movement across entire infrastructure, full system rebuild may be required
- API token exposure: Potential data exfiltration, service abuse, rate limit exhaustion

### Risk Level

**Overall Risk Rating:** HIGH

**Rationale:** High likelihood (AI touches most workflows) × High impact (credential compromise enables significant damage) = HIGH risk requiring priority mitigation. Even with training opt-out models, risks of log storage, output echoing, and downstream propagation remain. This is an active, ongoing exposure rather than theoretical concern.

---

## Current Controls

### Technical Controls

- **Environment Variables for Secrets:** Infrastructure secrets stored in environment variables, not hardcoded in configuration files (reduces but doesn't eliminate exposure risk if entire env file is pasted)
- **Training Opt-Out Models:** Gemini Pro 2.5 (Workspace enterprise with training opt-out) and Claude Sonnet 4 (no training commitment) used for all internal work
- **Data Classification Policy:** Secrets designated as highest classification level, explicit "never use with AI" guidance
- **Pre-commit Hooks:** Git pre-commit hooks scan for common secret patterns (API keys, AWS credentials) before commits (catches downstream propagation, not initial AI exposure)

### Process Controls

- **Acceptable Use Policy:** Explicit prohibition on submitting credentials, secrets, API keys to AI systems documented in AUP
- **Code Review Requirements:** All AI-generated code must undergo human review before deployment (provides opportunity to catch leaked secrets before production)
- **Credential Rotation Schedule:** Regular rotation of critical credentials reduces window of exposure if leakage occurs

### Organizational Controls

- **Security Awareness Training:** User training includes "never paste passwords" guidance, but not yet comprehensive AI-specific secret handling training
- **Data Classification Headers:** Documents tagged with classification level, "Secrets" classification documented
- **Incident Response Plan:** Procedure exists for credential compromise response, includes AI-specific scenarios

---

## Residual Risk

**Residual Risk Level:** MEDIUM

**Analysis:** 

Current controls significantly reduce risk from HIGH to MEDIUM, but substantial residual risk remains:

**Remaining Exposure Vectors:**
1. **Human Error:** Despite training and policy, developers may accidentally paste secrets when troubleshooting urgent production issues or when fatigued
2. **Partial Secret Exposure:** Even with training opt-out, secrets in vendor logs (chat history, abuse monitoring) remain accessible to vendor; unclear retention and access controls
3. **Code Completion Blind Spots:** Pre-commit hooks catch secrets before Git, but not during AI-assisted code writing when secret might be briefly visible to model
4. **Automation Context:** Automated workflows may include secrets in log context sent to AI for analysis, harder to prevent than interactive use
5. **Insufficient Technical Enforcement:** Current controls rely heavily on user awareness; no technical prevention mechanism (e.g., secret scanning at AI input boundary)

**Scenarios Still Possible:**
- Developer debugging production auth issue at 2am pastes connection string to get quick help
- Automation script sends full error logs to AI; logs contain temporary tokens
- Junior developer unfamiliar with policy asks AI to review deployment configuration
- Code completion suggests configuration snippet with secret from earlier session

**Why Current Controls Don't Fully Mitigate:**
Current approach is primarily **procedural** (policy, training, review) rather than **preventive** (technical blocking). Procedural controls are important but vulnerable to human error, especially under time pressure or with insufficient training. Training opt-out prevents model training exposure but doesn't address log storage or output echoing risks.

**Risk Acceptance Decision:**

- **Accepted By:** AI Review Board (CTO decision authority)
- **Date:** 2025-01-26
- **Conditions:** Residual MEDIUM risk accepted contingent on implementation of Priority 1 recommended controls within Q1 2025. If controls not implemented by Q1 end, escalate to MEDIUM-HIGH and require immediate action plan.
- **Review Frequency:** Quarterly review of residual risk level; triggered review if secret leakage incident occurs

---

## Recommended Controls

### Priority 1 (Immediate/Short-term)

1. **Secret Scanning at AI Input Boundary**
   - **Description:** Implement automated scanning of text before submission to AI systems; detect and block known secret patterns (API keys, passwords, tokens, private keys)
   - **Implementation:** 
     - Evaluate tools: GitHub Secret Scanner, TruffleHog, GitGuardian, or custom regex
     - Integrate with browser extensions or API wrappers for AI services
     - Create blocklist of high-risk patterns (AWS keys, database URLs, SSH keys)
     - Provide clear user feedback when secret detected: "Blocked - detected potential credential"
   - **Expected Impact:** Reduces likelihood from HIGH to MEDIUM-LOW by preventing most accidental submissions
   - **Effort:** Medium (tool evaluation, integration, testing)
   - **Timeline:** 4-6 weeks
   - **Owner:** CTO + Infrastructure Lead

2. **Credential Management System Adoption**
   - **Description:** Migrate all secrets from environment variables to proper secrets management (HashiCorp Vault, AWS Secrets Manager, or equivalent); enforce secrets never exist in plaintext files
   - **Implementation:**
     - Audit current secret storage locations (env files, configs, scripts)
     - Select secrets management solution (recommend AWS Secrets Manager for cloud-native approach)
     - Migrate infrastructure secrets first, then application secrets
     - Update deployment pipelines to fetch secrets programmatically
     - Remove plaintext secrets from all configuration files
   - **Expected Impact:** Reduces impact from HIGH to MEDIUM by ensuring even if context is pasted, secrets aren't in plaintext
   - **Effort:** High (infrastructure change, testing, migration)
   - **Timeline:** 8-12 weeks
   - **Owner:** Infrastructure Lead

3. **Enhanced AI Security Training**
   - **Description:** Develop and deliver comprehensive AI-specific security training covering secret handling, what not to share, safe prompting practices
   - **Implementation:**
     - Create training module: "AI Security for Developers"
     - Include scenarios: debugging auth errors, reviewing configs, pasting logs
     - Provide "safe prompting" guidelines: redact before paste, use placeholders, request general advice only
     - Mandatory completion for all users before AI access
     - Quarterly refresher with incident case studies
   - **Expected Impact:** Reduces likelihood by 30-40% through improved awareness and behavior change
   - **Effort:** Low (training development, delivery)
   - **Timeline:** 2-3 weeks
   - **Owner:** Security Lead + CTO

### Priority 2 (Medium-term)

1. **AI Usage Audit Logging**
   - **Description:** Implement comprehensive logging of all AI interactions; periodic audit reviews to identify policy violations or near-misses
   - **Implementation:**
     - Enable vendor audit logs where available (Workspace audit for Gemini)
     - Implement local logging for CLI tools (Gemini CLI, API usage)
     - Create audit review process: quarterly sample review of 5% of conversations
     - Flag for review: long text inputs (>1000 chars), keywords like "password", "key", "secret"
   - **Expected Impact:** Improves detection of policy violations, provides evidence for training effectiveness, creates accountability
   - **Effort:** Medium (logging setup, review process)
   - **Timeline:** 6-8 weeks
   - **Owner:** Security Lead

2. **Isolated AI Environments for Sensitive Work**
   - **Description:** Create air-gapped or local AI deployment for work involving credentials; separate "clean" and "sensitive" AI usage contexts
   - **Implementation:**
     - Deploy local LLM (Llama-3-7B already available) for Protected data workflows
     - Document decision tree: "When to use local vs cloud AI"
     - Enforce: any work involving credentials uses local-only model
     - Consider dedicated Claude workspace with no internet access for credential-adjacent work
   - **Expected Impact:** Eliminates cloud exposure risk for credential-adjacent work
   - **Effort:** Low (local model already deployed, process documentation needed)
   - **Timeline:** 2-4 weeks
   - **Owner:** CTO

### Priority 3 (Long-term/Strategic)

1. **Zero-Knowledge AI Proxy**
   - **Description:** Implement proxy layer that sanitizes all inputs to AI systems; strips secrets, PII, and sensitive patterns before forwarding to AI services
   - **Implementation:**
     - Research zero-knowledge proxy solutions or build custom
     - Integrate with all AI access points (web, API, CLI)
     - Maintain sanitization rules (secrets, PII, data classification markers)
     - Provide transparency: show users what was redacted
   - **Expected Impact:** Technical prevention layer eliminates human error factor
   - **Effort:** High (custom development or vendor solution integration)
   - **Timeline:** 4-6 months
   - **Owner:** Engineering Lead

---

## NIST AI RMF Mapping

### Relevant Functions

**GOVERN:**
- **GOVERN-1.2:** Roles and responsibilities defined for AI risk management (Owner: CTO/Security Lead documented)
- **GOVERN-1.3:** Organizational AI risk management processes (Policy prohibits credential submission; incident response plan includes AI scenarios)
- **GOVERN-4.2:** Data governance (Data classification policy designates secrets as never-AI-processable)

**MAP:**
- **MAP-1.5:** Impacts on individuals, groups, communities (Secret leakage affects entire organization, customers, partners)
- **MAP-3.3:** Security and resilience characteristics (Risk directly relates to security posture and system resilience)
- **MAP-5.1:** Model and system deployment risks (Risk inherent to AI deployment model - cloud vs local)

**MEASURE:**
- **MEASURE-2.3:** AI system performance monitoring (Audit logging provides measurement of policy compliance)
- **MEASURE-2.11:** Security and resilience metrics (Incident rate, secret scanning blocks, near-miss detection)

**MANAGE:**
- **MANAGE-1.1:** Response plans activated (Credential rotation procedure, incident response for leakage)
- **MANAGE-2.3:** Risk mitigations prioritized (Priority 1/2/3 controls documented with owners and timelines)
- **MANAGE-3.2:** AI system updates (Controls will evolve as secret management system deployed)

### Framework Alignment Notes

This risk scenario addresses NIST AI RMF MAP-3.3 (security and resilience) and MANAGE-1.1 (response plans). The multi-layered control approach (technical, process, organizational) aligns with framework guidance on comprehensive risk management. Training opt-out model selection demonstrates GOVERN function (considering deployment risks). Secret scanning implementation satisfies MEASURE function (monitoring and detection).

---

## Related Artifacts

### Related Risks
- **R01:** Model Bias & Discrimination (Related - both involve data exposure risks)
- **R03:** Data Poisoning & Training Data Contamination (Depends on - if model trains on data, leaked secrets could poison training)
- **R08:** Insufficient Access Controls (Compounds - weak access controls increase impact of leaked credentials)
- **R10:** Vendor Lock-in & Service Availability (Related - vendor log retention increases exposure window)

### Affected Systems/Models
- Gemini Pro 2.5 (all roles) - Primary risk exposure via Workspace integration
- Claude Sonnet 4 (CTO) - Risk exposure via isolated workspace, lower likelihood due to limited users
- GLM-4 via Z.ai (Engineer role) - Risk exposure but limited to Public-External work
- Llama-3-7B (local) - Minimal risk due to air-gap, but still possible in prompts
- Gemini CLI (automation) - HIGH risk due to automated workflows potentially including secrets in context

### Relevant Policies/Standards
- AI Governance Policy (Section 4.2: Data Classification - prohibits Secrets in AI processing)
- Acceptable Use Policy (Section 3: Prohibited Actions - explicit no-credentials clause)
- Secure AI Systems Standard (Section 2.1: Credential Management requirements)
- Incident Response Plan (Section 5: Credential Compromise Procedures)

### Model Cards
- gemini-pro-2-5-model-card.yaml (Training opt-out documented as partial mitigation)
- claude-sonnet-4-model-card.yaml (No-training commitment documented)
- anthropic-claude-sonnet-4-model-card.yaml (Organizational model card references this risk)

### Decision Log References
- **DEC-2025-002:** Data Classification Scheme Adoption (4-tier system including Secrets classification)
- **DEC-2025-003:** GLM-4 Model Approval (Public-External only boundary prevents most secret exposure via this model)

---

## Monitoring & Detection

### Key Risk Indicators (KRIs)

1. **Secret Exposure Incidents**
   - **Metric:** Count of confirmed secret leakage to AI systems per month
   - **Threshold:** >0 triggers immediate review and control strengthening
   - **Frequency:** Continuous monitoring, monthly reporting
   - **Data Source:** Incident reports, audit log reviews, user reports

2. **Secret Scanner Blocks**
   - **Metric:** Count of secret patterns blocked at AI input boundary per week
   - **Threshold:** >5 per week indicates insufficient user training; >20 suggests systemic issue
   - **Frequency:** Weekly review
   - **Data Source:** Secret scanning tool logs (once Priority 1 control implemented)

3. **Credential Rotation Lag**
   - **Metric:** Days since last credential rotation for critical systems
   - **Threshold:** >90 days requires immediate rotation review
   - **Frequency:** Monthly audit
   - **Data Source:** Secrets management system audit logs

4. **Training Completion Rate**
   - **Metric:** Percentage of AI users who completed AI security training
   - **Threshold:** <100% triggers access suspension for non-compliant users
   - **Frequency:** Real-time enforcement, quarterly compliance report
   - **Data Source:** Training platform completion records

### Detection Methods

- **Secret Scanner Alerts:** Automated detection at AI input boundary (Priority 1 control)
- **Audit Log Reviews:** Quarterly sample review of 5% of AI conversations for policy compliance
- **User Reports:** Encourage users to report near-miss incidents or concerns
- **Pre-commit Hook Blocks:** Git pre-commit secret scanning catches downstream propagation
- **Vendor Security Notifications:** Monitor for vendor disclosures of credential exposure incidents
- **Unusual Access Pattern Detection:** Monitor system access logs for credential abuse (unusual IPs, access times, resource usage)

### Incident Response

**If this risk materializes:**

1. **Immediate Actions:** 
   - Identify which credential(s) were exposed and to which AI system(s)
   - Immediately rotate exposed credential(s)
   - Review system access logs for unauthorized use during exposure window
   - Disable compromised accounts/services if suspicious activity detected

2. **Escalation:** 
   - Notify CTO immediately (any credential exposure is HIGH priority)
   - Escalate to CEO if customer data potentially accessed
   - Legal counsel involved if breach notification potentially required

3. **Investigation:** 
   - Determine exposure window (when leaked, when detected)
   - Identify all systems accessible with compromised credential
   - Review AI system logs (if available) to determine if credential was stored, echoed, or trained on
   - Assess likelihood of actual exploitation vs. potential exposure

4. **Remediation:** 
   - Rotate all credentials for affected system(s)
   - Review and rotate credentials for related systems (lateral movement risk)
   - If training-capable model: request vendor purge of training data (if feasible)
   - If customer data accessed: initiate breach notification process

5. **Recovery:** 
   - Validate no unauthorized access occurred or remediate unauthorized changes
   - Restore from clean backup if systems were compromised
   - Re-enable services once credentials rotated and clean

6. **Lessons Learned:** 
   - Post-incident review within 5 business days
   - Update training materials with incident case study (anonymized)
   - Accelerate Priority 1 controls if incident reveals gap
   - Update risk scenario based on actual incident patterns

---

## Review History

| Date | Reviewer | Changes | Risk Level Change |
|------|----------|---------|-------------------|
| 2025-01-26 | CTO | Initial risk scenario creation | N/A → HIGH |
| 2025-01-26 | AI Review Board | Accepted residual MEDIUM risk with conditions | HIGH → MEDIUM (residual) |

**Next Scheduled Review:** 2025-04-26 (Quarterly)

---

## References & Resources

- NIST AI RMF: MAP-3.3 (Security and Resilience Characteristics)
- OWASP Top 10 for LLM Applications: LLM06 (Sensitive Information Disclosure)
- GitHub Secret Scanner Documentation: https://docs.github.com/en/code-security/secret-scanning
- TruffleHog Secret Detection: https://github.com/trufflesecurity/trufflehog
- AWS Secrets Manager Best Practices: https://docs.aws.amazon.com/secretsmanager/
- HashiCorp Vault Documentation: https://www.vaultproject.io/docs

---

## Notes

This risk is particularly acute for RadioAstronomy.io as AI-native organization where AI touches most operational workflows. The combination of high likelihood (frequent AI use) and high impact (credential compromise) makes this a priority risk requiring immediate attention.

Priority 1 controls (secret scanning, credential manager, training) are targeted for Q1 2025 implementation. Residual MEDIUM risk is conditionally accepted pending these implementations. If Priority 1 controls slip beyond Q1 2025, risk level escalates to MEDIUM-HIGH and requires immediate executive action plan.
