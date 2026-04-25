# AI Acceptable Use Policy

**Document ID:** AUP-AI-001  
**Version:** 2.0  
**Effective Date:** 2025-01-27  
**Owner:** CTO  
**Scope:** All personnel, contractors, and systems within RadioAstronomy.io

---

## I. Operating Context: AI-Native Infrastructure

RadioAstronomy.io operates as an AI-native organization. AI assistance and automation are embedded in our work fabric—from cluster orchestration to research documentation to community contributions.

**What this means in practice:**

- Our Proxmox astronomy cluster automates operations using AI-driven tooling
- We donate compute time to astronomy students, supported by AI-automated infrastructure
- We publish datasets and research that get cited in scientific literature
- We contribute to open-source astronomy tools and citizen science projects

This policy explains how we work within this model and why specific boundaries exist.

---

## II. Why We Operate as High-Risk

We voluntarily adopt high-risk AI deployment practices even though we're not legally required to do so.

**The reason is simple:** our downstream impact exceeds our organizational size. Published datasets get cited. Errors propagate through scientific literature. Automated infrastructure decisions affect student researchers. Open-source contributions influence how others build systems.

**This shapes our compliance approach:**

We follow **Colorado SB24-205** requirements voluntarily (impact assessments, transparency disclosures, algorithmic management standards). We operate within **CIS Controls v8.1 IG1** for baseline cybersecurity. We align with **NIST AI RMF 1.0** for risk management and **ISO 31000:2018** for risk practices.

The frameworks aren't the goal—they're the scaffolding that keeps high-impact work disciplined. Details live in our governance policies ([AI Governance Policy](01-ai-governance-policy.md), [AI Risk Assessment Standard](02-ai-risk-assessment-standard.md), [Secure AI Systems Standard](03-secure-ai-systems-standard.md), [AI Transparency & Disclosure Standard](04-ai-transparency-disclosure-standard.md)).

---

## III. The Role-Based Stack: Architecture as Boundary

We don't manage AI use through permissions. We manage it through **architecture**.

Every model in our stack serves a specific purpose, tied to data classification and consequence. Using the right model for the right work is how the compliance story holds together.

**The decision path:**

1. **What's the data class?**  
   Secrets → never AI | Protected → local only | Public-Internal → Gemini/Claude | Public-External → Z.ai allowed

2. **Is this autonomous automation?**  
   Yes → Gemini CLI with service account RBAC

3. **Is this governance-grade output?**  
   Yes → Claude (CTO editorial review)

No permission requests. No "can I use AI for this?" questions. Know your data class, use the appropriate model, document where it matters.

**Constraining controls:**  
- **CIS 3.3** (Data Protection) - Classification drives tool access
- **CIS 6.8** (Access Control) - RBAC on automation, role-based model access
- **NIST AI RMF GOVERN 1.5** - Roles and responsibilities for AI deployment

---

## IV. Competency Requirements

