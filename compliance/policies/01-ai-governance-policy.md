# AI Governance Policy

Organization: RadioAstronomy.io  
Effective Date: 2025-10-26  
Version: 1.1  
Owner: Chief Technology Officer  
Review Frequency: Quarterly

---

## 1. Policy Statement & Scope

### 1.1 Purpose and Authority

RadioAstronomy.io is committed to fulfilling its duty of care in the development and deployment of AI systems by adopting the principles and functions of the NIST AI Risk Management Framework (AI RMF). This policy establishes the foundational governance structure, accountability mechanisms, and guiding principles for all AI-related activities within our organization.

Legal and Regulatory Context:

The United States AI regulatory landscape is in transition, with federal policy favoring deregulation while states exercise independent authority. Colorado's SB-24-205, the Colorado Artificial Intelligence Act (CAIA), represents the only enforceable AI law currently on U.S. books, providing a concrete compliance anchor. CAISI (AI Standards and Innovation) has replaced the Biden-era AISI (U.S. AI Safety Institute), and is about moving US AI infrastructure forward while simultaneously handing regulatory power to the states. RadioAstronomy.io adopts NIST AI RMF 1.0 as our foundational framework and will adapt to future versions as they evolve, maintaining alignment with federal guidance while preserving operational continuity.

In the absence of comprehensive federal requirements, this policy follows industry best practices: the NIST AI Risk Management Framework (AI RMF) for risk-based governance, CIS Controls v8.1 for technical security baselines, and CIS Risk Assessment Method (CIS-RAM) for systematic risk evaluation. This approach positions RadioAstronomy.io to adapt as regulations evolve while maintaining defensible practices today.

### 1.2 Scope of Application

This policy applies to:

- All AI systems developed, deployed, or operated by RadioAstronomy.io
- All personnel (employees, contractors, consultants, volunteers) with access to AI services
- All AI agents and autonomous systems operating within our infrastructure
- All systems within the secure research enclave environment, including external AI services accessed through our secure infrastructure

This Policy applies to all RadioAstronomy.io employees, contractors, consultants, interns, temporary workers, and any other personnel granted access to AI services and tools within the organization. It covers all activities involving AI technologies, including but not limited to generative AI services, coding assistants, AI-powered productivity applications, and any future AI tools we adopt. This policy applies across all operational functions, regardless of geographic location or remote working arrangements.

The Policy integrates into broader management practices, processes, staff training, and everyday operations. It promotes a responsible and informed AI usage culture, ensuring personnel understand their responsibilities when utilizing AI services.

Systems. Applies to RadioAstronomy.io computing infrastructure, including research compute nodes, data storage, databases, CI/CD pipelines, version control repositories, observability platforms, and any automation or AI agents operating against these resources.

Identities. Applies to employees, contractors, guests, service accounts, and AI agents. All access is anchored to our enterprise identity provider with SSO, MFA, role-based access control, and automated lifecycle management.

---

## 2. Guiding Principles

RadioAstronomy.io formally adopts the seven NIST AI RMF trustworthiness characteristics as our organizational principles for responsible AI:

### 2.1 Valid and Reliable

AI systems perform consistently and accurately across intended use cases, with documented performance metrics and testing. We validate AI outputs before they impact research integrity, operational decisions, or external deliverables. Performance evaluation is ongoing throughout the system lifecycle, not merely at deployment.

### 2.2 Safe

AI systems minimize harm and operate within defined safety boundaries, with fail-safe mechanisms for critical operations. We implement human oversight for high-consequence decisions and establish clear operational boundaries that prevent AI systems from exceeding their designed capabilities or authority.

### 2.3 Secure and Resilient

AI systems are protected against security threats and can recover from failures or attacks without compromising integrity. We apply defense-in-depth security controls, monitor for anomalous behavior, and maintain resilience through isolation, redundancy, and graceful degradation mechanisms.

### 2.4 Accountable and Transparent

AI system decisions and operations are traceable, explainable, and subject to human oversight and review. We maintain comprehensive audit trails linking AI actions to responsible personnel, document decision rationales, and provide clear accountability chains for all AI-influenced outcomes where we are able to apply Explainable AI (xAI) methods.

### 2.5 Explainable and Interpretable

AI system behavior and decision-making processes can be understood by appropriate stakeholders at necessary levels of detail. We document AI system architectures, data dependencies, and decision logic to enable meaningful review by technical personnel, leadership, and external auditors.

### 2.6 Privacy-Enhanced

AI systems protect personal and sensitive data through technical and procedural safeguards, minimizing data collection and retention. We enforce data classification boundaries, implement data loss prevention controls, and require explicit approval for movement of protected information across security perimeters.

