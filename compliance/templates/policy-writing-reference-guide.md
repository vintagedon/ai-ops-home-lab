# Policy Writing Reference Guide

## Proxmox Astronomy Lab - SMB/SME Security Framework

Version: 1.0  
Date: 2025-10-23  
Purpose: Quick reference for writing policies aligned with organizational structure, compliance frameworks, and AI agent operations

---

## 1. Policy Writing Checklist

Use this checklist when creating or reviewing any organizational policy:

- [ ] Role-based language - References roles (Helpdesk, Ops, Engineering, Security, Executive, AIOps), never individual names
- [ ] 6-column RACI matrix - Clear responsibility assignment using standard organizational roles
- [ ] CIS Controls v8 mapping - Identifies which controls this policy directly implements
- [ ] AI governance alignment - Addresses NIST AI RMF and Colorado AI Act principles if AI-related
- [ ] Data classification - Specifies handling requirements for Public vs. Protected data
- [ ] AI access boundaries - Defines which AI tools can access which data types
- [ ] Agent operations scope - Clarifies agent vs. human responsibilities and approval requirements
- [ ] Approval workflow - References GitOps process via Gitea for infrastructure changes
- [ ] Audit trail requirements - Ensures logging and evidence collection for compliance

---

## 2. Standard Organizational Roles

Role-Based Structure: Map to roles, not people. One person may hold multiple roles.

| Role | Tier/Function | Primary Responsibilities | Authority Level |
|----------|-------------------|------------------------------|---------------------|
| Helpdesk | Tier 1 Support | User support, ticket triage, basic troubleshooting, incident logging | Limited system access |
| Ops | Tier 2 Operations | System administration, routine maintenance, database operations, monitoring | Standard administrative access |
| Engineering | Tier 3 Engineering | Architecture, infrastructure design, complex problem resolution, automation development | Full administrative access |
| Security | Cross-Cutting | Security monitoring, compliance validation, policy enforcement, incident response | Security-focused access |
| Executive | Strategic Leadership | Policy approval, budget decisions, strategic direction, external relationships | Business authority |
| AIOps | AI Agent Operations | Automated analysis, playbook generation, compliance monitoring, recommendations | Read-only + approved automation |

6-Column RACI Standard:

```markdown
| Activity | Helpdesk | Ops | Engineering | Security | Executive | AIOps |
|----------|----------|-----|-------------|----------|-----------|-------|
```

RACI Definitions:

- R (Responsible): Does the work
- A (Accountable): Ultimately answerable, approves work
- C (Consulted): Provides input before decisions/actions
- I (Informed): Kept updated on progress/decisions

AIOps RACI Notation:

- A: Automated execution with required human approval via GitOps
- R: Agent directly performs analysis/work (read-only operations)
- C: Agent provides recommendations or analysis for human decisions
- I: Agent receives notifications or logs for context

---

## 3. Compliance Framework

SMB/SME Positioning: Enterprise-grade security without enterprise-grade overhead

### Primary Frameworks

CIS Controls v8 (Baseline Security)

- Implementation Group 2 (IG2) target for SMB/SME scale
- Map policies to specific controls only when directly implementing
- Focus on practical implementation over documentation burden
- Will exceed baseline through business-grade tooling

NIST AI Risk Management Framework (AI/ML Governance)

- Applies to all AI agent operations and ML workloads
- Governs agents01 orchestration hub operations
- Addresses autonomous decision-making boundaries
- Ensures human oversight for critical operations

Colorado Artificial Intelligence Act (Proactive AI Governance)

- Voluntary adoption as good security practice
- Applicable even outside Colorado jurisdiction
- Focuses on transparency, accountability, bias mitigation
- Aligns with responsible AI operations principles

### Policy Compliance Requirements

Every policy must:

1. Identify which CIS Controls it implements (if applicable)
2. State AI RMF alignment for AI-related policies
3. Reference Colorado AI Act principles for agent operations

Policies do NOT need:

- ❌ NIST CSF 2.0 mapping (too heavy for SMB/SME)
- ❌ NIST SP 800-171 compliance (federal contractor requirements)
- ❌ ISO 27001 certification language (expensive overhead)
- ❌ SOC2 audit frameworks (unless pursuing certification)

