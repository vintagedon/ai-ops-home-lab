# AI Services Usage Policy

**Document ID:** POL-AI-001  
**Version:** 3.0  
**Effective Date:** 2025-01-27  
**Policy Owner:** Chief Technology Officer  
**Review Cycle:** Annual  
**Scope:** All personnel, contractors, and AI agents within RadioAstronomy.io

---

## 1. Introduction

### 1.1 About RadioAstronomy.io

RadioAstronomy.io is a six-person citizen science organization operating a Proxmox-based astronomy compute cluster. We publish astronomical datasets to Zenodo, contribute research to Value-Added Catalogs (VACs), maintain open-source astronomy tools on GitHub, and donate compute time to astronomy students worldwide. Our work appears in scientific literature, our datasets get cited in research papers, and our infrastructure decisions affect student researchers.

### 1.2 AI-Native Operations

We operate as an **AI-native organization**. AI assistance and automation are embedded throughout our work fabric—from cluster orchestration to research documentation to community contributions. This is not "we use AI tools." This is "AI agents are part of our operational workforce."

Our multi-agent architecture includes:

- Human personnel (strategic direction, approval authority, domain expertise)
- Claude instances (project management, documentation, governance)
- Gemini CLI agents (automation, operations, scheduled tasks)
- Infrastructure tooling (MCP servers, cluster automation)

### 1.3 Voluntary High-Risk Posture

We voluntarily adopt high-risk AI deployment practices even though our organizational size does not legally require it. **The reason is simple:** our downstream impact exceeds our organizational footprint.

- Published datasets get cited in scientific literature
- Errors propagate through research papers
- Automated infrastructure decisions affect student access
- Open-source contributions influence how others build systems

This shapes our compliance approach. We follow **Colorado SB24-205** requirements voluntarily (impact assessments, transparency disclosures, algorithmic management standards). We operate within **CIS Controls v8.1 IG1** for baseline cybersecurity. We align with **NIST AI RMF 1.0** for risk management and **ISO 31000:2018** for risk practices.

The frameworks aren't the goal—they're the scaffolding that keeps high-impact work disciplined.

### 1.4 Purpose of This Policy

This policy establishes clear guidelines for responsible AI use within RadioAstronomy.io. It defines:

- Data classification boundaries that determine AI tool selection
- Role-based responsibilities for AI usage across human and agent personnel
- Risk management practices aligned with multiple compliance frameworks
- Enforcement mechanisms and accountability structures

This policy applies to all operational systems, published work, infrastructure automation, and community contributions. Compliance is mandatory for all personnel, contractors, and AI agents.

---

## 2. Policy Objectives

The primary objectives of this policy include:

1. **Provide clear guidance** on which AI models to use for which data classifications and work contexts
2. **Ensure confidentiality and protection** of sensitive organizational and research data when interacting with AI technologies
3. **Mitigate risks** associated with AI misuse, bias, inaccuracy, and security vulnerabilities
4. **Foster awareness** among all personnel about their responsibilities when using AI tools
5. **Promote ethical integration** of AI into scientific research and infrastructure operations
6. **Enable AI-native operations** while maintaining compliance with voluntary high-risk standards
7. **Support citizen science mission** through responsible AI-assisted research and student compute donation
8. **Maintain transparency** with the research community about our AI usage in published work

---

## 3. Scope

### 3.1 Applicability

This policy applies to:

- All RadioAstronomy.io employees, contractors, consultants, and temporary personnel
- All AI agents operating within RadioAstronomy.io infrastructure (Claude instances, Gemini CLI, automation systems)
- All activities involving AI technologies across operational, research, and community functions
- All business units, projects, and operational systems regardless of geographic location

### 3.2 Coverage

This policy covers:

- Generative AI services (Gemini, Claude, local models)
- AI-powered productivity tools and coding assistants
- Autonomous automation agents (Gemini CLI operations)
- AI-assisted infrastructure management and cluster orchestration
- AI use in research data processing, analysis, and publication
- AI use in documentation, community contributions, and open-source projects

### 3.3 Integration

This policy integrates into broader organizational practices including:

- Data classification and protection standards
- Access control and identity management
- Research integrity and publication ethics
- Infrastructure security and operations
- Staff training and competency development
- Incident response and risk management

---

## 4. Data Classification Framework

**Our data classification defines what goes where.** Every interaction with AI starts here. This is the core organizing principle that determines which AI models are appropriate for which work.

### 4.1 Secrets (Never AI)

**Definition:** Credentials, API keys, tokens, passwords, personally identifiable information (PII), protected health information (PHI), SSH keys, TLS certificates, encryption keys, service account credentials.

**Boundary:** Never input Secrets into any AI model under any circumstances. Use secrets management systems (HashiCorp Vault, GCP Secret Manager) and credential rotation instead.

**Why this matters:** Secrets exposure creates immediate security compromise. AI models—even with enterprise agreements—introduce unnecessary risk surfaces for credential handling. Architectural certainty requires zero AI contact with authentication materials.

**Applicable Controls:**

- CIS 3.11 (Data Protection) - Encrypt sensitive data at rest
- CIS 6.1 (Access Control) - Centralized secrets management
- NIST AI RMF MAP 1.1 - Context of use includes sensitive data handling

### 4.2 Protected (Local or CTO-Isolated Only)

**Definition:** Draft research before publication, proprietary algorithms, student research data before release, internal security assessments, pre-decision governance drafts, configuration files containing implementation details.

**Boundary:** Process on local models (Llama-3-7B on A4000 GPU) or via CTO-isolated Claude workspace. Cloud models (Gemini, Z.ai) cannot access Protected data.

**Why this matters:** Protected data represents work-in-progress with strategic or competitive sensitivity. Local processing provides architectural air-gap. CTO isolation ensures appropriate oversight for high-stakes review.

**Applicable Controls:**

- CIS 3.12 (Data Protection) - Segment data processing by classification
- NIST AI RMF GOVERN 1.6 - Policies for third-party risk (cloud model vendors)
- ISO 31000 Clause 6.4 - Risk treatment via architectural isolation

### 4.3 Public-Internal (Gemini/Claude, Training Opt-Out)

**Definition:** Our internal code repositories, documentation, runbooks, published research/datasets (post-release), operational logs, architecture diagrams, internal processes.

**Boundary:** Use Gemini Pro 2.5 (enterprise SSO, training opt-out enforced) or Claude (CTO for high-stakes work). This is "our IP, but not secret"—appropriate for enterprise models with data protection agreements.

**Why this matters:** Public-Internal represents organizational knowledge we control and may eventually publish, but isn't public yet. Enterprise models with training opt-out provide productivity without IP leakage risk.