### 2.7 Fair, with Harmful Biases Managed

AI systems are evaluated for fairness across protected characteristics and demographic groups, with documented bias testing and mitigation. We prohibit algorithmic discrimination as defined in Colorado SB-24-205 and maintain zero tolerance for differential treatment or impact based on protected characteristics.

---

## 3. Roles and Responsibilities

### 3.1 Review Board Governance

RadioAstronomy.io maintains a six-person AI Review Board providing multi-stakeholder oversight for AI adoption and risk management. The Board includes the CTO (chair), Security Lead, Operations Lead, senior engineering representative, research domain expert, and external advisor with AI governance expertise. The Board meets quarterly to review the AI Tool Register, assess emerging risks, evaluate new tool requests, and ensure governance practices remain effective as AI capabilities and usage evolve.

Why this structure: AI governance requires diverse perspectives—security expertise alone is insufficient. The Board balances technical security concerns (Security), operational feasibility (Ops), developer productivity (Engineering), research integrity (domain expert), strategic direction (CTO), and external best practices (advisor). This multi-disciplinary approach prevents governance from becoming either so restrictive it's ignored or so permissive it's ineffective.

Quarterly Tool and Risk Reviews: Every 90 days, the Review Board conducts structured assessment of:

- Tool Register Audit: Verify all listed tools remain actively used, contractual protections are current, configurations match documented settings, costs align with budget expectations. Remove tools no longer needed. Add tools requested and approved since last review.
- Risk Landscape Review: Evaluate whether our risk catalog remains complete given AI capability evolution. Assess whether current controls effectively mitigate risks based on incident data and near-miss events.
- Access Pattern Analysis: Review user and agent access patterns for anomalies—unexpected usage spikes, unusual data access, changes in tool preferences. Identify training opportunities or control adjustments.
- Compliance Posture: Verify alignment with CIS Controls v8.1, NIST AI RMF, and Colorado SB-24-205 requirements. Track any regulatory developments requiring policy updates.

Operational Reality: With RadioAstronomy.io's deliberately limited tool set (Gemini via Workspace for all personnel, Claude Max for CTO, Z.ai GLM-4.6 for Engineer role, local Llama 3.1 8B) and small team, quarterly reviews typically complete in 2-3 hours. As tool adoption expands or team grows, review procedures may require more sophisticated tooling or delegation.

### 3.2 Executive Leadership

Overview: Executive leadership (CTO / Repository Owner or designated Product Owner) provides strategic direction for AI adoption, accepts organizational risk for governance decisions, and allocates resources required for effective controls. This role operates at the intersection of research mission, operational reality, and risk management.

Risk Tolerance and Acceptance:

- Set organizational risk appetite for AI usage: define which risks are acceptable with controls (most operational risks), which require risk acceptance (temporary gaps during control implementation), which are unacceptable under any circumstances (secrets in AI inputs, Protected data in Gemini or Z.ai)
- Approve formal risk acceptances when controls are temporarily inadequate: verify compensating controls are in place, set time-bound expiration, ensure remediation plan exists, document business justification
- Evaluate exception requests that exceed Security authority: unusual tool requests, data classification exceptions, export approvals for sensitive collaborations
- Own ultimate accountability for AI-related incidents—cannot delegate responsibility even when operational teams execute

Strategic Tool Rationalization:

- Sponsor efforts to eliminate shadow AI: identify redundant subscriptions, consolidate overlapping capabilities, migrate users to approved tools
- Prioritize tool investments based on research value: balance cost, capability, security, and operational complexity
- Champion enterprise AI adoption over personal accounts: explain "why we can't just use the free version," demonstrate value of contractual protections (training opt-out, audit logging, data residency)
- Approve tool removals when usage doesn't justify cost or risk—resist sunk cost fallacy
- Maintain cost discipline in $267/month total AI budget

Budget and Resource Allocation:

- Ensure adequate budget for AI governance: enterprise AI subscriptions, infrastructure for inside-perimeter hosting, staff time for review processes, training and awareness programs
- Allocate project time for AI output verification: project plans should include review activities, not treat AI-generated outputs as "free"
- Fund control improvements identified through quarterly reviews or incident postmortems
- Justify AI governance spending to funders or oversight bodies: demonstrate value through productivity gains, risk reduction, and compliance readiness

Quality and Integrity Standards:

- Require verification of AI-assisted outputs before external use: enforce review procedures, allocate time for quality checks
- Set attribution standards for RadioAstronomy.io publications and presentations: define disclosure thresholds, provide venue-specific guidance
- Foster organizational culture valuing thoroughness over speed: celebrate near-miss reports, conduct blameless postmortems, recognize quality advocacy
- Represent RadioAstronomy.io research integrity in external collaborations and funding relationships

Governance Program Oversight:

- Chair quarterly Review Board meetings: ensure diverse perspectives are heard, make decisions when consensus isn't reached, assign action items with accountability
- Review governance metrics and adjust strategy: access patterns, DLP incidents, tool utilization, cost trends, training effectiveness
- Communicate governance decisions to stakeholders: team members, collaborators, funders, repository audience
- Ensure governance documentation (policies, operational procedures, lessons learned) remains current and accessible

### 3.3 Operational Roles

#### 3.3.1 Security Lead

AI Tool Register Ownership:

- Maintain authoritative list of approved AI services, models, and agents permitted for RadioAstronomy.io work (see Appendix C: Tool & Model Inventory)
- Document tool configuration requirements: enterprise account settings, no-training clauses verified (except Z.ai where training is explicit and use case constrained), audit logging enabled, data residency confirmed, contractual protections in place
- Evaluate new tool requests: assess security posture, review vendor contracts, verify compliance certifications, determine appropriate use cases and constraints, make approve/deny recommendation to Review Board
- Conduct quarterly tool audits: verify configurations match documented requirements, confirm tools remain actively used, identify obsolete entries for removal, validate costs align with budget

Data Loss Prevention and Export Controls:

- Define and maintain DLP policies enforced in Kasm workspaces: clipboard restrictions, print/download blocking, screenshot prevention, watermarking configuration
- Operate Export Approval workflow for Protected data leaving inside-perimeter controls: review business justification, verify recipient authorization, approve with conditions or deny, log approved exports for audit, follow up on exported data lifecycle
- Monitor DLP incident reports: investigate blocks to determine if legitimate use case requiring policy adjustment or attempted policy violation
- Integrate Microsoft Purview DLP policies with Kasm controls for defense-in-depth

Security Monitoring and Correlation:

- Design and maintain correlation rules linking identity → network session → workspace activity → AI interaction → code change → deployment
- Monitor SIEM (Wazuh) for AI-related security events: anomalous agent behavior, unusual data access patterns, DLP violations, failed authorization attempts, suspicious export requests, data classification violations (Protected to Gemini/Z.ai)
- Investigate security incidents following established procedures: evidence collection, root cause analysis, containment and remediation, lessons learned documentation, control hardening recommendations
- Participate in quarterly threat modeling sessions assessing evolving AI attack patterns

Access Governance:

- Run quarterly access reviews for RadioAstronomy.io Google Workspace Enterprise accounts: verify users remain active, confirm security group memberships match current roles, identify orphaned accounts for cleanup, validate service account ownership and purpose
- Maintain exception and risk acceptance registry: document approved exceptions to policy (time-boxed, with compensating controls), track risk acceptances requiring Executive approval, monitor exception expiration and renewal
- Enforce role-based access controls: Gemini (all personnel), Claude Max (CTO only), Z.ai (Engineer role only), local models (all personnel)

Training and Awareness:

- Develop and deliver onboarding training covering approved tools, data classification (four-tier system), acceptable use policies, Z.ai training constraints
- Create role-specific training modules: CTO (Claude Max usage), Engineer (Z.ai constraints), System Owners (risk assessment), all personnel (four-tier data classification)
- Update training materials quarterly or when policy changes materially
- Track training completion and re-acknowledgment for compliance evidence

#### 3.3.2 AI Risk Officer (ARO)

Risk Assessment Leadership:

- Administer AI System Impact Assessment (AISIA) process following CIS-RAM methodology
- Review and approve risk assessments conducted by System Owners
- Maintain organizational risk register tracking AI-specific risks across all systems
- Identify systemic risks requiring policy or architectural changes (e.g., Z.ai training constraint enforcement)

Risk Decision Framework:

- Approve risk acceptance decisions for moderate-risk AI deployments (within ARO authority)
- Escalate high-risk acceptance decisions to Executive Leadership (CTO) with recommendation
- Reject deployments with unacceptable residual risk until additional controls implemented
- Document risk decisions in standardized format for audit trail

Control Effectiveness:

- Monitor control effectiveness metrics: DLP incident rates, access violations, verification failures, data classification errors
- Coordinate with Security Lead on control improvements: technical hardening, procedural refinements, training enhancements
- Conduct quarterly control testing: verify technical controls operate as designed, validate procedural controls are followed, identify gaps
- Participate in incident postmortems: assess whether existing risk assessment identified issue, determine if risk evaluation methodology requires adjustment