---

## 4. Data Classification Framework

Two-Tier Model: Simple, practical classification for SMB/SME operations

### Public Domain Data

Definition: Information already published or intended for public release

Examples:

- DESI DR1 datasets and public astronomical data
- Published research papers and methods
- Open-source code and documentation
- Public-facing infrastructure architecture diagrams
- Website content and marketing materials

AI Access: Any AI tool acceptable (no restrictions)

Storage: Standard security controls, no special handling

Sharing: Unrestricted, follows open science principles

---

### Protected Data

Definition: Information requiring confidentiality until publication or indefinitely

Examples:

- Unpublished research in progress and preliminary results
- Proprietary analysis methods and algorithms
- Pre-publication datasets and intermediate analysis outputs
- Infrastructure configurations with security implications
- Access logs and audit trails
- Team communications and strategic planning documents
- System performance metrics with operational insights
- Ansible playbooks and automation workflows (pre-review)
- Client/partner information and agreements
- Financial records and budget information
- Personnel records and performance data

AI Access: Inside perimeter only (see Section 5)

Storage: Encrypted at rest, access-controlled

Sharing: Requires authorization, audit trail

---

### Credentials & Secrets

Definition: Authentication tokens, passwords, API keys, certificates

Examples:

- Service account credentials
- API keys and access tokens
- SSH private keys
- Database passwords
- Encryption keys
- SSL/TLS certificates

AI Access: ❌ NO AI tool access under any circumstances

Storage: Bitwarden Teams (cloud) + on-premises secrets management

Handling: Programmatic access only, never committed to git, regular rotation

---

## 5. AI Access Boundaries

"Inside the Perimeter" Concept: Secure AI workspace for Protected data

### Inside Perimeter (Protected Data Safe)

Approved AI Tools:

- ChatGPT Business/Enterprise (training disabled on organizational data)
- Google Workspace Enterprise (Gemini Pro with no-training policy)
- Claude Pro/Team (training disabled, API usage with privacy controls)
- Local models via Ollama on gpu01 (on-premises, no external data exposure)
- agents01 AI agents (read-only access to Protected data, execution via approved workflows)

Use Cases:

- Code development and debugging
- Research analysis and documentation
- Infrastructure automation development
- Compliance analysis and reporting

Requirements:

- Business/Enterprise plans with no-training guarantees
- API access with privacy controls enabled
- Audit logging of AI interactions
- Human review of AI-generated infrastructure changes

---

### Outside Perimeter (Public Data Only)

Examples:

- Free-tier AI services without privacy guarantees
- Consumer AI products with training enabled
- Third-party AI services without contracts
- AI tools without audit capabilities

Use Cases:

- Public dataset exploration
- Published research summarization
- Open-source code analysis
- General knowledge queries

Restrictions:

- ❌ No Protected data
- ❌ No credentials or secrets
- ❌ No unpublished research
- ❌ No infrastructure details

---

### No AI Access (Credentials & Secrets)

Strict Prohibition:

- Passwords, API keys, tokens never provided to any AI tool
- Secrets management via Bitwarden Teams and on-premises solution
- Programmatic access only through approved secret stores
- Manual handling when absolutely necessary with immediate rotation

---

### AI Access Decision Tree

```markdown
Is the data published or intended for public release?
├─ YES → Any AI tool acceptable
└─ NO → Is it credentials/secrets?
    ├─ YES → ❌ NO AI tool access (use secrets management)
    └─ NO → Protected data, inside perimeter only
```

---

## 6. Agent Operations Framework

Core Principle: Agents propose, humans approve. Agents analyze, humans decide.

### Three-Tier Agent Authority Model

Tier 1: Read-Only Access (No Approval Required)

- VM-level functions, metrics, logs
- Database queries (SELECT only)
- Compliance data exports
- Observability data from mon01 and agents01
- Configuration file reading

Examples:

- Daily compliance scan analysis
- Log aggregation and pattern detection
- Performance metric analysis
- Infrastructure inventory queries

