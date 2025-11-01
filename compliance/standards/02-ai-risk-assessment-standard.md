# AI Risk Assessment & Management Standard

Organization: RadioAstronomy.io  
Effective Date: 2025-10-26  
Version: 1.1  
Owner: AI Risk Officer  
Review Frequency: Quarterly  
Parent Policy: AI Governance Policy

---

## 1. Purpose and Scope

### 1.1 Purpose

This standard defines the mandatory, repeatable process for assessing and managing risks associated with AI systems at RadioAstronomy.io. It operationalizes the NIST AI Risk Management Framework's "Map" function through the structured methodology of CIS Risk Assessment Method (CIS-RAM), creating auditable evidence of risk-based decision making.

This standard transforms the abstract requirement to "assess AI risks" into a concrete engineering workflow that produces defensible, evidence-based outcomes suitable for regulatory review. The output of this process—the AI System Impact Assessment (AISIA)—serves as primary evidence of RadioAstronomy.io's due care in identifying, documenting, and mitigating AI-related risks as required by Colorado SB-24-205.

### 1.2 Scope

This standard applies to:

- All AI systems classified as "high-risk" under Colorado SB-24-205 definition
- New AI system development projects during design phase
- Significant modifications to existing AI systems (new capabilities, expanded scope, changed data handling, modified risk profile)
- Regular reassessment of deployed AI systems (annual minimum; high-risk systems reassessed quarterly or upon material changes)
- AI agents operating autonomously within RadioAstronomy.io infrastructure

Out of Scope: This standard does not apply to individual one-off uses of approved AI tools (e.g., using Gemini for code suggestions, asking Claude Max to draft documentation). It applies to AI *systems*—structured deployments with ongoing operational significance.

### 1.3 Relationship to Other Standards

- AI Governance Policy: Provides mandate and authority for risk assessment. Establishes risk tolerance levels that inform risk acceptance decisions. Defines roles (ARO, System Owner) that execute this standard. Establishes four-tier data classification system.

- AI Acceptable Use Policy: Defines day-to-day tool usage rules and data handling requirements. Risk assessments must verify system design complies with AUP constraints (e.g., no Protected data to Gemini or Z.ai, Z.ai only for Public-External astronomy/research code).

- Secure AI Systems Standard: Implements controls identified through risk assessment. The risk assessment process identifies *what* controls are needed; Secure AI Systems Standard specifies *how* to implement them.

- AI Transparency & Disclosure Standard: Documents risk assessment outcomes. The AISIA produced through this process becomes part of the system's transparency documentation, potentially disclosed to stakeholders or regulators.

Integration Point: System Owners conduct risk assessments following this standard. ARO reviews and approves assessments. Security Lead implements identified controls per Secure AI Systems Standard. All artifacts documented per Transparency Standard.

---

## 2. Risk Assessment Methodology

RadioAstronomy.io uses an integrated approach combining:

NIST AI RMF Map Function: Contextual analysis and risk identification

- Establishes system context (purpose, stakeholders, decision role)
- Identifies foreseeable harms using NIST trustworthiness characteristics
- Considers legal harms (algorithmic discrimination per Colorado law)
- Documents intended vs. prohibited uses

CIS Risk Assessment Method (CIS-RAM) for IG1: Structured risk evaluation process

- Quantitative risk scoring (Inherent Risk = Impact × Expectancy)
- Systematic safeguard evaluation (implementation, operation, reliability, verification)
- Residual risk calculation accounting for control effectiveness
- Decision framework (Accept, Mitigate, Transfer, Avoid)

CIS Controls v8.1 Implementation Group 1: Technical safeguards for risk mitigation

- 56 foundational security controls applicable to all organizations
- Organized by asset type (enterprise, data, devices, accounts)
- Provides concrete implementation guidance
- Maps to NIST AI RMF trustworthiness characteristics

Why This Integration Matters: NIST AI RMF provides the "what" (identify AI-specific risks), CIS-RAM provides the "how" (systematic evaluation methodology), and CIS Controls provide the "with what" (concrete technical safeguards). Together they form a complete workflow from risk identification to control implementation.

---

## 3. Risk Assessment Workflow

The risk assessment process consists of six sequential steps. System Owners execute steps 1-5 with input from technical teams. ARO reviews and approves step 6 (risk decision). The process typically requires 4-8 hours for straightforward systems, longer for complex or novel deployments.

### 3.1 Step 1: Define Assessment Scope (NIST Map)

The System Owner initiates risk assessment by documenting system context and boundaries.