Regulatory Compliance:

- Maintain awareness of Colorado SB-24-205 requirements and ensure RadioAstronomy.io compliance
- Track federal AI regulatory developments (NIST guidance updates, potential federal legislation)
- Translate regulatory requirements into operational controls and policy updates
- Prepare compliance evidence for potential regulatory review or audit

#### 3.3.3 Operations Lead

Infrastructure and Availability:

- Maintain reliability and performance of AI infrastructure: local model deployment (Llama on proj-gpu01), Kasm workspace environment, network controls
- Coordinate with cloud service providers (Anthropic, Google, Z.ai) on enterprise support escalations
- Plan capacity for AI workloads: GPU resources, network bandwidth, storage for model artifacts
- Execute routine maintenance minimizing disruption to AI-dependent workflows

Agent Operations:

- Deploy and maintain AI agents within bounded contexts (Vault Orchestrator, Project Managers, Operations Automation)
- Configure agent authority limits and escalation procedures
- Monitor agent performance and resource consumption
- Investigate agent operational anomalies or failures

Cost Management:

- Track AI tool subscription costs against budget ($267/month total: Gemini $137, Claude Max $100, Z.ai $30, local $0)
- Monitor usage-based charges (if any) and identify cost optimization opportunities
- Forecast cost impacts of proposed tool additions or usage pattern changes
- Report cost trends and anomalies to Executive Leadership quarterly

Change Management:

- Coordinate AI tool updates and version transitions: test new model versions, communicate changes to personnel, rollback if issues detected
- Manage local model updates: quarterly evaluation of new releases, sandbox testing, production deployment via change control
- Document operational procedures for AI systems: deployment runbooks, incident response playbooks, disaster recovery procedures

#### 3.3.4 System Owners

Each AI system or major AI workflow has a designated System Owner—the engineer or researcher primarily responsible for its development, deployment, and ongoing maintenance. For autonomous agents, this is the person who designed and deployed the agent. For shared infrastructure AI services (Gemini via Workspace, Claude Max for CTO, Z.ai for Engineers, local models), this is typically a senior technical lead.

Development and Deployment:

- Conduct risk assessment following AI Risk Assessment Standard before deploying new AI system
- Implement controls specified in Secure AI Systems Standard matching system's risk profile
- Document system architecture, data flows, decision logic per AI Transparency Standard
- Obtain ARO approval for risk acceptance before production deployment

Operational Responsibility:

- Monitor system performance, accuracy, and reliability metrics
- Investigate and remediate system failures or degraded performance
- Maintain current documentation as system evolves (architecture diagrams, data flows, control inventory)
- Conduct periodic control testing to verify effectiveness

Data Classification Compliance:

- Ensure system respects data classification boundaries: no Protected data to Gemini or Z.ai, no Secrets to any AI system
- Configure agents to enforce data classification rules programmatically where possible
- Investigate and remediate data classification violations
- Report persistent classification challenges to Security Lead for policy clarification

Incident Response:

- Serve as primary technical contact for incidents involving their AI system
- Participate in incident investigation: provide logs, explain system behavior, recommend remediation
- Implement corrective actions identified in incident postmortem
- Document lessons learned and contribute to policy updates

#### 3.3.5 Research Services

Administrative Support:

- Maintain personnel acknowledgment records for policy compliance evidence
- Coordinate training scheduling and completion tracking
- Onboard new personnel with AI tool access: provision accounts, assign training, verify acknowledgment
- Offboard departing personnel: revoke tool access, archive work products, document knowledge transfer

Compliance Documentation:

- Maintain centralized repository of policy acknowledgments, training completions, exception approvals, risk acceptances
- Prepare compliance evidence packages for internal audits or regulatory review
- Track policy version history and re-acknowledgment campaigns
- Support Review Board with administrative logistics: meeting scheduling, agenda preparation, minutes documentation

Personnel Support:

- Guide researchers through infrastructure, data classification requirements, and AI tool access policies
- Answer routine policy questions and escalate complex interpretations to Security Lead or ARO
- Facilitate tool access requests: collect justification, route to Security Lead, communicate decisions
- Coordinate exception requests requiring elevated approval

---

## 4. AI Tool Approval and Management

### 4.1 Approved Tool Set

RadioAstronomy.io maintains a deliberately limited set of approved AI tools documented in Appendix C: Tool & Model Inventory. Current approved tools:

| Tool | Vendor | Access | Cost | Data Classifications | Training Status |
|------|--------|--------|------|---------------------|------------------|
| Gemini 2.5 Flash + Pro | Google | All personnel via Workspace | $137/mo (included) | Public-Internal, Public-External | No (training opt-out) |
| Claude Max | Anthropic | CTO only | $100/mo | Public-Internal, Protected (via Kasm) | No (training opt-out) |
| GLM-4.6 | Z.ai | Engineer role only | $30/mo ($15 promo) | Public-External ONLY | YES - trains on data |
| Llama 3.1 8B | Meta (local) | All personnel | $0/mo (infrastructure) | All including Protected | No (air-gapped) |

Total Monthly Cost: $267/month ($252 during Q1 2025 promotional pricing)

Tool Access Philosophy:

- Gemini as universal base: Every team member has Gemini via Workspace with no marginal cost or approval needed
- Claude Max for quality: CTO-only access for high-stakes documentation and strategic work justifying premium cost
- Z.ai for specialized use: Engineer role for astronomy and data science research code where training on data is acceptable
- Local models for privacy: All personnel for Protected data and experimentation without vendor dependencies

### 4.2 Data Classification System

RadioAstronomy.io uses a four-tier data classification system aligned to AI tool capabilities and constraints:

Tier 1: Public-Internal

- Definition: Information created by RadioAstronomy.io, intended for public disclosure, under our control
- Examples: Published papers, public repos we own, released documentation
- AI Tools: Gemini, Claude Max, local models (training opt-out tools)
- Prohibited: Z.ai (we prefer training opt-out for our intellectual output)

Tier 2: Public-External

- Definition: Astronomy and data science research code, scientific analysis workflows, and external community repositories where training on data is acceptable
- Examples: Astronomy analysis pipelines, data processing scripts, scientific computation code, research workflows, external GitHub repos, community open-source projects
- AI Tools: Z.ai acceptable (trains on data, but research code is not commercially sensitive), also Gemini, Claude Max, local models
- Purpose: This tier enables Z.ai usage on research code while preventing its use on infrastructure and proprietary code. Engineer role distinguishes domain boundaries.

Tier 3: Protected

- Definition: Internal information requiring confidentiality, not approved for public disclosure
- Examples: Research drafts, internal docs, proprietary code, infrastructure configs, collaboration agreements
- AI Tools: Claude Max via Kasm isolation (CTO only), local models (all personnel)
- Prohibited: Gemini (no DLP for standard access), Z.ai (trains on data)

Tier 4: Secrets

- Definition: Credentials, keys, tokens, PII, legally protected data
- Examples: API keys, passwords, OAuth tokens, SSH keys, personal information
- AI Tools: NONE - never input into any AI system
- Handling: Use secrets management systems (Google Secrets Manager, environment variables)

Classification Decision Framework:

- Unsure between Public-Internal and Protected? → Treat as Protected
- Unsure between Public-Internal and Public-External? → If we created/control it → Public-Internal
- Unsure if something is a Secret? → Treat as Secret
- Before downgrading Protected to Public → Get explicit approval from data owner

### 4.3 Tool Selection and Access Management

Access Provisioning:

- Gemini via Workspace: Automatic for all personnel with Google Workspace account (SSO + YubiKey MFA enforced)
- Claude Max: CTO authorization only; may delegate temporarily for specific projects
- Z.ai: Engineer role assignment via RBAC; OAuth restricted to RadioAstronomy.io domain
- Local models: Authenticate via Active Directory; network access through NetBird ZTNA

Tool Selection Guidance:

- Processing Secrets? → STOP - never use any AI system
- Processing Protected data? → Claude Max via Kasm (CTO only) OR local models
- Processing Public-External code for review? → Z.ai acceptable (Engineer role only)
- Processing Public-Internal data? → Gemini (everyone), Claude Max (CTO for quality work), local models
- Uncertain about classification? → Ask Security Lead before processing

### 4.4 Tool Addition Process

Request Submission:

1. Personnel submit tool request to Security Lead with business justification: what problem does this solve? why can't existing tools handle it? expected usage volume? cost estimate?
2. Security Lead conducts initial triage: obvious duplication? security red flags? clearly out of scope?

Evaluation Process:
3. Security Review: Security Lead evaluates vendor security posture, contract terms, compliance certifications, data handling policies, training opt-out status
4. Risk Assessment: ARO conducts lightweight risk assessment: what data would be processed? what controls needed? residual risk acceptable?
5. Cost Analysis: CTO evaluates licensing costs, operational overhead, usage forecasts, budget impact, overlap with existing tools
6. Technical Evaluation: Operations Lead assesses integration complexity, infrastructure requirements, maintenance burden