**Applicable Controls:**

- CIS 9.2 (Data Protection) - Data loss prevention on enterprise platforms
- NIST AI RMF GOVERN 1.7 - Transparency in AI operations (training opt-out documented)
- Colorado SB24-205 §6-1-1703(2)(b) - Transparency regarding training data practices

### 4.4 Public-External (Z.ai Allowed, Engineer Role Only)

**Definition:** Forked OSS repositories we don't control, community contributions, public astronomy datasets bound for publication with unrestricted global access, upstream pull requests, citizen science code contributions.

**Boundary:** Z.ai GLM-4.6 is permitted for Public-External astronomy and data science research code only. Engineer role required. Internal repositories (even if public on GitHub) remain Public-Internal (use Gemini/Claude).

**Why this matters:** Research code will be published to GitHub/Zenodo/journals with unrestricted access, making training acceptable. Z.ai accelerates citizen-science contributions. Boundary enforcement prevents internal code exposure.

**Applicable Controls:**

- CIS 6.8 (Access Control) - Role-based access to tools
- NIST AI RMF GOVERN 5.1 - Organizational policies for third-party AI use
- ISO 31000 Clause 6.4.2 - Risk treatment via scope boundaries

---

## 5. Role-Based AI Stack

**We don't manage AI use through permissions. We manage it through architecture.** Every model in our stack serves a specific purpose, tied to data classification and consequence. Using the right model for the right work is how the compliance story holds together.

### 5.1 Decision Path

When selecting an AI model, follow this decision tree:

1. **What's the data class?**  
   - Secrets → Never AI (use secrets management)
   - Protected → Local models or CTO-isolated Claude only
   - Public-Internal → Gemini or Claude
   - Public-External → Z.ai allowed (Engineer role only)

2. **Is this autonomous automation?**  
   - Yes → Gemini CLI with service account RBAC

3. **Is this governance-grade output requiring editorial quality?**  
   - Yes → Claude (CTO review required)

4. **Is this astronomy/data science research code for public release?**  
   - Yes → Z.ai acceptable (Engineer role, Public-External only)

No permission requests. No "can I use AI for this?" questions. Know your data class, use the appropriate model, document where it matters.

### 5.2 Gemini Pro 2.5 (Everyone)

**Purpose:** The daily work fabric embedded in Google Workspace (Docs, Drive, Gmail, Meet, AI Studio).

**Authorized Use:**

- Day-to-day chat, drafting, research, analysis
- Workspace-native tasks (summaries, meeting notes, document linting, inbox triage)
- Code assistance for Public-Internal work
- Documentation generation and review
- Operational queries and troubleshooting

**Data Classification:** Public-Internal and Public-External only. Never Secrets or Protected.

**Why this model:** Enterprise SSO, MFA, audit logging, training opt-out. Satisfies CIS IG1 identity and data protection controls. Centralized admin provides organizational visibility.

**Access:** All personnel via RadioAstronomy.io Workspace accounts.

**Applicable Controls:**

- CIS 5.1 (Account Management) - Enterprise identity integration
- CIS 8.2 (Audit Logging) - Workspace audit logs for AI interactions
- NIST AI RMF GOVERN 4.1 - Accountability through technical monitoring

### 5.3 Gemini CLI (Automation Agent)

**Purpose:** Autonomous operations at scale. Converts governance into executable automation.

**Authorized Use:**

- Scheduled research briefs and operational reports
- Repository hygiene and documentation linting
- Evidence packaging for compliance
- Bulk automation tasks via scripted runbooks
- Infrastructure management through GCP RBAC service accounts

**Data Classification:** Public-Internal only. Never Secrets or Protected.

**Why this model:** High throughput (120 req/min), enterprise authentication/authorization, auditable API calls. Service accounts enforce least privilege. Automation operates under organizational identity, not personal accounts.

**Access:** Service accounts only, managed by CTO.

**Applicable Controls:**

- CIS 6.1 (Access Control) - Service account least privilege
- CIS 8.5 (Audit Logging) - Collect detailed audit logs
- NIST AI RMF MANAGE 2.3 - AI system monitoring and performance

### 5.4 Claude (CTO Only)

**Purpose:** Governance-grade documentation and strategic work requiring editorial quality.

**Authorized Use:**

- Policies, standards, and compliance documentation
- Strategic planning and architectural decisions
- High-stakes communication to external stakeholders
- Protected data processing (via CTO-isolated workspace)
- Complex multi-framework compliance work

**Data Classification:** All tiers permitted (Secrets excluded, Protected via isolation).

**Why this model:** Consistently produces governance-grade prose. Limited access maintains cost discipline and reduces risk surface. CTO isolation enables Protected data processing with appropriate oversight.

**Access:** CTO only, with temporary delegation for specific high-stakes projects.

**Applicable Controls:**

- CIS 6.8 (Access Control) - Role-limited access
- NIST AI RMF GOVERN 1.3 - Accountability for AI governance decisions
- ISO 31000 Clause 5.4.3 - Decision-making includes quality review

### 5.5 Z.ai GLM-4.6 (Engineer Role Only)

**Purpose:** Public astronomy and data science research code workhorse for community contributions.

**Authorized Use:**

- Reviewing pull requests on external repositories we don't control
- Prototyping with public astronomical datasets bound for publication
- Generating tests for upstream open-source contributions
- Citizen science code development for global public release

**Data Classification:** Public-External only. Strictly prohibited for Public-Internal, Protected, or Secrets.

**Why this model:** Trains on submitted data, which is acceptable for research code destined for unrestricted global publication (GitHub/Zenodo/journals) but unacceptable for internal infrastructure or Protected content. Accelerates citizen-science contributions without risking organizational IP.

**Access:** Engineer role only.

**Applicable Controls:**

- CIS 6.8 (Access Control) - Role-based tool access
- NIST AI RMF GOVERN 5.1 - Third-party AI use policies
- Colorado SB24-205 §6-1-1704(2)(a) - Training data practices disclosed

### 5.6 Local Models (Llama-3-7B on A4000)

**Purpose:** Privacy and edge processing for Protected data.

**Authorized Use:**

- Sensitive linting and refactoring on configurations/datasets
- Air-gapped experiments requiring complete isolation
- Offline analysis where latency and privacy trump model capability
- Fallback processing during cloud vendor outages

**Data Classification:** Protected and Public-Internal. Never Secrets.

**Why local:** Architectural certainty through air-gap enforcement, zero egress, physical/network isolation. Clean compliance story for Protected data processing.

**Access:** Technical personnel with appropriate workstation hardware.

**Applicable Controls:**