All personnel complete [Introduction to Generative AI](https://www.coursera.org/learn/introduction-to-ai) within 90 days of hire.

Anyone working with Protected data completes [IBM AI Foundations for Business Specialization](https://www.coursera.org/specializations/ibm-ai-foundations-for-business) within 6 months.

Both courses are free. We also provide one paid course of your choice per year and reimburse one certification annually (conditional on passing).

**Why this exists:**  
High-risk deployment requires informed operators. Understanding how models work, where they fail, and what constitutes "hallucination" isn't academic—it's the baseline for making decisions that affect scientific outputs and student researchers.

**Constraining controls:**  
- **NIST AI RMF GOVERN 2.2** - Workforce diversity, equity, inclusion, and accessibility
- **CIS 14.1** (Security Awareness Training) - AI-specific competency as security control
- **Colorado SB24-205 §6-1-1704(3)** - Training requirements for high-risk AI system developers/deployers

---

## V. Data Classification: The Four Categories

Our data classification defines what goes where. Every interaction with AI starts here.

### Secrets (Never AI)

Credentials, API keys, tokens, passwords, PII, PHI, SSH keys, TLS certificates, encryption keys.

**Boundary:** Never input Secrets into any AI model. Use secrets management (Vault, GCP Secret Manager) and credential rotation instead.

**Constraining controls:**  
- **CIS 3.11** (Data Protection) - Encrypt sensitive data at rest
- **CIS 6.1** (Access Control) - Centralized secrets management
- **NIST AI RMF MAP 1.1** - Context of use includes sensitive data handling

### Protected (Local or CTO-Isolated Only)

Draft research before publication, proprietary algorithms, student research data before release, internal security assessments, pre-decision governance drafts.

**Boundary:** Process on local models (e.g., Llama-3-7B on A4000 GPU) or via CTO-isolated Claude workspace. Cloud models (Gemini, Z.ai) cannot access Protected data.

**Constraining controls:**  
- **CIS 3.12** (Data Protection) - Segment data processing by classification
- **NIST AI RMF GOVERN 1.6** - Policies for third-party risk (cloud model vendors)
- **ISO 31000 Clause 6.4** - Risk treatment via architectural isolation

### Public-Internal (Gemini/Claude, Training Opt-Out)

Our internal code repositories, documentation, runbooks, published research/datasets (post-release), operational logs, architecture diagrams.

**Boundary:** Use Gemini Pro 2.5 (enterprise SSO, training opt-out enforced) or Claude (CTO for high-stakes work). This is "our IP, but not secret"—appropriate for enterprise models with data protection agreements.

**Constraining controls:**  
- **CIS 9.2** (Data Protection) - Data loss prevention on enterprise platforms
- **NIST AI RMF GOVERN 1.7** - Transparency in AI operations (training opt-out documented)
- **Colorado SB24-205 §6-1-1703(2)(b)** - Transparency re: training data practices

### Public-External (Z.ai Allowed, Engineer Role Only)

Forked OSS repositories we don't control, community contributions, public datasets bound for publication, upstream PRs.

**Boundary:** Z.ai is permitted for Public-External work only. Engineer role required. Internal repositories (even if public) remain Public-Internal (use Gemini/Claude).

**Constraining controls:**  
- **CIS 6.8** (Access Control) - Role-based access to tools
- **NIST AI RMF GOVERN 5.1** - Organizational policies for third-party AI use
- **ISO 31000 Clause 6.4.2** - Risk treatment via scope boundaries

---

## VI. Stack Roles: What Each Model Does and Why

### Gemini Pro 2.5 (Everyone)

**Purpose:** The daily work fabric. Embedded in Google Workspace (Docs, Drive, Gmail, Meet, AI Studio), so AI assistance is the default mode of operation.

**What it's for:**  
Day-to-day chat, drafting, research, analysis. Workspace-native tasks (summaries, meeting notes, doc linting, inbox triage). Code assistance for internal work without exposing Protected data.

**Why this model:**  
Enterprise SSO, MFA, audit logging, training opt-out. Satisfies CIS IG1 identity and data protection controls. No personal accounts, centralized admin, organizational visibility.

**Constraining controls:**  
- **CIS 5.1** (Account Management) - Enterprise identity integration
- **CIS 8.2** (Audit Logging) - Workspace audit logs for AI interactions
- **NIST AI RMF GOVERN 4.1** - Accountability through technical monitoring

### Gemini CLI (Automation Agent)

**Purpose:** Autonomous operations at scale. Converts governance into executable automation.

**What it's for:**  
Scheduled research briefs, ops reports, repo hygiene, document linting, evidence packaging. GCP control via RBAC service accounts (least privilege), scripted runbooks in CI/cron/N8N/Ansible.

**Why this model:**  
High throughput (120 req/min), enterprise authN/Z, auditable API calls. Service accounts enforce least privilege. Automation under organizational identity, not personal accounts.

**Constraining controls:**  
- **CIS 5.4** (Account Management) - Service accounts with least privilege
- **CIS 6.1** (Access Control) - RBAC on automation
- **NIST AI RMF MANAGE 4.1** - Monitoring AI system behavior in production

### Claude (CTO Only)

**Purpose:** Editorial quality gate for governance-grade outputs.

**What it's for:**  
Final polish on policies, standards, board-facing docs. Complex reasoning where clarity matters. Protected data processing via isolated workspace when necessary.

**Why this model:**  
Consistently produces governance-grade prose. Limited access maintains cost discipline and reduces risk surface. CTO isolation for Protected data processing.

**Constraining controls:**  
- **CIS 6.8** (Access Control) - Role-limited access (CTO only)
- **NIST AI RMF GOVERN 1.3** - Accountability for AI governance decisions
- **ISO 31000 Clause 5.4.3** - Decision-making includes quality review

### Z.ai (Engineer Role Only)

**Purpose:** Public code workhorse for community contributions.

**What it's for:**  
Reviewing PRs on external repos we don't control. Prototyping on public datasets bound for publication. Generating tests for upstream contributions.

**Why this model:**  
It trains on submitted data, which is unacceptable for our internal code but perfect for Public-External work (community OSS, forks, public prototypes). Accelerates citizen-science coding without risking our IP.

**Boundary enforcement:** Engineer-role only. Strictly Public-External. Our repositories (Public-Internal) and any Protected content stay with Gemini/Claude/local.

**Constraining controls:**  
- **CIS 6.8** (Access Control) - Role-based tool access
- **NIST AI RMF GOVERN 5.1** - Third-party AI use policies
- **Colorado SB24-205 §6-1-1704(2)(a)** - Training data practices disclosed

### Local Models (Llama-3-7B on A4000)

**Purpose:** Privacy and edge processing for Protected data.

**What they're for:**  
Sensitive linting/refactoring on configs/datasets. Air-gapped experiments. Offline analysis where latency and privacy trump model power. Fallback during vendor outages.

**Why local:**  
Architectural certainty. Air-gap enforcement, zero egress, physical/network isolation. Clean compliance story for Protected data processing.

**Constraining controls:**  
- **CIS 3.12** (Data Protection) - Segmented processing by classification
- **CIS 12.8** (Network Security) - Air-gapped environments for sensitive processing
- **NIST AI RMF GOVERN 1.6** - Third-party risk eliminated via local deployment

---

## VII. Personal and Community Use

We encourage AI use for personal projects, open-source contributions, and citizen science work.

**What's permitted:**  
Full use of Gemini (personal account or enterprise account for personal projects) for learning, experimentation, community contributions, and non-organizational work.

**What's expected:**  
Awareness of data classification. Don't mix organizational Secrets or Protected data into personal projects. Public-Internal and Public-External boundaries still apply when representing the organization.

**Why this matters:**  
We're building the future of AI-assisted scientific computing. Experimentation and community contribution are part of the mission. Learning happens through doing.

**Constraining controls:**  
- **CIS 3.3** (Data Protection) - Classification awareness extends to personal use
- **NIST AI RMF GOVERN 1.2** - Culture of AI responsibility includes personal conduct
- **Colorado SB24-205 §6-1-1704(1)(a)** - Risk management extends to organizational reputation

---

## VIII. Student Mission Support

We donate cluster compute time to astronomy students. AI doesn't touch their research directly, but it automates the infrastructure that serves them.

**What this looks like:**  
Cluster orchestration, job scheduling, resource allocation, monitoring—all AI-assisted. Students interact with traditional astronomy tools. AI operates behind the scenes to keep infrastructure reliable and cost-efficient.

**Why automation matters here:**  
Students need consistent, predictable access. Manual operations don't scale. AI-driven automation lets us provide enterprise-grade reliability at citizen-science cost.

**Constraining controls:**  
- **NIST AI RMF MANAGE 1.1** - Documenting AI system use and impact
- **CIS 8.2** (Audit Logging) - Infrastructure automation logged and monitored
- **Colorado SB24-205 §6-1-1703(2)(a)** - Transparency about AI use in services

---

## IX. Compliance Architecture

The role-based stack isn't just efficient—it's how we enforce boundaries.

**How this works:**

- **Data classification** maps to **model access** (Secrets → no AI, Protected → local, Public-Internal → Gemini/Claude, Public-External → Z.ai)
- **Enterprise identity** (Workspace SSO, MFA) ensures **auditability** and **accountability**
- **Service account RBAC** on Gemini CLI enforces **least privilege** for automation
- **Role-based model access** (CTO-only Claude, Engineer-only Z.ai) provides **separation of duties**
- **Training opt-out** on Public-Internal models protects **organizational IP**
- **Local models** provide **architectural air-gap** for Protected data

This isn't permission theater. The stack design *is* the control implementation.

**Framework alignment summary:**

| Framework | Key Controls | How We Implement |
|-----------|-------------|------------------|
| **CIS v8.1 IG1** | Identity, Access, Data Protection, Audit | Workspace SSO, RBAC, classification-driven access, audit logs |
| **NIST AI RMF 1.0** | Govern, Map, Measure, Manage | Policies define governance, data classes map risk, monitoring via logs, automation manages operations |
| **ISO 31000:2018** | Risk identification, treatment, monitoring | Data classification, architectural isolation, continuous logging |
| **Colorado SB24-205** | Impact assessment, transparency, training | Voluntary high-risk posture, public disclosures, mandatory training |

**Detail documentation:**  
See [AI Governance Policy](01-ai-governance-policy.md) for organizational structure and authorities.  
See [AI Risk Assessment Standard](02-ai-risk-assessment-standard.md) for risk evaluation methodology.  
See [Secure AI Systems Standard](03-secure-ai-systems-standard.md) for technical security controls.  
See [AI Transparency & Disclosure Standard](04-ai-transparency-disclosure-standard.md) for public accountability practices.

---

## X. Enforcement and Accountability

Violations of this policy are handled through standard HR processes. The focus is on **systemic failure prevention**, not individual punishment.

**What this looks like:**

- First violation: Coaching and retraining (assumed to be competency gap)
- Pattern of violations: Performance management process
- Intentional policy bypass: Immediate escalation to CTO and CEO

**Why this approach:**  
Most policy violations come from unclear boundaries or insufficient training, not malicious intent. Our job is to make the boundaries clear and provide the tools to operate within them.

**Constraining controls:**  
- **NIST AI RMF GOVERN 3.2** - Accountability structures for AI deployment
- **CIS 17.1** (Incident Response) - Security incident management
- **ISO 31000 Clause 6.6** - Monitoring and review of risk controls

---

## XI. Policy Maintenance

This policy is reviewed annually or when:

- New AI models are added to the stack
- Framework requirements change (CIS, NIST, Colorado law updates)
- Significant incidents reveal policy gaps
- Operational experience suggests improvements

**Review authority:** CTO with input from all personnel.

**Version history and changelogs:** Maintained in repository version control.

---

## Questions and Clarifications

This policy establishes the operating model. Specific implementation questions should reference the detailed standards and policies linked throughout.

For architectural or strategic questions, escalate to the CTO.

For day-to-day "which model should I use?" questions, start with Section V (Data Classification) and Section VI (Stack Roles). If still unclear after reading both, ask.

---

**End of Policy**