System Context:

- System name and unique identifier: Use consistent naming (e.g., `proj-research-agent-01`)
- Intended purpose and primary function: What problem does this system solve? What tasks does it perform?
- Development stage: Design (planning only), Testing (non-production), Production (operational)
- Integration points with existing infrastructure: What systems does it interact with? What data sources does it access?
- Expected lifecycle: Temporary (prototype/experiment) or Permanent (ongoing operational use)

Technical Components:

- AI models used: Commercial APIs (Gemini via Workspace, Claude Max for CTO, Z.ai for Engineers), local models (Llama 3.1 8B), hybrid approaches
- Data sources and datasets: What data does the system process? Classification level (Public-Internal, Public-External, Protected, Secrets)?
- Input/output interfaces: How do users interact with it? What outputs does it produce?
- Decision-making role:
  - Advisory (provides recommendations, humans decide)
  - Automated (makes decisions autonomously within defined boundaries)
  - Human-in-loop (requires human approval before actions execute)

Data Classification Verification:

- Which of RadioAstronomy.io's four data classification tiers will this system process?
- Public-Internal: Our public content (can use Gemini, Claude Max, local models)
- Public-External: Astronomy and data science research code, external public repositories (can use Z.ai if Engineer role, plus other tools)
- Protected: Internal confidential (can ONLY use Claude Max via Kasm or local models)
- Secrets: NEVER process through any AI system

Tool Selection Validation:

- Will this system use Gemini? → Verify only processing Public-Internal or Public-External data
- Will this system use Claude Max? → Verify CTO authorization; if processing Protected data, verify Kasm isolation
- Will this system use Z.ai? → Verify Engineer role only, Public-External research code only (not infrastructure), training on data is acceptable
- Will this system use local models? → Acceptable for any data tier including Protected

Stakeholders and Impact:

- Who uses this system? (roles, not individuals—e.g., "research engineers," "external collaborators")
- Who is affected by system outputs? (who experiences consequences of system decisions or actions?)
- What decisions does the system influence? (technical, operational, research, resource allocation?)
- What happens if the system fails or produces incorrect output? (service disruption, wrong research conclusions, security incident, reputational harm?)

Documentation Location: CIS-RAM for IG1 Workbook, Section 1: Scope Definition

Output: Clear understanding of system boundaries, purpose, stakeholder impact, data classifications, and tool selection compliance. This context informs all subsequent risk evaluation.

---

### 3.2 Step 2: Identify Foreseeable Harms (SB-24-205 & NIST Map)

The System Owner, with input from Review Board members, systematically brainstorms potential harms using two complementary frameworks.

#### 3.2.1 Legal Harms (Colorado SB-24-205)

Explicitly consider risks that could lead to algorithmic discrimination:

Definition: Algorithmic discrimination occurs when an AI system produces unlawful differential treatment or impact based on protected characteristics, or denies rights or opportunities on the basis of protected status.

Protected Characteristics: Race, color, ancestry, national origin, religion, sex, gender identity, sexual orientation, age, disability, military status

Considerations:

- Does this system make decisions that could affect individuals based on these characteristics?
- Even if unintended, could system outputs have disparate impact on protected groups?
- Does the system provide reasonable accommodations for individuals with disabilities?
- Are there historical biases in training data that could propagate discrimination?

Documentation: For each potential discrimination risk, document: (1) How it could occur, (2) Which protected characteristic(s) affected, (3) Severity of potential harm, (4) Mitigation approach

#### 3.2.2 Trustworthiness Harms (NIST AI RMF)

Consider risks that threaten the seven trustworthiness characteristics:

1. Valid and Reliable

- Inaccurate outputs or predictions
- Inconsistent performance across contexts
- Model drift (performance degradation over time)
- Lack of performance metrics or validation
- Undisclosed limitations or failure modes

2. Safe

- Physical harm to individuals
- Operational failures causing service disruption
- Cascading system impacts (one AI failure triggers others)
- Unsafe autonomous actions without human oversight
- Inadequate failure recovery mechanisms

3. Secure and Resilient

- Unauthorized access to AI systems or data
- Data breaches through AI interfaces
- Prompt injection attacks manipulating system behavior
- Supply chain compromises (malicious models or components)
- Inadequate resilience to failures or attacks

4. Accountable and Transparent

- Opaque decision-making without audit trails
- Inability to explain system behavior
- Unclear responsibility for AI actions or failures
- Inadequate human oversight mechanisms
- Missing documentation or version control

5. Explainable and Interpretable