- CIS 3.12 (Data Protection) - Segmented processing by classification
- CIS 12.8 (Network Security) - Air-gapped environments for sensitive processing
- NIST AI RMF GOVERN 1.6 - Third-party risk eliminated via local deployment

---

## 6. Responsibilities by Role

### 6.1 All Personnel

**Core Responsibilities:**

1. **Data Classification Awareness**
   - Understand the four data classification tiers
   - Correctly identify data class before AI interaction
   - Never input Secrets into any AI system
   - Use appropriate model for data classification

2. **Model Selection**
   - Use Gemini for daily Public-Internal work
   - Use local models or request CTO assistance for Protected data
   - Never use unapproved AI tools for organizational work
   - Follow decision path in Section 5.1

3. **Output Validation**
   - Review all AI-generated content for accuracy before use
   - Verify AI outputs against authoritative sources
   - Identify and correct hallucinations, bias, or errors
   - Never blindly trust AI-generated technical recommendations

4. **Transparency**
   - Acknowledge AI assistance in external publications where significant
   - Document AI usage in research methodologies
   - Be transparent about AI-generated content in community contributions
   - Maintain research integrity in citizen science work

5. **Security Practices**
   - Use only RadioAstronomy.io enterprise accounts (never personal accounts)
   - Report suspected policy violations or security incidents immediately
   - Maintain MFA on all enterprise AI service accounts
   - Follow incident response procedures for data exposure

6. **Prohibited Activities**
   - Using unapproved AI tools for organizational work
   - Inputting Secrets into any AI system
   - Processing Protected data through cloud AI without CTO authorization
   - Misrepresenting AI-generated work as entirely human-created
   - Using Z.ai on internal code or Protected data

### 6.2 Chief Technology Officer

**Additional Authorities (Beyond All Personnel):**

- Access to Claude for governance-grade documentation
- Authority to process Protected data via CTO-isolated Claude workspace
- May delegate Claude access temporarily for specific high-stakes projects
- Final authority on AI tool selection for strategic initiatives
- Approves new AI tool additions to the stack

**Additional Responsibilities:**

- Model appropriate tool selection (use Gemini for routine, Claude for quality-critical)
- Provide multi-model consensus when both Gemini and Claude available for verification
- Mentor team on effective AI usage patterns
- Maintain AI Tool Register and compliance documentation
- Chair AI Review Board (Section 7.7)
- Oversee service account management for Gemini CLI

### 6.3 Engineer Role

**Additional Authorities (Beyond All Personnel):**

- Access to Z.ai GLM-4.6 for Public-External astronomy and data science research code
- May process external public repositories through Z.ai (trains on data)
- Authority to contribute to open-source projects using Z.ai assistance

**Additional Responsibilities:**

- Understand Z.ai trains on submitted data—acceptable only for research code destined for unrestricted global publication
- Never use Z.ai on RadioAstronomy.io internal code, infrastructure code, Protected data, or Secrets
- Verify code is actually Public-External (research, not infrastructure) before Z.ai processing
- Document Z.ai usage in contributions to external projects
- Report classification confusion immediately
- Maintain separation between internal repositories (Public-Internal, use Gemini) and external forks (Public-External, Z.ai acceptable)

### 6.4 AI Agents

**Scope:** This applies to Claude instances, Gemini CLI automation, and future agent systems.

**Responsibilities:**

- Operate within bounded scope defined in agent configuration
- Process only authorized data classifications
- Generate audit logs for all significant operations
- Escalate to human personnel when encountering ambiguous situations
- Follow data handling procedures appropriate to classification
- Report errors, failures, or policy violations via defined channels
- Maintain separation between agent roles (no cross-contamination)

**Accountability:** AI agents operate under organizational identity with human oversight. Agent actions are attributed to the authorizing personnel (typically CTO for infrastructure agents).

---

## 7. Risk Management and Impact

### 7.1 Risk Scenario Library

RadioAstronomy.io maintains a comprehensive risk scenario library documenting AI-related threats, controls, and risk treatment decisions aligned with NIST AI RMF 1.0, CIS Controls v8.1, ISO 31000:2018, and Colorado SB24-205.

**Risk Scenarios:**

| ID | Risk Scenario | Impact Level | Primary Controls |
|----|---------------|--------------|------------------|
| [R01](/risk-scenarios/R01-data-egress-exposure.md) | Data Egress & Exposure | Unacceptable | DLP, inside-perimeter AI, no-training clauses, network segmentation |
| [R02](/risk-scenarios/R02-secrets-credentials-leakage.md) | Secrets and Credentials Leakage | Catastrophic | Ansible Vault, secret scanning, 90-day rotation, least privilege |
| [R03](/risk-scenarios/R03-prompt-injection-tool-abuse.md) | Prompt Injection & Tool Abuse | High | Input validation, tool permission boundaries, audit logging |
| [R04](/risk-scenarios/R04-pr-poisoning-infrastructure-drift.md) | PR Poisoning & Infrastructure Drift | High | Code review, branch protection, immutable infrastructure |
| [R05](/risk-scenarios/R05-model-extension-supply-chain.md) | Model Extension & Supply Chain | Medium | Vendor assessment, contract review, supply chain controls |
| [R06](/risk-scenarios/R06-identity-access-drift.md) | Identity & Access Drift | Medium | Access reviews, account lifecycle, permission audits |
| [R07](/risk-scenarios/R07-hallucination-inaccurate-output.md) | Hallucination & Inaccurate Output | High | Human review, multi-source verification, domain expert validation |
| [R08](/risk-scenarios/R08-legal-compliance-gaps.md) | Legal & Compliance Gaps | Medium | Framework alignment, contract review, compliance audits |
| [R09](/risk-scenarios/R09-cost-tool-sprawl.md) | Cost & Tool Sprawl | Low | Budget tracking, tool register, usage monitoring |
| [R10](/risk-scenarios/R10-logging-blind-spots.md) | Logging & Blind Spots | Medium | Comprehensive logging, SIEM integration, audit trail completeness |

**Each scenario documents:**

- Threat description with real-world examples and attack vectors
- Impact analysis including cascading effects across other risks
- Technical, process, and architectural controls with CIS Control mappings
- Detection indicators and incident response procedures
- Framework alignment (NIST AI RMF, ISO 31000, Colorado SB24-205)
- Risk treatment decisions with residual risk acceptance by ARO
- Evidence collection and audit trail requirements

**Location:** `/risk-scenarios/` directory in nist-ai-rmf-cookbook repository

**Usage:** When implementing controls from this policy, reference the relevant risk scenario for detailed technical specifications, testing procedures, control effectiveness evidence, and incident response playbooks.