Approval and Implementation:
7. Review Board Decision: AI Review Board reviews at quarterly meeting (or special session for urgent requests); approves/denies by consensus or majority vote; CTO breaks ties
8. Implementation: If approved, Security Lead configures enterprise deployment, establishes access controls, updates Tool Register (Appendix C), prepares usage guidance
9. Communication: Security Lead announces tool availability, provides training materials, documents configuration settings, establishes support channels

Timeline: 2-4 weeks for routine requests; expedited for urgent business needs with compensating controls

### 4.5 Tool Removal Process

Removal Triggers:

- Security incidents or vulnerability disclosure affecting tool
- Vendor policy changes (training opt-out removal, unacceptable data handling changes)
- Insufficient usage to justify cost (identified in quarterly review)
- Better alternatives available (superior capability, cost, or security)
- Vendor instability or service discontinuation

Removal Process:

1. Review Board Decision: AI Review Board decides to deprecate tool; documents rationale
2. Transition Planning: Identify replacement tool or alternative workflow; assess migration effort
3. Communication: 30-day advance notice to users (extended if complex migration); provide migration guidance
4. Migration Support: Assist users with workflow transition; address technical blockers
5. Access Revocation: Disable access after transition period
6. Documentation: Update Tool Register (Appendix C) with "Deprecated" status and removal date; archive historical configuration for compliance evidence

---

## 5. Risk Management Framework

### 5.1 Risk Tolerance

RadioAstronomy.io's AI risk tolerance is anchored to NIST AI RMF trustworthiness characteristics and Colorado SB-24-205 compliance requirements.

Zero Tolerance Risks (Unacceptable Under Any Circumstances):

- Secrets in AI inputs: Credentials, keys, tokens, PII never submitted to any AI system (including local models)
- Protected data in Gemini or Z.ai: Protected data requires Kasm-isolated Claude Max (CTO only) or local models
- Algorithmic discrimination: Colorado SB-24-205 prohibition on differential treatment based on protected characteristics
- Intentional policy violations: Deliberately circumventing controls or hiding AI usage

Low Risk Tolerance (Requires Strong Controls):

- Protected data exposure: Must use inside-perimeter controls (Kasm isolation, local models) with technical enforcement
- Unverified AI outputs in high-consequence contexts: Risk assessments, security policies, research conclusions require deep verification
- Agent authority violations: Agents exceeding bounded contexts or making unauthorized cross-domain decisions
- Data classification errors: Misclassifying data leading to inappropriate AI processing

Moderate Risk Tolerance (Acceptable with Controls):

- Public-Internal data in commercial AI: Acceptable with training opt-out contractual protections (Gemini, Claude Max)
- Public-External data in Z.ai: Acceptable because research code will be published; training acceptable; tool training is explicit and constrained
- AI-assisted development: Code generation, documentation, analysis with mandatory human verification
- Agent autonomous operations: Within bounded contexts with logging, escalation procedures, human oversight

Higher Risk Acceptance (With Explicit Approval):

- Novel AI techniques: Experimental approaches requiring ARO or CTO risk acceptance
- Temporary control gaps: Time-bound exceptions during transition periods with compensating controls
- Emergency expedited tool adoption: Urgent business need with enhanced monitoring and review

### 5.2 Risk Assessment Requirements

Mandatory Risk Assessment Triggers:

- New AI system deployment (structured AI application, not routine tool use)
- Significant changes to existing AI system (new capabilities, expanded data access, modified decision authority)
- High-risk AI system as defined by Colorado SB-24-205 (algorithmic discrimination risk)
- Autonomous agents operating without real-time human approval
- AI systems processing Protected data
- Novel AI use cases without established controls

Assessment Methodology:
System Owners conduct AI System Impact Assessment (AISIA) following the AI Risk Assessment & Management Standard, which integrates:

- NIST AI RMF Map function (contextual analysis, harm identification)
- CIS-RAM methodology (quantitative risk scoring, safeguard evaluation)
- CIS Controls v8.1 Implementation Group 1 (technical control selection)

Assessment Outputs:

- Risk identification and rating (inherent and residual)
- Control recommendations mapped to Secure AI Systems Standard
- Risk acceptance decision (ARO or CTO approval required)
- Documentation per AI Transparency Standard

### 5.3 Specific Risk Areas

R1: Protected Data Exposure via Cloud AI

- Risk: Personnel inadvertently process Protected data through Gemini or Z.ai; data leaves secure enclave
- Controls: Four-tier data classification training, Kasm workspace DLP for Claude Max Protected access, enterprise AI platforms with training opt-out
- Residual Risk: Low with controls; acceptable with ongoing monitoring