- Black-box systems with no interpretability
- Complex model architectures preventing understanding
- Inadequate documentation of decision logic
- Inability to debug or troubleshoot failures
- Technical personnel cannot understand system behavior

6. Privacy-Enhanced

- Unauthorized collection or retention of personal data
- Data leakage through model behavior or prompts
- Re-identification risks in anonymized datasets
- Inadequate access controls on sensitive data
- Insufficient data lifecycle management

7. Fair, with Harmful Biases Managed

- Training data biases perpetuated in outputs
- Differential performance across demographic groups
- Proxy discrimination through correlated features
- Inadequate bias testing or mitigation
- Unaddressed historical inequities in data

Documentation Location: CIS-RAM for IG1 Workbook, Section 2: Harm Identification

Output: Comprehensive list of potential harms across legal and trustworthiness dimensions. This informs subsequent risk scenario mapping and control selection.

---

### 3.3 Step 3: Map to Risk Scenarios (Organizational Context)

RadioAstronomy.io maintains a catalog of common AI risk scenarios based on operational experience and industry patterns. System Owners map identified harms (Step 2) to relevant risk scenarios, customizing details to system-specific context.

Standard Risk Scenarios:

R1: Data Egress and Exposure

- Sensitive or proprietary data input into AI systems with inadequate confidentiality controls
- Training data retention by commercial AI vendors
- Conversation history accessible to unauthorized parties
- Data used in examples or error messages exposing confidential information

R2: Secrets and Credentials Leakage

- API keys, passwords, tokens, certificates entered into AI prompts (any tool)
- Credentials stored in conversation history or agent memory
- Exposure through logs, conversation exports, or model training

R3: Z.ai Training on Infrastructure Code (NEW - v1.1)

- Engineer uses Z.ai on RadioAstronomy.io infrastructure or proprietary code (Public-Internal tier)
- Our competitive IP (agent systems, orchestration, proprietary tooling) becomes part of Z.ai training dataset
- Loss of intellectual property control, competitive disadvantage
- Violates AUP constraint (Z.ai only for Public-External research code, not infrastructure)
- Controls: Four-tier classification training emphasizing domain boundaries (astronomy code vs infrastructure code), Z.ai access restricted to Engineer role, RBAC enforcement, repo tagging, monitoring for Z.ai usage patterns

R4: Data Classification Confusion

- Personnel uncertain whether code is Public-Internal (infrastructure) vs Public-External (research)
- Accidental Z.ai usage on infrastructure code thinking it's research code
- Accidental Gemini usage on Protected data thinking it's Public
- Controls: Clear classification examples in AUP, Security Lead available for clarification, agent data classification enforcement, classification tags in repos

R5: Prompt Injection & Tool Abuse

- Malicious inputs manipulating AI agents to perform unintended actions
- Data exfiltration to attacker-controlled endpoints
- Privilege escalation through prompt engineering
- Tool misuse causing operational disruption or data modification

R6: Model Hallucination and Inaccuracy

- AI generates plausible but incorrect information
- Research conclusions based on hallucinated data or references
- Code with subtle security vulnerabilities due to AI suggestions
- Operations decisions based on inaccurate AI analysis

R7: Identity and Access Drift

- AI agents granted excessive privileges not matching intended role
- Service account credentials persisting beyond system lifecycle
- Inadequate review of agent access patterns over time
- Orphaned accounts after system decommissioning

R8: Supply Chain Compromise

- Malicious AI models or components from untrusted sources
- Compromised dependencies in AI frameworks
- Vendor platform compromises affecting hosted AI services
- Backdoors in open-source AI tools

R9: Cost and Resource Sprawl

- Uncontrolled AI API usage exceeding budget
- Shadow AI subscriptions duplicating approved tools
- Compute resources consumed by inefficient AI workloads
- Tool sprawl increasing attack surface and management burden

R10: Legal and Compliance Gaps

- Algorithmic discrimination violating Colorado SB-24-205
- Privacy violations through inadequate data handling
- Intellectual property infringement in AI-generated content
- Regulatory non-compliance due to inadequate documentation

R11: Operational Dependency and Single Point of Failure

- Critical operations dependent on single AI service
- Vendor outages causing operational disruption
- No fallback mechanisms for AI system failures
- Inadequate business continuity planning

R12: Insufficient Human Oversight

- AI making consequential decisions without human review
- Inadequate verification of AI outputs before use
- Personnel over-trusting AI recommendations
- Lack of escalation procedures for uncertain situations