### 7.2 Defense-in-Depth Architecture

RadioAstronomy.io's risk treatment strategy relies on **overlapping safeguards** across multiple control categories. Single control failure does not result in catastrophic impact.

**Architectural Layers:**

1. **Technical Controls (Preventive)**
   - Data classification enforcement at source (Section 4)
   - Network segmentation and zero-trust access (R01, R02)
   - Secrets management and encryption at rest (R02)
   - Secret scanning in development workflows (R02, R04)
   - DLP at endpoint and perimeter (R01)

2. **Process Controls (Detective)**
   - Mandatory training and competency requirements (Section 8.1)
   - Peer review for infrastructure changes (R02, R04)
   - Export approval workflows for Protected data (R01)
   - Access reviews and permission audits (R06)
   - Incident response and lessons learned (all risks)

3. **Contractual Controls (Corrective)**
   - No-training clauses with AI vendors (R01, R05)
   - Data deletion rights in vendor contracts (R01, R02)
   - Liability provisions for vendor security failures (R05)
   - SLA guarantees for availability and support (R09)

4. **Monitoring & Audit (Detective)**
   - Comprehensive logging across all AI interactions (R10)
   - SIEM alerting for anomalous patterns (R01, R02, R03)
   - Quarterly control effectiveness testing (all risks)
   - AI Review Board governance oversight (Section 7.4)

**Cross-Risk Relationships:**

Many risks exhibit **cascading effects** when controls fail:

- **R02 → R01:** Compromised credentials enable bulk data export, triggering data egress incident
- **R03 → R02:** Successful prompt injection can extract secrets through tool abuse
- **R06 → R01, R02:** Identity drift creates orphaned accounts with excessive permissions
- **R10 → All:** Logging blind spots prevent detection of any other risk manifestation

This interdependency reinforces the importance of comprehensive control implementation across all risk scenarios, not selective treatment of "high priority" risks only.

**Fail-Safe Defaults:**

When classification is ambiguous, default to treating data as **Protected** until proven Public. When DLP blocks legitimate workflow, escalate to Security Lead rather than disabling controls. When vendor contract lacks specific provision, assume no data protection guarantees.

### 7.3 Risk Treatment Decisions

All risks in the scenario library have undergone formal **CIS-RAM assessment** with documented risk treatment decisions:

**Risk Treatment Summary:**

| Risk ID | Inherent Risk | Residual Risk | Treatment | Accepted By | Review Date |
|---------|---------------|---------------|-----------|-------------|-------------|
| R01 | High (8/10) | Low (3/10) | Mitigate | ARO | Quarterly |
| R02 | Critical (10/10) | Medium (4/10) | Mitigate | ARO | Quarterly |
| R03 | High (8/10) | Low (3/10) | Mitigate | ARO | Quarterly |
| R04 | High (7/10) | Low (2/10) | Mitigate | ARO | Quarterly |
| R05 | Medium (6/10) | Low (2/10) | Mitigate | ARO | Annual |
| R06 | Medium (5/10) | Low (2/10) | Mitigate | ARO | Quarterly |
| R07 | High (8/10) | Medium (4/10) | Mitigate | ARO | Quarterly |
| R08 | Medium (6/10) | Low (2/10) | Mitigate | ARO | Annual |
| R09 | Low (4/10) | Low (1/10) | Accept | ARO | Annual |
| R10 | High (7/10) | Medium (3/10) | Mitigate | ARO | Quarterly |

**Organizational Risk Tolerance:**

RadioAstronomy.io defines risk tolerance thresholds as:

- **Catastrophic/Critical Impact:** Residual risk must be reduced to Low (≤3/10) or accepted with compensating controls
- **High Impact:** Residual risk target is Low (≤3/10), Medium (≤4/10) acceptable with quarterly review
- **Medium/Low Impact:** Residual risk target is Low (≤3/10), higher levels acceptable with documented justification

**Re-Assessment Triggers:**

Risk scenarios require immediate re-assessment when:

- New AI tool added to approved stack
- Security incident or near-miss occurs
- Vendor changes data handling practices
- Infrastructure architecture changes
- Regulatory requirements evolve
- Annual review cycle regardless of changes

**Residual Risk Acceptance:**

All residual risks have been formally accepted by the AI Risk Officer (ARO) with specific conditions documented in each risk scenario. Acceptance includes defined review dates and triggers for re-assessment. Residual risks primarily consist of:

- Sophisticated social engineering attacks beyond preventive controls
- Vendor contract breaches (mitigated through legal remedies)
- Zero-day vulnerabilities in AI services (mitigated through defense-in-depth)
- Rare edge cases where multiple independent controls fail simultaneously

### 7.4 Student Mission Risk

We donate compute time to astronomy students worldwide. AI doesn't touch their research directly, but automates infrastructure serving them.

**Risks:**

- **Availability Impact:** AI automation failures disrupt student access to cluster resources
- **Resource Misallocation:** Poor AI decisions affect student compute scheduling fairness
- **Data Exposure:** Student research data must never enter AI systems under any circumstances
- **Trust Violation:** Students depend on infrastructure reliability and data privacy

**Why This Matters:**

Students may be using our infrastructure for thesis research, dissertation work, or publications. Infrastructure failures during critical observation windows or paper submission deadlines can have significant academic consequences. Our voluntary high-risk posture reflects this downstream impact on human outcomes.

**Mitigations:**

- AI automation limited to infrastructure orchestration layer only, never student data processing
- Redundancy in cluster scheduling with manual fallback procedures
- Human oversight of resource allocation decisions affecting multiple users
- Clear boundaries: AI operates infrastructure, students use traditional astronomy tools (IRAF, Astropy, ds9)
- Transparent disclosure to student users about AI-assisted infrastructure management
- Student data classification as **Protected**—never processed by AI systems
- Dedicated support channels for students to report infrastructure issues
- Quarterly student satisfaction surveys to identify AI automation impacts

**Colorado SB24-205 Relevance:**

While infrastructure orchestration is not itself a "consequential decision" under Colorado law, downstream impacts on student research outcomes create a voluntary high-risk posture. RadioAstronomy.io applies impact assessment methodology (§6-1-1703) and transparency requirements (§6-1-1706) to student-facing systems even though not legally mandated.

**Applicable Risk Scenarios:**

- R01 (Data Egress): Student data is Protected—never enters AI systems
- R07 (Hallucination): AI-generated infrastructure changes must not affect student workloads
- R10 (Logging): Student access patterns logged for troubleshooting, not AI training

### 7.5 AI Review Board Governance