R2: Z.ai Training on Internal Code

- Risk: Engineer uses Z.ai on RadioAstronomy.io internal code (Public-Internal); our code becomes part of Z.ai training dataset
- Controls: Four-tier classification system explicitly distinguishes Public-Internal (ours) from Public-External (community); training emphasizes Z.ai only for research code; technical enforcement via RBAC and repo tagging
- Residual Risk: Moderate; acceptable with enhanced training and monitoring

R3: Secrets in AI Prompts

- Risk: Personnel accidentally include credentials, keys, or tokens in AI prompts
- Controls: Secrets management training, never-input-secrets policy emphasis, secrets scanning in repos, prompt review for high-consequence work
- Residual Risk: Low; incidents require immediate rotation and documented as security events

R4: Unverified AI Output in Critical Contexts

- Risk: AI-generated content used for high-consequence decisions without adequate verification
- Controls: Mandatory human verification requirements in AUP, multi-model consensus for complex tasks, verification documentation in work products
- Residual Risk: Moderate; acceptable with quality culture and verification enforcement

R5: Agent Authority Boundary Violations

- Risk: Agent exceeds bounded context, makes unauthorized decisions, or operates outside design constraints
- Controls: Technical authority limits, bounded context architecture, human escalation procedures, comprehensive logging
- Residual Risk: Moderate; acceptable with monitoring and quarterly reviews

Additional risk scenarios: See Secure AI Systems Standard Section 10 (Risk Catalog) for complete list

---

## 6. Policy Maintenance and Evolution

### 6.1 Review Cycle

This policy is reviewed quarterly by the AI Review Board, synchronized with reviews of companion standards (Risk Assessment, Secure AI Systems, Transparency).

Review Scope:

- Tool Register audit (Appendix C): verify tools remain appropriate, costs justified, contracts current
- Risk landscape assessment: evaluate new AI risks, assess control effectiveness, review incidents
- Compliance verification: CIS Controls v8.1, NIST AI RMF, Colorado SB-24-205 alignment
- Policy effectiveness: gather personnel feedback, review training completion, identify confusion areas
- Regulatory developments: track federal and state AI legislation, update compliance posture

Review Outputs:

- Policy updates (if needed)
- Tool additions/removals
- Control enhancements
- Training material updates
- Compliance evidence

### 6.2 Change Management Process

Amendment Triggers:

- Scheduled quarterly review identifies improvement opportunity
- New tool approval requiring policy update
- Vendor changes affecting approved tools (pricing, features, policies)
- Security incident revealing policy gap or ambiguity
- Regulatory changes requiring compliance adjustment
- Personnel feedback indicating operational friction or confusion

Amendment Process:

1. Proposal: Change proposed to Security Lead or Review Board with rationale and impact assessment
2. Impact Assessment: Security Lead drafts proposed changes and assesses impact—will this break current workflows? create undue burden? require significant resource investment?
3. Stakeholder Consultation: Review Board discusses at quarterly meeting or special session for urgent changes; affected roles consulted on operational feasibility
4. Approval: Review Board approves changes by consensus or majority vote (CTO breaks ties); Executive leadership signs off on major versions
5. Communication: Changes announced through multiple channels (email, Slack, workspace banners); training materials updated; transition period provided for significant changes (30-90 days typical)
6. Implementation: Technical controls updated to reflect policy changes; monitoring adjusted for new requirements; enforcement begins after transition period
7. Documentation: Version published to GitHub with detailed release notes; changelog maintained showing policy evolution; rationale documented for significant changes

Material Changes Requiring Re-Acknowledgment:

- New data classification tiers or significant changes to classification rules
- Substantial changes to agent authority tiers or permissions
- Addition/removal of core approved tools requiring workflow changes
- Major restructuring of roles and responsibilities
- Changes to enforcement approach or violation consequences

Minor Changes (Notification Sufficient):

- Control enhancements or technical improvements
- Clarifications to existing requirements
- Updates to technical architecture descriptions
- Tool configuration changes
- Expanded examples or guidance

### 6.3 Version Control

All policy versions maintained in RadioAstronomy.io public GitHub repository with:

- Semantic versioning: MAJOR.MINOR.PATCH format
  - Major: Structural changes, new principles, significant scope changes
  - Minor: Control enhancements, clarifications, process improvements, tool corrections
  - Patch: Typo corrections, formatting, link updates