Usage Guidance: For each system being assessed, System Owners select relevant scenarios (typically 3-8 apply), customize threat actors and impacts to system context, and document in CIS-RAM workbook. Not all scenarios apply to every system—focus on those with plausible threat pathways given system design.

Documentation Location: CIS-RAM for IG1 Workbook, Section 3: Risk Scenario Mapping

Output: System-specific risk scenarios with customized threat actors, impacts, and attack paths. This provides concrete risk narratives for subsequent quantitative assessment.

---

### 3.4 Step 4: Assess Inherent Risk (CIS-RAM Quantitative)

For each mapped risk scenario (Step 3), System Owner quantitatively assesses inherent risk—the risk level assuming NO safeguards are in place. This establishes baseline risk before considering control effectiveness.

CIS-RAM Inherent Risk Formula:

```
Inherent Risk = Impact Score × Expectancy Score
```

Impact Assessment (1-5 scale):

- 1 - Minimal: Negligible consequences, easily recoverable, no material harm
- 2 - Minor: Limited consequences, some recovery effort, localized disruption
- 3 - Moderate: Significant consequences, substantial recovery effort, noticeable harm
- 4 - Major: Severe consequences, difficult recovery, widespread impact
- 5 - Critical: Catastrophic consequences, extremely difficult recovery, existential threat

Impact Categories to Consider:

- Operational: Service disruption, productivity loss, business process impact
- Financial: Direct costs, regulatory fines, lost revenue, recovery expenses
- Reputational: Brand damage, stakeholder trust erosion, competitive disadvantage
- Legal: Compliance violations, litigation risk, regulatory enforcement
- Security: Confidentiality breach, integrity compromise, availability loss
- Research: Scientific integrity, data accuracy, publication impact
- Ethical: Fairness violations, discrimination, societal harm

Expectancy Assessment (1-5 scale):

- 1 - Rare: Unlikely to occur in foreseeable future (≤5% annual probability)
- 2 - Unlikely: Could occur but not expected (<25% annual probability)
- 3 - Possible: Might occur, moderately likely (25-50% annual probability)
- 4 - Likely: Expected to occur (50-75% annual probability)
- 5 - Almost Certain: Will almost certainly occur (>75% annual probability)

Factors Influencing Expectancy:

- Threat actor capability and motivation
- Attack surface and exposure
- Operational complexity and error potential
- Historical incident data (internal and industry)
- Known vulnerabilities or weaknesses

Inherent Risk Matrix:

| Impact | Expectancy 1 | Expectancy 2 | Expectancy 3 | Expectancy 4 | Expectancy 5 |
|--------|--------------|--------------|--------------|--------------|--------------|
| 5      | 5            | 10           | 15           | 20           | 25           |
| 4      | 4            | 8            | 12           | 16           | 20           |
| 3      | 3            | 6            | 9            | 12           | 15           |
| 2      | 2            | 4            | 6            | 8            | 10           |
| 1      | 1            | 2            | 3            | 4            | 5            |

Inherent Risk Rating Thresholds:

- 1-4: Low (acceptable inherent risk even without controls—extremely unlikely or minimal impact scenarios)
- 5-9: Medium (moderate risk requiring basic controls)
- 10-15: Medium-High (significant risk requiring robust controls)
- 16-25: High (severe risk requiring comprehensive controls and possible risk acceptance)

Documentation: For each risk scenario, document impact score with category-specific justification, expectancy score with probability rationale, calculated inherent risk score, and inherent risk rating. Include assumptions and edge cases.

Documentation Location: CIS-RAM for IG1 Workbook, Section 4: Inherent Risk Assessment

Output: Quantitative baseline risk scores for all identified scenarios. This establishes "risk before controls" against which residual risk (after controls) will be compared.

---

### 3.5 Step 5: Inventory and Evaluate Safeguards (CIS Controls + System-Specific)

System Owner, working with Security Lead, inventories all safeguards (controls) in place or planned that mitigate identified risks. Controls come from three sources: CIS Controls v8.1 IG1 (technical baseline), architectural controls (RadioAstronomy.io infrastructure), and system-specific controls (unique to this AI system).

#### 3.5.1 CIS Controls v8.1 Implementation Group 1

RadioAstronomy.io implements CIS Controls v8.1 IG1 as foundational security baseline. These 56 controls provide technical safeguards applicable to all AI systems.

Key IG1 Controls for AI Systems:

CIS Control 1: Inventory and Control of Enterprise Assets

- Asset inventory including AI systems, models, API endpoints
- Asset lifecycle management (procurement, deployment, decommission)
- Unauthorized asset detection and removal