RadioAstronomy.io maintains a **six-person AI Review Board** providing multi-stakeholder oversight for AI adoption and risk management.

**Composition:**

- CTO (chair)
- Security Lead
- Operations Lead
- Senior Engineering Representative
- Research Domain Expert
- External Advisor (AI governance expertise)

**Meeting Cadence:** Quarterly (sooner if incident occurs)

**Responsibilities:**

- Review AI Tool Register for currency and appropriateness
- Assess risk scenario library for completeness and control effectiveness
- Evaluate new AI tool requests against compliance frameworks and risk scenarios
- Review incident reports and near-miss events for lessons learned
- Ensure governance practices remain effective as AI capabilities evolve
- Approve policy updates and framework alignment changes
- Accept residual risks on behalf of organization (ARO authority)

**Why This Structure:**

AI governance requires diverse perspectives. The Board balances:

- **Technical Security** (Security Lead) - Threat modeling and control design
- **Operational Feasibility** (Operations Lead) - Practical implementation constraints
- **Developer Productivity** (Engineering Rep) - Workflow integration and usability
- **Research Integrity** (Domain Expert) - Scientific quality and publication standards
- **Strategic Direction** (CTO) - Organizational mission alignment
- **External Best Practices** (External Advisor) - Industry benchmarking and emerging risks

This prevents governance from becoming either overly restrictive (blocking productivity) or ineffectively permissive (accepting unacceptable risks).

**Quarterly Review Agenda:**

1. **Tool Register Audit**
   - Verify all approved tools remain in active use
   - Review vendor contracts for changes to data handling practices
   - Validate documented configurations match production deployments
   - Assess new tool requests against risk scenarios

2. **Risk Landscape Assessment**
   - Review risk scenario library for completeness
   - Identify emerging risks not covered by existing scenarios
   - Evaluate control effectiveness evidence from testing
   - Update risk scores based on threat landscape changes

3. **Access Pattern Analysis**
   - Review usage logs for anomalies across all AI services
   - Identify unexpected usage spikes or unusual patterns
   - Verify role-based access boundaries remain enforced
   - Assess automation agent behavior for drift

4. **Compliance Posture Verification**
   - NIST AI RMF 1.0 alignment check
   - CIS Controls v8.1 IG1 baseline verification
   - ISO 31000:2018 risk management practices assessment
   - Colorado SB24-205 voluntary compliance review

5. **Training Effectiveness Assessment**
   - Review training completion rates
   - Analyze incident reports for training gaps
   - Update training materials based on real-world scenarios
   - Evaluate user feedback on competency requirements

6. **Incident and Near-Miss Review**
   - Comprehensive review of all reported incidents
   - Near-miss analysis for potential risk scenarios
   - Lessons learned integration into risk library
   - Control enhancement recommendations

**Decision Authority:**

The Review Board has authority to:

- Approve new AI tools for organizational use
- Update risk tolerance thresholds
- Modify control requirements in risk scenarios
- Mandate emergency risk re-assessments
- Recommend policy changes to executive leadership
- Accept residual risks within defined tolerance

---

## 8. Best Practices and Mission Support

### 8.1 Competency Requirements

**All Personnel:**