---

Tier 2: Approved Idempotent Operations (Human Approval Required)

- Vetted scripts and processes (idempotent)
- Ansible playbooks via GitOps (Gitea PR approval)
- Automation workflows (windmill-dev, n8n)
- Infrastructure changes (version-controlled)

Approval Process:

1. Agent generates playbook/automation
2. Creates Gitea pull request
3. Human reviews changes
4. Human approves/rejects PR
5. Approved changes executed via Semaphore

Examples:

- System configuration updates
- Patch deployment procedures
- Backup validation workflows
- Compliance remediation playbooks

---

Tier 3: Defined Autonomy with Isolation (Copy Access, No Approval)

- Read-write access to data COPIES only
- Analysis on isolated datasets
- No production system modification
- Bounded operational scope

Examples:

- agents01 14-day log analysis (separate from mon01 90-day compliance logs)
- Experimental data transformations
- ML model training on dataset copies
- Compliance report generation

---

### Agent Operations Standards for Policy Writing

Policies addressing agent operations must specify:

1. Access Scope:
   - What data/systems can agents access?
   - Read-only vs. read-write permissions
   - Production vs. copy access

2. Approval Requirements:
   - Which operations require human approval?
   - Who can approve (which roles)?
   - What's the approval workflow (GitOps via Gitea)?

3. Audit Trail:
   - What agent actions are logged?
   - Where are logs stored (mon01 vs. agents01)?
   - Retention requirements (14-day vs. 90-day)?

4. Human Oversight:
   - Which decisions remain human-only?
   - Escalation procedures for agent failures
   - Override mechanisms for agent recommendations

5. Failure Handling:
   - What happens if agent operations fail?
   - Rollback procedures
   - Notification requirements

---

## 7. Policy Template Quick Start

### Standard Policy Sections

Required Sections:

1. Purpose & Scope - What this policy governs and why
2. Policy Statement - The actual requirements and rules
3. Roles & Responsibilities - 6-column RACI matrix
4. Compliance Mapping - CIS Controls, AI RMF, Colorado AI Act alignment
5. Implementation - How policy is operationalized
6. Monitoring & Enforcement - How compliance is verified
7. Exceptions Process - How to request policy exceptions
8. Review Cycle - When policy is reviewed/updated

### RACI Placement

Place RACI matrix in Section 3 (Roles & Responsibilities)

Shows who does what for policy implementation and enforcement

### CIS Controls Mapping Placement

Place in Section 4 (Compliance Mapping)

Use table format:

```markdown
| CIS Control | Implementation | Evidence | Status |
|-------------|----------------|----------|--------|
| CIS.X.Y | How this policy implements control | Where evidence lives | Compliant/Partial/Planned |
```

### AI RMF Alignment Placement

Place in Section 4 (Compliance Mapping) alongside CIS Controls

For AI-related policies, reference specific AI RMF functions:

- GOVERN - Policies, oversight, accountability
- MAP - Context, risk identification
- MEASURE - Metrics, testing, validation
- MANAGE - Response, recovery, communication

---

## 8. Common Policy Patterns

### Infrastructure Policies

- Focus on technical controls and configurations
- Heavy RACI focus on Ops and Engineering roles
- Map to CIS Controls (especially Controls 1-8)
- Address agent automation boundaries

### Data Policies

- Focus on classification and handling requirements
- Define AI access boundaries clearly
- Map to CIS Controls 3 (Data Protection) and 13 (Network Monitoring)
- Specify encryption and access control requirements

### AI Operations Policies

- Focus on agent authority and human oversight
- Strong alignment with NIST AI RMF and Colorado AI Act
- Clear approval workflows via GitOps
- Audit trail and transparency requirements

### Security Policies

- Focus on threat mitigation and incident response
- Map to CIS Controls 5 (Account Management), 6 (Access Control), 17 (Incident Response)
- Define security monitoring requirements
- Establish escalation procedures

---

## 9. Policy Writing Tips

### Use Role-Based Language

✅ Good: "Engineering is responsible for infrastructure changes"  
❌ Bad: "crainbramp is responsible for infrastructure changes"