CIS Control 2: Inventory and Control of Software Assets

- Software inventory including AI frameworks, libraries, dependencies
- Software version tracking and vulnerability management
- Unauthorized software detection and removal

CIS Control 3: Data Protection

- Data classification system (Public-Internal, Public-External, Protected, Secrets)
- Data handling requirements based on classification
- Data loss prevention (DLP) controls
- Encryption for data at rest and in transit

CIS Control 4: Secure Configuration of Enterprise Assets and Software

- Hardening standards for AI infrastructure
- Configuration management and drift detection
- Secure defaults and least functionality

CIS Control 5: Account Management

- Identity lifecycle management (provisioning, modification, deprovisioning)
- Single Sign-On (SSO) with MFA enforcement
- Role-Based Access Control (RBAC)
- Service account management for AI agents

CIS Control 6: Access Control Management

- Least privilege access policies
- Access review and certification
- Privileged access management for AI systems
- Time-based access for temporary grants

CIS Control 7: Continuous Vulnerability Management

- Vulnerability scanning for AI infrastructure
- Patch management processes
- Vulnerability remediation tracking

CIS Control 8: Audit Log Management

- Centralized logging (SIEM: Graylog)
- Log retention and protection
- AI-specific audit trails (tool usage, data access, agent actions)

CIS Control 9: Email and Web Browser Protections

- Phishing controls (relevant for credential theft affecting AI systems)
- Web filtering (relevant for AI agent egress controls)

CIS Control 10: Malware Defenses

- Anti-malware on AI infrastructure nodes
- Malicious payload detection in AI inputs/outputs

CIS Control 11: Data Recovery

- Backup and recovery procedures for AI systems
- Business continuity planning including AI dependencies

CIS Control 12: Network Infrastructure Management

- Network segmentation isolating AI infrastructure
- Zero Trust Network Access (ZTNA via NetBird)
- Secure network configuration

CIS Control 13: Network Monitoring and Defense

- Network traffic analysis and anomaly detection
- Intrusion detection/prevention (IDS/IPS)
- Egress filtering for AI agents

CIS Control 14: Security Awareness and Skills Training

- AI-specific training (four-tier classification, tool constraints, Z.ai training awareness)
- Role-specific training (Engineer role for Z.ai, CTO role for Claude Max)
- Phishing and social engineering awareness

CIS Control 15: Service Provider Management

- Vendor risk assessment for AI service providers (Gemini, Claude, Z.ai, Llama)
- Contractual controls (training opt-out, data residency, audit rights)
- Ongoing vendor monitoring

CIS Control 16: Application Software Security

- Secure development practices for AI agent code
- Code review and testing
- Vulnerability assessment of AI applications

CIS Control 17: Incident Response Management

- Incident response plan including AI-specific scenarios
- Incident detection, containment, eradication, recovery
- Post-incident analysis and lessons learned

CIS Control 18: Penetration Testing

- Periodic security testing of AI systems
- Red team exercises simulating AI-specific attacks (prompt injection, data exfiltration)

Documentation: For each applicable CIS Control, document implementation status (planned, partial, complete), implementation evidence (tool/process), and gap analysis (what remains to implement).

#### 3.5.2 Architectural Controls (RadioAstronomy.io Infrastructure)

RadioAstronomy.io's secure research enclave provides additional controls beyond CIS baseline:

Kasm Workspaces DLP:

- Browser isolation for Claude Max when processing Protected data
- Data Loss Prevention blocking copy/paste, screenshots, downloads
- Session recording and audit trails
- Prevents Protected data exfiltration through AI interfaces

NetBird Zero Trust Network Access (ZTNA):

- Identity-based access control to research infrastructure
- Network segmentation isolating sensitive resources
- Encrypted mesh networking
- Prevents unauthorized AI agent network access

Authentik Identity Provider:

- Centralized SSO for all AI tools and infrastructure
- MFA enforcement (TOTP, WebAuthn, backup codes)
- OAuth/OIDC integration with approved AI services
- Service account lifecycle management

Role-Based Access Control (RBAC):

- Role definitions: CTO (Claude Max), Engineer (Z.ai), All Personnel (Gemini, local models)
- Technical enforcement through OAuth scopes and SSO
- Access review and recertification
- Prevents tool misuse through access restriction

Graylog SIEM:

- Centralized log aggregation from AI infrastructure
- AI-specific log parsing and correlation
- Alert rules for suspicious AI activity (unusual tool usage, data classification violations)
- Audit trail for compliance evidence