- Complete [Introduction to Generative AI](https://www.coursera.org/learn/introduction-to-ai) (Coursera, free) within 90 days of hire
- Understand AI capabilities, limitations, and failure modes
- Recognize hallucinations and bias in AI outputs

**Personnel Working with Protected Data:**

- Complete [IBM AI Foundations for Business Specialization](https://www.coursera.org/specializations/ibm-ai-foundations-for-business) (Coursera, free) within 6 months

**Why this exists:** High-risk deployment requires informed operators. Understanding how models work, where they fail, and what constitutes responsible use isn't academic—it's the baseline for making decisions affecting scientific outputs and student researchers.

**Additional Support:**

- One paid course of your choice per year (organization-funded)
- One AI/security certification reimbursed annually (conditional on passing)

**Applicable Controls:**

- NIST AI RMF GOVERN 2.2 - Workforce diversity, equity, inclusion, and accessibility
- CIS 14.1 (Security Awareness Training) - AI-specific competency as security control
- Colorado SB24-205 §6-1-1704(3) - Training requirements for high-risk AI developers/deployers

### 8.2 Personal and Community Use

We **encourage** AI use for personal projects, open-source contributions, and citizen science work.

**What's Permitted:**

- Full use of Gemini (personal account or enterprise account for personal projects)
- Learning, experimentation, and skill development
- Community contributions to astronomy and open-source projects
- Non-organizational citizen science work

**What's Expected:**

- Maintain data classification awareness (don't mix organizational Secrets or Protected data into personal projects)
- Public-Internal and Public-External boundaries still apply when representing RadioAstronomy.io
- Transparency about AI assistance in community contributions

**Why This Matters:**
We're building the future of AI-assisted scientific computing. Experimentation and community contribution are part of the mission. Learning happens through doing.

**Applicable Controls:**

- CIS 3.3 (Data Protection) - Classification awareness extends to personal use
- NIST AI RMF GOVERN 1.2 - Culture of AI responsibility includes personal conduct
- Colorado SB24-205 §6-1-1704(1)(a) - Risk management extends to organizational reputation

### 8.3 Student Mission Support

We donate cluster compute time to astronomy students worldwide. AI doesn't touch student research directly, but automates the infrastructure serving them.

**What This Looks Like:**

- Cluster orchestration, job scheduling, resource allocation—all AI-assisted
- Students interact with traditional astronomy tools (no AI in their workflow)
- AI operates behind the scenes to maintain reliable, cost-efficient infrastructure

**Why Automation Matters:**
Students need consistent, predictable access. Manual operations don't scale. AI-driven automation enables enterprise-grade reliability at citizen-science cost.

**Boundaries:**

- AI never processes student research data
- Infrastructure automation only
- Student-facing systems remain traditional scientific computing tools
- Transparency with students about AI-assisted infrastructure

**Applicable Controls:**

- NIST AI RMF MANAGE 1.1 - Documenting AI system use and impact
- CIS 8.2 (Audit Logging) - Infrastructure automation logged and monitored
- Colorado SB24-205 §6-1-1703(2)(a) - Transparency about AI use in services

### 8.4 Research Integrity

**Publication Standards:**

- Acknowledge significant AI assistance in research methodologies
- Disclose AI usage in data processing, analysis, or visualization
- Validate AI-generated insights through traditional scientific methods
- Cite AI tools appropriately in publications

**Dataset Quality:**

- Human review of all datasets before Zenodo publication
- Validation against authoritative astronomical catalogs
- Documentation of AI assistance in data processing pipelines
- Transparency about AI use in dataset metadata

**Code Contributions:**

- Document AI assistance in open-source contributions
- Review AI-generated code for correctness and efficiency
- Maintain code quality standards regardless of AI involvement
- Test AI-generated code thoroughly before merging

### 8.5 Transparency and Disclosure

**External Communications:**

- Disclose AI usage in grant applications
- Be transparent with collaborators about AI-assisted research
- Document AI tools in research methodologies
- Acknowledge AI assistance in presentations and papers

**Internal Operations:**

- Maintain AI Tool Register (current tools, configurations, data handling)
- Document agent architectures and decision authorities
- Log significant AI-assisted decisions
- Report AI incidents and near-misses

**Public Accountability:**

- Publish this policy to GitHub for public review
- Maintain transparency about voluntary high-risk compliance
- Share lessons learned with citizen science community
- Contribute to responsible AI practices in astronomy research

---

## 9. Enforcement and Accountability

### 9.1 Violation Handling

Violations of this policy are handled through standard organizational processes. The focus is on **systemic failure prevention**, not individual punishment.

**Response Framework:**

**First Violation:**

- Coaching and retraining (assumed to be competency gap)
- Root cause analysis: unclear boundaries, insufficient training, or policy ambiguity?
- Corrective action: additional training, clarified guidance, or policy update

**Pattern of Violations:**

- Performance management process
- Assessment of whether role is appropriate match for individual
- Evaluation of whether policy guidance is clear and actionable

**Intentional Policy Bypass:**

- Immediate escalation to CTO and CEO
- Security assessment of potential data exposure
- Incident response procedures activated
- Disciplinary action up to and including termination

**Why This Approach:**
Most policy violations come from unclear boundaries or insufficient training, not malicious intent. Our job is to make the boundaries clear and provide the tools to operate within them.

### 9.2 Incident Response

**Reportable Incidents:**

- Secrets exposed to AI system
- Protected data processed through unapproved cloud AI
- Unapproved AI tool used for organizational work
- AI-generated content published without review
- Data misclassification leading to inappropriate AI use
- Agent malfunction or unexpected behavior

**Reporting Process:**

1. Immediate notification to CTO
2. Contain the incident (stop further data exposure)
3. Document what occurred, what data was involved, which AI system
4. Assess impact and required remediation
5. Implement corrective actions
6. Update policy or training if systemic issue identified

**Post-Incident Review:**

- Root cause analysis within 5 business days
- Remediation plan documented and approved
- AI Review Board notified at next quarterly meeting
- Lessons learned incorporated into training

### 9.3 Monitoring and Audit

**Continuous Monitoring:**

- Google Workspace audit logs for Gemini usage
- GCP service account activity logs for Gemini CLI
- Access reviews for Claude and Z.ai accounts
- Cost tracking and anomaly detection
- Agent operation logs and error reports

**Quarterly Audits:**

- AI Review Board evaluates compliance posture
- Tool Register accuracy verification
- Access control review (appropriate role assignments)
- Training completion status check
- Incident pattern analysis

**Annual Review:**

- Full policy review and update
- Framework alignment verification (NIST, CIS, ISO, Colorado)
- Risk catalog completeness assessment
- Training program effectiveness evaluation
- Stakeholder feedback integration

### 9.4 Accountability Structures

**CTO:** Owns policy compliance, chairs AI Review Board, approves new AI tools, manages service accounts, escalation point for incidents.

**AI Review Board:** Provides multi-stakeholder oversight, reviews quarterly compliance reports, evaluates emerging risks, approves policy changes.

**All Personnel:** Responsible for understanding and following policy, reporting violations, maintaining data classification awareness, validating AI outputs.

**AI Agents:** Operate within bounded scope under human oversight, generate audit logs, escalate ambiguous situations, maintain data handling procedures.

**Applicable Controls:**

- NIST AI RMF GOVERN 3.2 - Accountability structures for AI deployment
- CIS 17.1 (Incident Response) - Security incident management
- ISO 31000 Clause 6.6 - Monitoring and review of risk controls

---

## 10. Success Factors

The successful implementation and ongoing adherence to responsible AI services usage at RadioAstronomy.io depends on several critical factors:

**Alignment with Mission:** AI usage practices must support our citizen science mission—publishing research, contributing to open source, and donating compute to students. AI accelerates these goals without compromising research integrity.

**Executive Support:** Visible and active support from CTO and organizational leadership is crucial for embedding responsible AI usage throughout operations, promoting accountability, and modeling appropriate behavior.

**Technical Competency:** All personnel—especially those working with Protected data—must understand AI capabilities, limitations, risks, and mitigation strategies. Mandatory training programs ensure baseline competency.

**Clear Boundaries:** Data classification framework provides unambiguous decision path for AI tool selection. No gray areas, no permission requests—just clear boundaries and appropriate tools.

**Effective Communication:** Transparent communication among leadership, technical staff, and AI Review Board ensures guidelines are understood, consistently applied, and regularly reinforced.

**Continuous Improvement:** Regular training, awareness campaigns, incident reviews, and quarterly AI Review Board meetings help personnel recognize and respond appropriately to AI-related risks.

**Community Engagement:** Active participation in astronomy and citizen science communities keeps RadioAstronomy.io aligned with best practices and emerging standards in responsible AI use for scientific research.

**Annual Policy Review:** Policy reviewed annually or when new AI models are added, framework requirements change, significant incidents occur, or operational experience suggests improvements.

---

## 11. Policy Maintenance

### 11.1 Review Cycle

This policy is reviewed **annually** or when:

- New AI models are added to the organizational stack
- Framework requirements change (CIS, NIST, Colorado law updates)
- Significant incidents reveal policy gaps
- Operational experience suggests improvements
- AI Review Board recommends policy updates

### 11.2 Review Authority

**Primary:** CTO with input from AI Review Board

**Contributors:** All personnel may suggest improvements based on operational experience

**Approval:** CTO approves policy changes; AI Review Board provides governance oversight

### 11.3 Version Control

**Version History:** Maintained in Git repository version control

**Changelog:** Documents changes, rationale, and effective dates

**Communication:** Policy updates communicated to all personnel via email and documented in training materials

---

## Questions and Clarifications

This policy establishes the operating model for AI usage at RadioAstronomy.io. Specific implementation questions should reference:

- **Data Classification Questions:** Section 4 (Data Classification Framework)
- **Model Selection Questions:** Section 5 (Role-Based AI Stack)
- **Role-Specific Questions:** Section 6 (Responsibilities by Role)
- **Risk Assessment Questions:** Section 7 (Risk Management and Impact)

**For architectural or strategic questions:** Escalate to CTO

**For day-to-day "which model should I use?" questions:** Follow the decision path in Section 5.1. If still unclear after reviewing Section 4 and Section 5, ask.

**For security incidents or policy violations:** Immediately notify CTO

**For policy suggestions or improvements:** Document and submit to CTO for AI Review Board consideration

---

## Appendix A: Framework Compliance Mapping

This appendix provides detailed mapping between this policy and the compliance frameworks RadioAstronomy.io voluntarily follows. For comprehensive control-level mappings including technical specifications and audit evidence, see individual risk scenarios in `/risk-scenarios/`.

### A.1 NIST AI Risk Management Framework (AI RMF 1.0)

**GOVERN Function:**

- **GOVERN 1.2** (Culture of Risk Management): Section 8.2 (Personal and Community Use), mandatory AI training requirements
- **GOVERN 1.3** (Processes and Procedures): Section 5 (Role-Based AI Stack), Section 9 (Enforcement), Section 7.1 (Risk Scenario Library)
- **GOVERN 1.4** (Organizational Policies): Section 7.1 (Risk treatment decisions), R08 (Legal & Compliance Gaps)
- **GOVERN 1.5** (Organizational Teams): Section 6 (Responsibilities by Role), Section 7.5 (AI Review Board)
- **GOVERN 1.6** (Workforce Diversity): Section 8.1 (Competency Requirements)
- **GOVERN 1.7** (AI-Related Policies): This entire policy document with supporting risk scenarios
- **GOVERN 2.2** (Transparency): Section 8.4 (Research Integrity), Section 8.5 (Transparency and Disclosure), R08
- **GOVERN 3.2** (Accountability): Section 9.4 (Accountability Structures), risk scenario residual acceptance
- **GOVERN 4.1** (Transparency and Documentation): Section 5 (Role-Based AI Stack model documentation), R07 (Hallucination controls)
- **GOVERN 5.1** (Organizational Policies): Section 5.5 (Z.ai third-party AI use boundaries), R05 (Supply Chain)

**MAP Function:**

- **MAP 1.1** (Context of Use): Section 4 (Data Classification Framework), Section 7.4 (Student Mission Risk)
- **MAP 1.2** (Categorization): Section 5 (Role-Based AI Stack categorization by purpose)
- **MAP 1.3** (Legal and Regulatory Requirements): R08 (Legal & Compliance Gaps), Colorado SB24-205 voluntary adoption
- **MAP 1.6** (AI Risk): Section 7.1 (Risk Scenario Library), Section 7.3 (Risk Treatment Decisions)
- **MAP 5.1** (Organizational Risk Tolerances): Section 7.3 (residual risk acceptance thresholds)

**MEASURE Function:**

- **MEASURE 2.3** (AI System Performance): Section 9.3 (Monitoring and Audit), R10 (Logging requirements)
- **MEASURE 2.7** (AI Security and Resilience): R01 (Data Egress), R02 (Secrets Leakage), R03 (Prompt Injection)
- **MEASURE 2.11** (Fairness): R07 (Hallucination controls include bias assessment)
- **MEASURE 4.2** (Transparency and Accountability): Section 8.5 (Transparency and Disclosure)

**MANAGE Function:**

- **MANAGE 1.1** (AI System Documentation): Section 5 (Role-Based AI Stack), AI Tool Register
- **MANAGE 2.2** (Incident Disclosure and Response): Section 9.2 (Incident Response), risk scenario response playbooks
- **MANAGE 2.3** (Monitoring): Section 9.3 (Monitoring and Audit), agent audit logs, R10
- **MANAGE 4.1** (System Testing): Risk scenario testing procedures, quarterly control effectiveness validation

### A.2 CIS Controls v8.1 (Implementation Group 1)

RadioAstronomy.io implements CIS Controls v8.1 baseline with AI-specific extensions. Detailed control implementations and evidence are documented in individual risk scenarios.

**Asset Management:**

- **CIS 1.1** (Establish Enterprise Asset Inventory): AI Tool Register maintained by CTO
- See R09 (Cost & Tool Sprawl) for detailed asset tracking procedures

**Data Protection:**

- **CIS 3.2** (Establish Data Inventory): Section 4 (Data Classification Framework)
- **CIS 3.3** (Configure Data Access Control Lists): R01 (DLP controls), R06 (Access reviews)
- **CIS 3.11** (Encrypt Sensitive Data): Section 4.1 (Secrets - Vault, never AI), R02 (Ansible Vault)
- **CIS 3.12** (Segment Data Processing): Section 4.2 (Protected data - local/isolated only), R01 (inside-perimeter AI)
- **CIS 9.2** (Data Loss Prevention): Section 4.3 (Public-Internal training opt-out), R01 (DLP implementation)

**Account Management:**

- **CIS 5.1** (Centralized Account Management): Section 5.2 (Gemini enterprise SSO), R06
- **CIS 5.3** (Disable Dormant Accounts): R06 (Identity & Access Drift), quarterly access reviews
- **CIS 5.4** (Restrict Administrator Privileges): R02 (Least-privilege service accounts), R06
- **CIS 6.1** (Centralized Secrets Management): Section 4.1 (Vault, GCP Secret Manager), R02
- **CIS 6.3** (Require MFA for Remote Access): Section 5.2 (Google Workspace MFA), R06
- **CIS 6.8** (Role-Based Access): Section 6 (Responsibilities by Role), Section 5.4 (CTO-only Claude), Section 5.5 (Engineer-only Z.ai), R06

**Audit Logging:**

- **CIS 8.2** (Collect Audit Logs): Section 5.2 (Gemini logs), Section 5.3 (Gemini CLI logs), R10
- **CIS 8.3** (Ensure Adequate Log Storage): R02 (Forensic log preservation), R10
- **CIS 8.5** (Collect Detailed Logs): Section 6.4 (AI agent audit logs), R10
- **CIS 8.11** (Conduct Audit Log Reviews): R01 (Session recording), R02 (Database access reviews), R10

**Network Security:**

- **CIS 12.2** (Network Segmentation): R01 (VLAN isolation), R02 (SSH bastion)
- **CIS 12.8** (Network Segmentation for Air-Gapped Systems): Section 5.6 (Local models), R01

**Security Awareness Training:**

- **CIS 14.1** (Establish Security Awareness Program): Section 8.1 (Competency Requirements)
- See R01 (Data classification training), R02 (Secrets hygiene training) for detailed curricula

**Application Security:**

- **CIS 16.8** (Perform Application Security Testing): R02 (Git secret scanning), R04 (PR review)

**Incident Response:**

- **CIS 17.1** (Incident Response Management): Section 9.2 (Incident Response), all risk scenario playbooks

**Third-Party Risk:**

- **CIS 15.3** (Manage Third-Party Service Providers): R01 (No-training clauses), R05 (Supply Chain)

### A.3 ISO 31000:2018 (Risk Management)

RadioAstronomy.io applies ISO 31000:2018 principles to AI risk management:

**Clause 5.4** (Leadership and Commitment):

- Section 7.5 (AI Review Board Governance)
- Section 10 (Success Factors - Executive Support)
- Risk scenario residual acceptance by ARO

**Clause 6.4** (Risk Treatment):

- Section 4 (Data Classification Framework as risk treatment architecture)
- Section 7.2 (Defense-in-Depth Architecture)
- R01 (Data egress mitigations), R02 (Secrets management)

**Clause 6.4.2** (Selection of Risk Treatment Options):

- Section 5 (Role-Based AI Stack as architectural risk treatment)
- Section 7.3 (Risk Treatment Decisions)
- Risk scenario treatment rationales

**Clause 6.5** (Risk Treatment Plan):

- Individual risk scenarios document implementation plans
- Section 9 (Enforcement) establishes accountability
- Quarterly Review Board meetings track progress

**Clause 6.6** (Monitoring and Review):

- Section 9.3 (Monitoring and Audit)
- Section 9.4 (Accountability Structures)
- Section 11.1 (Annual Review Cycle)
- Risk scenario re-assessment triggers

**Clause 7.2** (Communication and Consultation):

- Section 7.5 (AI Review Board multi-stakeholder governance)
- Section 8.5 (Transparency and Disclosure to external stakeholders)
- R08 (Legal & Compliance communication)

**Clause 7.4** (Recording and Reporting):

- AI Tool Register
- Risk scenario documentation
- Incident reports and lessons learned
- Quarterly Review Board meeting minutes

### A.4 Colorado SB24-205 (High-Risk AI Systems)

RadioAstronomy.io is **not legally required** to comply with Colorado SB24-205 (organizational size below threshold, AI systems do not make "consequential decisions" as defined). However, we **voluntarily adopt** requirements as best practice due to downstream impact on student researchers and published scientific datasets.

**§6-1-1703(2)(a)** (Impact Assessment):

- Section 1.3 (Voluntary High-Risk Posture)
- Section 7.4 (Student Mission Risk assessment)
- Risk scenario impact analyses document potential harms

**§6-1-1703(2)(b)** (Transparency):

- Section 4.3 (Public-Internal - training opt-out documented)
- Section 8.5 (Transparency and Disclosure)
- R05 (Supply Chain transparency)

**§6-1-1704(1)(a)** (Risk Management Program):

- Section 7 (Risk Management and Impact)
- Section 7.5 (AI Review Board)
- Risk scenario library with treatment decisions

**§6-1-1704(2)(a)** (Training Data Practices):

- Section 5.5 (Z.ai - training disclosed and bounded)
- Section 8.5 (Public accountability)
- R05 (Vendor data handling assessment)

**§6-1-1704(3)** (Training Requirements):

- Section 8.1 (Competency Requirements - mandatory training)
- Risk scenario-specific training (R01 classification, R02 secrets hygiene)

**§6-1-1706** (Consumer Transparency):

- Section 8.3 (Student Mission Support - transparency with students)
- Section 8.4 (Research Integrity - disclosure in publications)
- Section 7.4 (Student-facing transparency requirements)

**§6-1-1707** (Notice of Consequential Decision):

- Not applicable (infrastructure orchestration is not a consequential decision)
- However, if AI were used for student compute allocation decisions, notification requirements would apply

### A.5 Cross-Framework Integration

RadioAstronomy.io's compliance architecture is designed to satisfy multiple frameworks simultaneously through unified control implementation:

| Policy Section | NIST AI RMF | CIS Controls | ISO 31000 | Colorado SB24-205 |
|----------------|-------------|--------------|-----------|-------------------|
| Data Classification (§4) | MAP 1.1, GOVERN 1.4 | CIS 3.2, 3.3, 3.11, 3.12 | Clause 6.4 | §6-1-1704(1)(a) |
| Role-Based Stack (§5) | GOVERN 1.5, MAP 1.2 | CIS 5.1, 6.8 | Clause 6.4.2 | §6-1-1703(2)(b) |
| Responsibilities (§6) | GOVERN 1.5 | CIS 6.1, 6.8 | Clause 5.4 | §6-1-1704(3) |
| Risk Management (§7) | MAP 1.6, MEASURE 2.3 | CIS 17.1 | Clause 6.6 | §6-1-1703(2)(a) |
| Training (§8.1) | GOVERN 1.6 | CIS 14.1 | N/A | §6-1-1704(3) |
| Transparency (§8.5) | GOVERN 2.2, MEASURE 4.2 | CIS 8.2, 8.5 | Clause 7.2 | §6-1-1706 |
| Enforcement (§9) | GOVERN 3.2, MANAGE 2.2 | CIS 17.1 | Clause 6.6 | §6-1-1704(1)(a) |

**Risk Scenario Framework Mappings:**

Each risk scenario (R01-R10) contains detailed framework mappings at the control level, including:

- Specific NIST AI RMF subcategories with implementation evidence
- CIS Control numbers with technical specifications
- ISO 31000 clause references with risk treatment justifications
- Colorado SB24-205 section alignment where applicable

**Example Multi-Framework Control:**

**DLP for Protected Data (R01):**

- **NIST AI RMF:** MEASURE 2.7 (AI system security practices documented)
- **CIS Controls:** CIS 9.2 (Data Loss Prevention on enterprise platforms)
- **ISO 31000:** Clause 6.4 (Risk treatment via technical controls)
- **Colorado SB24-205:** §6-1-1704(1)(a) (Risk management program)

This multi-framework approach ensures RadioAstronomy.io maintains comprehensive compliance posture appropriate to our voluntary high-risk AI deployment stance while avoiding duplicative control implementation. A single control implementation satisfies multiple framework requirements simultaneously.

### A.6 Framework Maintenance

**Review Cycle:** Annual review of framework mappings, or sooner if:

- Framework updated (e.g., NIST AI RMF 2.0 released)
- New regulatory requirements emerge
- Material changes to AI stack or usage patterns
- Audit findings identify mapping gaps

**Responsibility:** AI Review Board conducts framework alignment review as part of quarterly meetings, with comprehensive annual assessment led by CTO.

**Documentation:** Framework mapping updates documented in:

- This Appendix A (policy-level mappings)
- Individual risk scenarios (control-level mappings)
- AI Review Board meeting minutes (alignment verification)