✅ Good: "AIOps generates playbooks for Ops approval"  
❌ Bad: "Claude generates playbooks for alex to approve"

### Be Specific About AI Boundaries

✅ Good: "Unpublished research may be analyzed using inside-perimeter AI tools (ChatGPT Business, Workspace Enterprise, Claude with training disabled)"  
❌ Bad: "Use approved AI tools for research"

### Define Agent Authority Clearly

✅ Good: "Agents have read-only access to compliance exports. Configuration changes require ansible playbook generation, Gitea PR approval by Engineering, and execution via Semaphore"  
❌ Bad: "Agents can help with compliance and make needed changes"

### Map Controls When Directly Implementing

✅ Good: Map Access Control Policy to CIS Control 6 (Account Management)  
❌ Bad: Map every policy to every tangentially related control

### Keep SMB/SME Perspective

✅ Good: "This policy implements CIS Control 5.1 through Google Workspace Enterprise centralized authentication"  
❌ Bad: "This policy implements NIST SP 800-171 3.5.1, ISO 27001 A.9.2.1, SOC2 CC6.1, and CIS Control 5.1 through enterprise identity federation with SAML 2.0 and OAuth 2.0 protocols..."

---

## 10. Quick Reference Tables

### Data Classification Decision Matrix

| Data Type | Classification | AI Access | Storage | Example |
|-----------|---------------|-----------|---------|---------|
| Published research | Public | Any tool | Standard | DESI DR1 analysis papers |
| Pre-publication data | Protected | Inside perimeter | Encrypted | Ongoing void galaxy study |
| Analysis scripts | Protected | Inside perimeter | Encrypted + git | Proprietary algorithms |
| API keys | Credentials | ❌ No AI | Secrets manager | Service authentication |
| Infrastructure configs | Protected | Inside perimeter | Encrypted + git | Ansible playbooks |
| System logs | Protected | Inside perimeter | Encrypted | Audit trails |

### Agent Operations Authority Matrix

| Operation Type | Agent Access | Approval Required | Example |
|---------------|--------------|-------------------|---------|
| Read metrics/logs | Read-only | No | Compliance scan analysis |
| Query databases | SELECT only | No | Performance monitoring |
| Generate playbook | N/A (creation) | Yes (execution) | Patch deployment automation |
| Execute vetted script | Execute via approval | Yes | Backup validation |
| Modify production | ❌ Not allowed | N/A | Direct database changes |
| Analyze data copy | Read-write (copy) | No | 14-day logs on agents01 |

### CIS Controls Quick Reference

Most Common Controls for Policies:

- CIS Control 1: Inventory and Control of Enterprise Assets
- CIS Control 2: Inventory and Control of Software Assets
- CIS Control 3: Data Protection
- CIS Control 4: Secure Configuration of Enterprise Assets and Software
- CIS Control 5: Account Management
- CIS Control 6: Access Control Management
- CIS Control 8: Audit Log Management
- CIS Control 10: Malware Defenses
- CIS Control 12: Network Infrastructure Management
- CIS Control 17: Incident Response Management

Full CIS Controls v8 documentation: <https://www.cisecurity.org/controls/v8>

---

## Summary

Policy writing for Proxmox Astronomy Lab follows these principles:

1. Role-based, not person-based - Policies reference organizational roles
2. SMB/SME scale - Practical security without enterprise overhead
3. CIS + AI RMF foundation - Focused compliance frameworks
4. Data classification simplicity - Public, Protected, Credentials
5. AI boundaries clarity - Inside perimeter, outside perimeter, no access
6. Agent operations transparency - Read-only, approved automation, isolated copies
7. GitOps workflow - Human approval for infrastructure changes
8. Audit trail requirements - Logging and evidence collection

When in doubt: Keep it simple, keep it practical, keep it role-based, and ensure humans remain in control of critical decisions.

---

Document Information:

- Author: VintageDon (<https://github.com/vintagedon>)
- Version: 1.0
- Last Updated: 2025-10-23
- Review Cycle: Quarterly or when major organizational/technical changes occur
- Repository: <https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab>