Proxmox Virtualization Platform:

- Infrastructure isolation and resource controls
- Snapshot and backup capabilities
- Performance monitoring and capacity management
- Prevents AI workload interference and resource exhaustion

Documentation: For each architectural control, document how it applies to this specific AI system, effectiveness assessment, and monitoring approach.

#### 3.5.3 System-Specific Controls

AI systems may implement additional controls unique to their design:

Data Classification Enforcement:

- Automated classification tagging in repos
- Pre-processing filters rejecting Protected/Secrets data
- Runtime validation of data classification before AI processing
- Z.ai constraint enforcement (Public-External research code only)

Human-in-the-Loop (HITL):

- Mandatory approval workflows for consequential AI actions
- Multi-person review for high-risk decisions
- Escalation procedures for ambiguous situations
- Human override capabilities

Output Verification:

- Automated validation of AI outputs against known constraints
- Cross-validation using multiple models (model consensus)
- Human expert review requirements
- Verification documentation in work products

Bounded Autonomy:

- Explicit permission boundaries for AI agents
- Read-only vs. write access controls
- Rate limiting and quota management
- Escalation when exceeding authority

Explainability and Audit:

- Detailed logging of AI decision rationale
- Audit trail linking outputs to inputs and model versions
- Documentation of prompt engineering and system prompts
- Transparency disclosures per AI Transparency Standard

Documentation: For each system-specific control, document implementation details, effectiveness metrics, and verification approach.

#### 3.5.4 Control Maturity Assessment

For each identified control (CIS, architectural, system-specific), assess maturity across four dimensions:

Implementation: Is the control actually deployed?

- 0 - Not Implemented: Control identified but not deployed
- 1 - Partially Implemented: Control deployed for some systems/scenarios but not comprehensively
- 2 - Fully Implemented: Control deployed comprehensively as intended

Operation: Is the control being used consistently?

- 0 - Not Operating: Control exists but isn't functioning (misconfigured, disabled, bypassed)
- 1 - Inconsistently Operating: Control functions sometimes but has gaps or failures
- 2 - Consistently Operating: Control functions reliably as designed

Reliability: Does the control perform effectively?

- 0 - Unreliable: Control frequently fails to prevent the risk
- 1 - Moderately Reliable: Control prevents some incidents but not all
- 2 - Highly Reliable: Control consistently prevents the risk when operating

Verification: Do we have evidence the control works?

- 0 - Unverified: No testing or evidence of effectiveness
- 1 - Partially Verified: Some testing or anecdotal evidence
- 2 - Fully Verified: Regular testing, metrics, documented effectiveness

Control Effectiveness Score: Sum of four dimensions (0-8 scale)

- 0-2: Ineffective (control provides minimal risk reduction)
- 3-5: Partially Effective (control provides some risk reduction)
- 6-8: Highly Effective (control provides substantial risk reduction)

Documentation Location: CIS-RAM for IG1 Workbook, Section 5: Safeguard Inventory and Maturity Assessment

Output: Complete inventory of controls with maturity scoring. This informs residual risk calculation—controls only reduce risk if they're actually effective.

---

### 3.6 Step 6: Calculate Residual Risk and Make Decision (CIS-RAM + Organizational Risk Tolerance)

System Owner, with ARO oversight, calculates residual risk accounting for control effectiveness, then makes risk decision using organizational risk tolerance framework.

Residual Risk Calculation:

Residual risk is NOT simply inherent risk minus control score. Instead, effective controls reduce both Impact and Expectancy components of risk:

Impact Reduction:

- Highly Effective controls (6-8 maturity): Reduce impact by 2 levels (e.g., Impact 5 → Impact 3)
- Partially Effective controls (3-5 maturity): Reduce impact by 1 level (e.g., Impact 5 → Impact 4)
- Ineffective controls (0-2 maturity): No impact reduction

Expectancy Reduction:

- Highly Effective controls (6-8 maturity): Reduce expectancy by 2 levels (e.g., Expectancy 4 → Expectancy 2)
- Partially Effective controls (3-5 maturity): Reduce expectancy by 1 level (e.g., Expectancy 4 → Expectancy 3)
- Ineffective controls (0-2 maturity): No expectancy reduction

Minimum Scores: Impact and expectancy cannot be reduced below 1.