- Detailed changelog: What changed, why it changed, who requested it, when effective
- Rationale documentation: Significant changes include decision rationale in ADR format
- Synchronized framework versions: All governance documents (policy + 3 standards) share same major version number

Version History:

- v1.0 (2025-10-24): Initial RadioAstronomy.io governance framework
- v1.1 (2025-10-26): Corrected tool inventory (added Z.ai, removed OpenAI references), expanded to four-tier data classification, clarified tool access patterns

Public Repository Benefits:

- Demonstrates real implementation vs. theoretical documentation
- Enables community feedback and improvement suggestions
- Provides reputational accountability—public commitment to governance effectiveness
- Serves as reference implementation for SMB/SME AI governance

### 6.4 Learning from Operational Experience

RadioAstronomy.io treats policy as living document informed by operational experience, not immutable mandate. Every AI-related incident or near-miss generates lessons learned analysis:

- What happened? (timeline and facts)
- Why did it happen? (proximate and root causes)
- Did existing policy/controls prevent or detect the issue?
- If not, what changes would prevent recurrence?
- What worked well that should be reinforced?

Lessons learned feed directly into policy updates—real operational experience trumps theoretical best practices. Public GitHub repository documents this evolution honestly, showing the work (including mistakes and corrections) rather than just polished results.

---

## 7. Approval and Acknowledgment

Approved By:

- Chief Technology Officer, Date: 2025-10-26
- AI Review Board, Date: 2025-10-26

Review Board Endorsement:

This policy has been reviewed and endorsed by the RadioAstronomy.io AI Review Board on 2025-10-26. Review Board composition and member signatures maintained in Review Board meeting minutes.

Personnel Acknowledgment:

All personnel with AI tool access must acknowledge this policy during onboarding and after major version updates. Acknowledgment confirms:

- I have read and understand this AI Governance Policy
- I understand the four-tier data classification system (Public-Internal, Public-External, Protected, Secrets)
- I understand which AI tools I have access to and their constraints (Gemini for everyone, Claude Max for CTO only, Z.ai for Engineer role only, local models for everyone)
- I understand Z.ai trains on submitted data and will only use it for Public-External code
- I will never input Secrets into any AI system
- I understand my role-specific responsibilities
- I will comply with referenced standards (Risk Assessment, Secure Systems, Transparency, Acceptable Use)
- I understand that violations may result in access suspension or termination
- I know how to ask questions when uncertain about policy requirements

Acknowledgment records maintained by Research Services as compliance evidence.

---

## 8. Related Documents

Companion Standards (must be read together with this policy):

- AI Acceptable Use Policy (day-to-day operational guidance for personnel and agents)
- AI Risk Assessment & Management Standard (defines "how" to assess risk)
- Secure AI Systems Standard (defines "what" controls and practices are required)
- AI Transparency & Disclosure Standard (defines documentation and reporting requirements)

Supporting Documentation:

- Appendix C: Tool & Model Inventory (authoritative approved tools and configurations)
- RACI Matrix (decision authority and accountability)
- Risk Assessment Templates (AISIA template, CIS-RAM workbook)
- Training Materials (onboarding guides, role-specific deep dives)

External References:

- NIST AI Risk Management Framework (AI RMF 1.0)
- CIS Controls v8.1 (cybersecurity baseline)
- CIS Risk Assessment Method (CIS-RAM)
- Colorado SB-24-205 (Colorado Artificial Intelligence Act)
- ISO 31000:2018 (Risk Management Guidelines)

---

Document Control:

- Source: <https://github.com/radioastronomy-io/ai-governance/policies/01-ai-governance-policy.md>
- Contact: <ops@radioastronomy.io>
- Next Review: 2026-01-26
- Version History: See GitHub repository changelog

Template Availability:

This operational policy is maintained with RadioAstronomy.io specifics for actual use. A generic template version with placeholders (`<ORGANIZATION_NAME>`, `<IDENTITY_PROVIDER>`, etc.) is available in the repository's `/templates` directory for SMB/SME community adoption.

---

Policy Version: 1.1  
Effective Date: 2025-10-26  
Next Review: 2026-01-26  
Status: Active  
Major Changes in v1.1:

- Corrected tool inventory to match Appendix C ground truth (added Z.ai GLM-4.6, removed OpenAI references)
- Expanded to four-tier data classification system (added Public-External tier for Z.ai governance)
- Clarified tool access patterns (Gemini universal, Claude Max CTO-only, Z.ai Engineer-role-only)
- Added Z.ai training constraint throughout policy
- Updated risk scenarios to reflect actual tool set and data classification
- Enhanced role responsibilities for data classification compliance