Multiple Controls: If multiple controls address same risk, use highest effectiveness tier for reduction (don't stack reductions from multiple controls).

Example Calculation:

- Inherent Risk: Impact 5, Expectancy 4, Score = 20 (High)
- Controls: CIS Control 3 (Data Protection) at 7 maturity, Kasm DLP at 8 maturity, system-specific classification enforcement at 6 maturity
- Effectiveness Tier: Highly Effective (multiple controls at 6-8 maturity)
- Residual Impact: 5 - 2 = 3 (Moderate)
- Residual Expectancy: 4 - 2 = 2 (Unlikely)
- Residual Risk Score: 3 × 2 = 6 (Medium)
- Risk Reduction: 20 → 6 (70% reduction)

Residual Risk Rating:

- 1-4: Low (minimal residual risk, routine acceptance by System Owner)
- 5-9: Medium (acceptable residual risk, ARO approval required)
- 10-15: Medium-High (significant residual risk, CTO approval required, requires justification and compensating controls)
- 16-25: High (severe residual risk, CTO + Review Board formal risk acceptance required, may require risk avoidance)

Risk Decision Framework:

Accept:

- Residual risk is within organizational risk tolerance
- Controls are adequate and cost-effective
- Benefits outweigh remaining risk
- Monitoring plan in place for control effectiveness

Mitigate:

- Residual risk exceeds tolerance but system is valuable
- Additional controls can reduce risk to acceptable level
- Requires implementation plan and timeline for new controls
- Interim risk acceptance may be needed during control deployment

Transfer:

- Residual risk can be shifted to third party (insurance, vendor guarantees)
- Cost of transfer is acceptable
- Rare for AI systems—most risks are not transferable

Avoid:

- Residual risk is unacceptable even with maximum practical controls
- System does not proceed or is decommissioned
- Used when risk fundamentally conflicts with organizational values or legal requirements

Approval Authority by Residual Risk Level:

- Low (1-4): System Owner approval sufficient
- Medium (5-9): ARO approval required (documented in AISIA)
- Medium-High (10-15): CTO approval required (documented in AISIA + formal risk acceptance memo)
- High (16-25): CTO + Review Board formal risk acceptance (board meeting minutes + risk acceptance document)

Risk Acceptance Documentation Requirements:

- Justification: Why is this risk acceptable given organizational context?
- Benefits: What value does the system provide that warrants accepting residual risk?
- Compensating Controls: What additional safeguards mitigate risk even if not fully effective?
- Monitoring Plan: How will we track whether residual risk remains acceptable over time?
- Time Limit: When must this risk decision be re-evaluated? (High risks require quarterly re-assessment)
- Approval Signatures: Appropriate authority per risk level

Documentation Location: CIS-RAM for IG1 Workbook, Section 6: Residual Risk and Decision

Output: Formal risk decision with documented justification and approval per governance authority levels. This completes the risk assessment process.

---

## 4. AI System Impact Assessment (AISIA) Template

The AI System Impact Assessment (AISIA) is the primary deliverable from the risk assessment process. It consolidates all analysis (Steps 1-6) into structured documentation suitable for stakeholder review, regulatory compliance, and audit evidence.

AISIA Structure:

1. Executive Summary
   - System purpose and scope in 2-3 sentences
   - Residual risk rating and decision (Accept/Mitigate/Transfer/Avoid)
   - Key controls and monitoring plan
   - Approval signatures

2. System Context (from Step 1)
   - System identification and ownership
   - Technical architecture and components
   - Stakeholders and decision-making role
   - Data classifications and tool selection
   - Integration points

3. Risk Identification (from Step 2)
   - Legal harms (algorithmic discrimination)
   - Trustworthiness harms (NIST AI RMF characteristics)
   - Relevant risk scenarios (R1-R12 customized)
   - Data classification and tool selection risks

4. Inherent Risk Assessment (from Step 4)
   - Impact and likelihood without controls
   - Inherent risk scores

5. Control Inventory (from Step 5)
   - CIS Controls implemented
   - Architectural controls
   - AI-specific controls (data classification, tool restrictions, training)
   - Control maturity assessment

6. Residual Risk Assessment (from Step 6)
   - Impact and likelihood with controls
   - Residual risk scores
   - Risk decision with justification

7. Monitoring and Re-assessment Plan
   - Metrics for ongoing control effectiveness
   - Triggers for risk re-assessment
   - Responsibility assignments

AISIA Review and Approval:

- System Owner drafts AISIA
- ARO reviews for methodology compliance and risk decision appropriateness
- CTO approves Medium-High or High residual risks
- Review Board endorses High risks requiring risk acceptance
- Final AISIA archived per AI Transparency Standard

---

## 7. Continuous Risk Management

Risk assessment is not one-time—deployed systems require ongoing monitoring and periodic re-assessment.

Continuous Monitoring:

- Security Lead monitors control effectiveness metrics (DLP blocks, access violations, classification errors)
- SIEM alerts on AI-related security events
- Usage pattern analysis for data classification compliance
- Tool selection audits (Gemini vs Claude Max vs Z.ai vs local usage)

Re-assessment Triggers:

- Annual minimum for all deployed AI systems
- Quarterly for high-risk systems
- Material system changes (new capabilities, expanded data access, modified tools)
- Security incidents involving the system
- Control failures or degradation
- Vendor changes affecting approved tools (pricing, features, policies, training opt-out status)

Risk Register Maintenance:

- ARO maintains organizational risk register tracking all assessed systems
- Register includes: system name, last assessment date, residual risk level, next re-assessment due
- Quarterly Review Board reviews register for systemic patterns
- Informs policy updates and control enhancements

---

## 8. Training and Competency

Effective risk assessment requires competency in multiple domains. RadioAstronomy.io provides role-specific training:

System Owner Training:

- NIST AI RMF Map function overview
- CIS-RAM methodology and workbook usage
- CIS Controls v8.1 IG1 reference
- Four-tier data classification system and tool selection
- AISIA template completion
- Colorado SB-24-205 algorithmic discrimination requirements

ARO Training:

- Advanced CIS-RAM techniques
- Risk acceptance decision frameworks
- Regulatory compliance assessment
- Control effectiveness evaluation
- AISIA review and approval process

Review Board Member Training:

- AI risk landscape and emerging threats
- Organizational risk tolerance interpretation
- Control cost-benefit analysis
- Tool evaluation criteria (security, cost, capability, training opt-out)

All Personnel Training:

- Four-tier data classification fundamentals
- Tool selection based on data classification
- When to escalate risk concerns
- Z.ai training constraint (Public-External only)

---

## 9. Integration with Other Standards

This standard integrates tightly with companion governance documents:

AI Governance Policy:

- Provides authority and mandate for risk assessment
- Establishes organizational risk tolerance informing risk decisions
- Defines four-tier data classification system
- Maintains approved tool list (Appendix C: Tool & Model Inventory)

AI Acceptable Use Policy:

- Day-to-day operational rules informed by risk assessment outcomes
- Tool selection guidance based on data classification
- Personnel responsibilities for data handling

Secure AI Systems Standard:

- Implements controls identified through risk assessment
- Provides technical implementation details for CIS Controls
- Specifies architectural controls (Kasm DLP, RBAC, NetBird ZTNA)

AI Transparency & Disclosure Standard:

- Documents AISIA outcomes for stakeholders
- Audit trail of risk decisions
- Evidence for regulatory compliance

Appendix C: Tool & Model Inventory:

- Authoritative tool specifications inform risk assessment
- Training opt-out status critical for data classification controls
- Cost and access patterns inform risk decisions

---

## 10. Approval and Version Control

Approved By:

- AI Risk Officer, Date: 2025-10-26
- Chief Technology Officer, Date: 2025-10-26

Version History:

- v1.0 (2025-10-24): Initial RadioAstronomy.io risk assessment standard
- v1.1 (2025-10-26): Corrected tool references (added Z.ai, removed OpenAI), expanded to four-tier data classification, added R3 (Z.ai training risk) and R4 (classification confusion risk), updated examples throughout

Major Changes in v1.1:

- Added Z.ai GLM-4.6 to tool references with explicit training constraint
- Removed all OpenAI/ChatGPT/GPT-4 references (not in approved tool set)
- Updated data classification from three-tier to four-tier system
- Added R3: Z.ai Training on Internal Code (new risk scenario specific to Z.ai constraints)
- Added R4: Data Classification Confusion (new risk scenario for four-tier system)
- Updated examples to reflect actual tool set (Gemini universal, Claude Max CTO-only, Z.ai Engineer-role-only)
- Enhanced Step 1 (Define Scope) with data classification verification and tool selection validation
- Updated control examples throughout to reflect four-tier system and tool constraints

Next Review: 2026-01-26 (Quarterly)

---

Document Control:

- Source: <https://github.com/radioastronomy-io/ai-governance/standards/02-ai-risk-assessment-standard.md>
- Contact: <ops@radioastronomy.io>
- Version History: See GitHub repository changelog

Template Availability:
This operational standard is maintained with RadioAstronomy.io specifics for actual use. A generic template version is available in the repository's `/templates` directory for SMB/SME community adoption.
