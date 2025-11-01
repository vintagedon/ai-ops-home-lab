<!--
---
title: "[SOP Title]"
description: "Brief, actionable description of what this procedure accomplishes and when to execute it"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "[Full AI Model Name/Version]"
date: "YYYY-MM-DD"
version: "X.Y"
status: "[Draft/In-Review/Published/Archived]"
tags:
- type: sop
- domain: [infrastructure/kubernetes/security/ai-ops/database/etc]
- tech: [rke2/postgresql/prometheus/ansible/etc]
- automation: [manual/semi-automated/fully-automated]
- phase: [phase-0/phase-1/phase-2/phase-3/phase-4]
related_documents:
- "[Related SOP 1](path/to/sop.md)"
- "[Related Policy](../../security/policies/policy-name.md)"
- "[Related Guide](path/to/guide.md)"
---
-->

# 📋 [SOP Title]

This SOP provides [brief overview of what this procedure accomplishes]. It defines the systematic process for [primary operational objective], ensuring [key outcome] across the Proxmox Astronomy Lab platform.

# 🎯 1. Introduction

This section establishes the foundational context for this standard operating procedure, defining its purpose, boundaries, intended users, and relationship to the broader enterprise astronomical computing operations.

## 1.1 Purpose

This subsection clearly articulates what this SOP accomplishes and what operational value it delivers to the platform.

[2-3 sentences explaining the SOP's purpose, the operational problem it addresses, and the value it provides. Focus on outcomes and why this procedure is necessary.]

## 1.2 Scope

This subsection defines the precise boundaries of what this SOP covers and explicitly states what falls outside its operational scope.

| In Scope | Out of Scope |
|--------------|------------------|
| [Specific operational activities covered] | [Specific activities NOT covered] |
| [Systems/components affected] | [Systems/components handled elsewhere] |
| [Execution conditions] | [Out-of-scope conditions] |

[1-2 sentences explaining why these scope boundaries are important and where related procedures are documented.]

## 1.3 Target Audience

This subsection identifies who executes this SOP, their expected technical background, and required access levels.

Primary Audience: [Primary executors and their roles - who regularly runs this procedure]  
Secondary Audience: [Secondary users and their roles - who might execute occasionally]  
Required Background: [Expected technical skills and platform knowledge]  
Required Access: [System access, permissions, credentials needed]

## 1.4 Overview

This subsection provides high-level context about this procedure's place in platform operations and what execution entails.

[2-3 sentences providing context about this SOP's role in operational workflows, frequency of execution, and expected duration/complexity.]

# 🔗 2. Dependencies & Responsibilities

This section maps how this SOP integrates with other platform systems and clearly defines execution responsibilities across organizational roles and AI agents.

## 2.1 Related Services & Systems

This subsection identifies Proxmox Astronomy Lab services and systems that this SOP interacts with or depends on.

[Brief explanation of system dependencies and integration points]

| Service/System | Dependency Type | Integration Points | Documentation |
|-------------------|---------------------|------------------------|-------------------|
| [Service Name] | [Required/Optional/Integrates-with] | [Brief integration description] | [Link to service doc] |
| [Another System] | [Dependency type] | [Integration description] | [Link to system doc] |

## 2.2 Policy Implementation

This subsection connects this SOP to the Proxmox Astronomy Lab governance framework by identifying which organizational policies it implements or supports.

[Brief explanation of policy relationships and compliance requirements]

- [Policy Name](../../security/policies/policy-name.md) - [Brief description of how this SOP implements or supports this policy]
- [Baseline Infrastructure Standards](../../infrastructure/baseline-standards.md) - [How this SOP relates to baseline configurations]

## 2.3 Responsibility Matrix

This subsection defines clear accountability for activities within this SOP across organizational roles and AI agents.

| Activity | Helpdesk | Ops | Engineering | Security | Executive | AIOps |
|--------------|--------------|---------|-----------------|--------------|---------------|-----------|
| [Activity 1] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] |
| [Activity 2] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] |
| [Activity 3] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] | [R/A/C/I] |

R: Responsible, A: Accountable, C: Consulted, I: Informed

AIOps Notation:

- A (Accountable): Automated execution via agents01 with human approval required
- R (Responsible): AI agent directly performs the work (e.g., compliance analysis, report generation)
- C (Consulted): AI provides recommendations or analysis for human decision
- I (Informed): AI receives notifications or logs for context

# ⚙️ 3. Procedure

This section provides the systematic operational procedure with prerequisites, execution steps, verification methods, and troubleshooting guidance.

## 3.1 Prerequisites

This subsection documents requirements that must be met before executing this procedure.

System Requirements:

- [Required system state or configuration]
- [Minimum resource availability]
- [Service dependencies running]

Access Requirements:

- [Required credentials or authentication]
- [Permission levels needed]
- [VPN/network access if applicable]

Preparation Steps:

- [Any preparatory activities needed]
- [Backup or snapshot requirements]
- [Notification or communication needed]

## 3.2 Execution Steps

This subsection provides detailed, systematic steps for executing this procedure.

### Step 1: [Action Title]

Execution Type: [Manual/Automated/Semi-Automated]  
Responsible Role: [Role from RACI matrix]  
Automation Details: [Ansible playbook reference if applicable]  
Human Approval: [Required/Not Required]

```bash
# Command or automation invocation
command here
```

Expected Outcome: [What should happen when this step completes successfully]

Notes: [Any important considerations, warnings, or context for this step]

---

### Step 2: [Next Action Title]

Execution Type: [Manual/Automated/Semi-Automated]  
Responsible Role: [Role from RACI matrix]  
Automation Details: [Ansible playbook: `playbook-name.yml` or N/A]  
Human Approval: [Required/Not Required]

```bash
# Command or automation invocation
another command
```

Expected Outcome: [What should happen when this step completes successfully]

Notes: [Any important considerations, warnings, or context for this step]

---

### Step 3: [Continue Pattern]

Execution Type: [Manual/Automated/Semi-Automated]  
Responsible Role: [Role from RACI matrix]  
Automation Details: [Ansible playbook reference if applicable]  
Human Approval: [Required/Not Required]

```bash
# Command or automation invocation
final command
```

Expected Outcome: [What should happen when this step completes successfully]

Notes: [Any important considerations, warnings, or context for this step]

---

Execution Notes:

- Total estimated duration: [Time estimate]
- Critical decision points: [List any points requiring human judgment]
- Rollback procedure: [Link to rollback SOP or brief description]

## 3.3 Verification

This subsection documents how to confirm the procedure completed successfully and the system is in the expected state.

Verification Checks:

| Check | Method | Expected Result |
|-----------|------------|-------------------|
| [Check 1] | [Command/inspection method] | [Expected outcome] |
| [Check 2] | [Command/inspection method] | [Expected outcome] |
| [Check 3] | [Command/inspection method] | [Expected outcome] |

Detailed Verification Steps:

```bash
# Verification command 1
verification command here
```

Expected Output: [What successful verification looks like]

```bash
# Verification command 2
another verification command
```

Expected Output: [What successful verification looks like]

Success Criteria:

- ✅ [Specific success indicator]
- ✅ [Another success indicator]
- ✅ [Final success indicator]

## 3.4 Troubleshooting

This subsection provides solutions for common issues encountered during procedure execution.

### Issue 1: [Problem Description]

Symptoms: [How this problem manifests]

Cause: [Why this problem occurs]

Resolution:

```bash
# Fix command if applicable
solution command
```

Steps: [Detailed resolution steps if command alone insufficient]

---

### Issue 2: [Problem Description]

Symptoms: [How this problem manifests]

Cause: [Why this problem occurs]

Resolution:

```bash
# Fix command if applicable
solution command
```

Steps: [Detailed resolution steps if command alone insufficient]

---

### Issue 3: [Problem Description]

Symptoms: [How this problem manifests]

Cause: [Why this problem occurs]

Resolution:

```bash
# Fix command if applicable
solution command
```

Steps: [Detailed resolution steps if command alone insufficient]

---

Escalation:
If issues persist after attempting troubleshooting steps:

1. Document the error state and steps attempted
2. Check related monitoring dashboards on mon01
3. Review logs via agents01 local Loki or mon01 (90-day retention)
4. Escalate to [appropriate team/role] with documentation

# 🔒 4. Security & Compliance

This section documents security considerations and compliance framework alignment for this operational procedure.

⚠️ SECURITY DISCLAIMER

*The security implementations described in this procedure are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## 4.1 Security Controls

This subsection documents specific security measures and considerations relevant to this procedure.

Procedure Security Posture:

[Brief description of security considerations for this procedure - what needs protection, what access controls apply, what security risks this procedure addresses or introduces]

Security Best Practices:

- [Security practice relevant to this procedure]
- [Another security consideration]
- [Additional security guidance]

## 4.2 CIS Controls Mapping

This subsection provides explicit mapping to CIS Controls v8, documenting compliance alignment and control implementation through this procedure.

Baseline Standards: CIS Controls v8, NIST AI Risk Management Framework  
Framework: NIST Cybersecurity Framework 2.0  
Mapping to: NIST SP 800-171

| CIS Control | Implementation | Evidence | Assessment Date |
|-----------------|-------------------|--------------|-------------------|
| [CIS.X.Y] | [How this SOP implements control] | [Evidence location/method] | [YYYY-MM-DD] |
| [Additional controls this SOP supports] | [Implementation description] | [Evidence] | [Date] |

Framework Alignment: This procedure supports cross-framework compliance by aligning CIS Controls v8 implementation with NIST CSF 2.0 categories and NIST SP 800-171 requirements, ensuring comprehensive security coverage while maintaining research computing operational efficiency.

# 📚 5. Related Resources

This section provides comprehensive links to related SOPs, policies, documentation, and external standards that inform or connect to this procedure.

## 5.1 Internal References

| Document Type | Document Title | Relationship | Link |
|-------------------|-------------------|------------------|----------|
| [SOP/Policy/Guide] | [Title] | [How it relates to this procedure] | [Internal link] |
| [Another resource] | [Title] | [Relationship description] | [Link] |

## 5.2 External Standards

- [Standard/Tool Name](https://example.com) - [How this external resource relates to the procedure]
- [Another Resource](https://example.com) - [Relevance description]

# 📜 6. Documentation Metadata

This section provides comprehensive information about SOP creation, revision history, and authorship transparency.

## 6.1 Change Log

| Version | Date | Changes | Author | Pipeline | Review Status |
|------------|---------|-------------|------------|--------------|-------------------|
| X.Y | YYYY-MM-DD | [Description of changes] | [Author] | [Model + Method] | [Status] |

## 6.2 Authorship Details

Human Author: VintageDon (<https://github.com/vintagedon>)  
AI Contributor: [Full model designation]  
Collaboration Method: Request-Analyze-Verify-Generate-Validate (RAVGV)  
Human Oversight: [Description of human oversight approach for this SOP development]

## 6.3 AI Operations Disclosure

This SOP was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. [Brief description of AI involvement and human oversight in procedure development]. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, safety, and operational correctness.

This SOP documents procedures for infrastructure operated through AI-assisted workflows with human oversight. The Proxmox Astronomy Lab implements agentic operations via agents01 orchestration hub, where AI agents analyze compliance data, generate remediation playbooks, and propose infrastructure changes. All AI-generated infrastructure modifications and automated procedure execution require human approval via Gitea PR review before execution.

*Pipeline: [Model + Method] | Generated: [Date] | Human Author: VintageDon | Review Status: [Status] | Document Version: [X.Y]*

---

## 📋 SOP Template Usage Guidelines

### Purpose & Function

The SOP template provides streamlined documentation for operational procedures executed by humans, AI agents, or a combination of both. It focuses on clear execution steps with appropriate security context while avoiding unnecessary documentation overhead.

Use this template for:

- Standard operational procedures and routine tasks
- Infrastructure maintenance and management procedures
- System configuration and deployment procedures
- Compliance and security operational tasks
- Backup, recovery, and disaster response procedures
- Monitoring and troubleshooting procedures

Don't use this template for:

- Formal governance policies (use policy template)
- Simple knowledge base articles (use general article template)
- Directory organization (use interior README template)
- Conceptual overviews without procedures (use general article template)

### Critical: Fixed Section Numbering

SOPs use 6-section structure (Sections 1-6) optimized for operational procedures:

- Section 1: Introduction (Purpose, Scope, Target Audience, Overview)
- Section 2: Dependencies & Responsibilities (Related Systems, Policies, RACI Matrix)
- Section 3: Procedure (Prerequisites, Execution Steps, Verification, Troubleshooting)
- Section 4: Security & Compliance (Security Controls, CIS Controls Mapping)
- Section 5: Related Resources (Internal References, External Standards)
- Section 6: Documentation Metadata (Change Log, Authorship, AI Operations Disclosure)

Graceful drops allowed within sections (e.g., can skip 3.4 if no troubleshooting needed, but maintain numbering)

All SOPs terminate at Section 6.3 - this is the standard termination point for operational procedures.

### Document Length Targets

- Standard SOP: 400-500 lines for typical operational procedures
- Simple SOP: 300-400 lines for straightforward tasks
- Complex SOP: 500-700 lines for multi-step procedures with extensive troubleshooting

### Content Principles

- Execution Focus: Clear, actionable steps that can be followed precisely
- Agent-Friendly: Structured for both human and AI agent execution
- Verification Built-In: Always include verification steps
- Troubleshooting Included: Address common issues proactively
- Security Conscious: Document security implications and controls
- RACI Clarity: Clear responsibility assignment for every activity

### Section-Specific Guidance

#### Section 1: Introduction

- 1.1 Purpose: What operational outcome does this SOP achieve?
- 1.2 Scope: Use table format, be clear about what's covered
- 1.3 Target Audience: Specify roles, background, AND required access levels
- 1.4 Overview: Execution frequency, duration, complexity context
- No Section 1.5: Baseline infrastructure linked via Section 2.2 Policy Implementation

#### Section 2: Dependencies & Responsibilities

- 2.1 Related Services/Systems: Table with dependency types and integration points
- 2.2 Policy Implementation: Link to governing policies AND baseline standards
- 2.3 RACI Matrix: 6-column standard (Helpdesk, Ops, Engineering, Security, Executive, AIOps)
  - Be explicit about AIOps role: A=Automated with approval, R=Direct execution, C=Recommendations, I=Notifications

#### Section 3: Procedure

This is the core of the SOP - structure it carefully:

- 3.1 Prerequisites: System requirements, access requirements, preparation steps
- 3.2 Execution Steps: Each step should include:
  - Clear action title
  - Execution type (Manual/Automated/Semi-Automated)
  - Responsible role
  - Automation details (ansible playbook reference if applicable)
  - Human approval requirement
  - Command/code block
  - Expected outcome
  - Notes/warnings
- 3.3 Verification: Table of checks + detailed verification commands with expected output
- 3.4 Troubleshooting: Common issues with symptoms, causes, resolutions, escalation path

#### Section 4: Security & Compliance

- Pre-filled disclaimer: Standard security baseline establishment language
- 4.1 Security Controls: Brief description of security considerations for THIS procedure
- 4.2 CIS Controls Mapping: Specific controls this SOP implements/supports
- Keep concise: This isn't a security policy, just operational security context

#### Section 5: Related Resources

- 5.1 Internal References: Related SOPs, policies, guides with clear relationship descriptions
- 5.2 External Standards: Tools, documentation, standards referenced in procedure

#### Section 6: Documentation Metadata

- 6.1 Change Log: Include pipeline column for tracking AI model/method used
- 6.2 Authorship Details: Standard RAVGV methodology disclosure
- 6.3 AI Operations Disclosure: Emphasize both SOP creation AND operational execution by agents

### Agent-Friendly Execution Steps

For procedures that will be executed by AI agents via agents01:

```markdown
### Step X: [Action Title]

Execution Type: Automated  
Responsible Role: AIOps  
Automation Details: Ansible playbook: `playbook-name.yml`  
Human Approval: Required before execution

```bash
# Agent execution command
ansible-playbook /opt/aiagents/playbooks/playbook-name.yml -e "var=value"
```

Expected Outcome: [Specific, verifiable outcome]

Notes: This step requires Gitea PR approval before ansible execution via Semaphore

```markdown

Key elements for agent execution:
- Explicit execution type
- Clear automation references (playbook names, paths)
- Human approval requirements stated
- Verifiable expected outcomes
- GitOps workflow integration noted

### Automation Tags in Front Matter

Use the `automation` tag to indicate procedure automation level:
- `automation: manual` - Fully manual execution
- `automation: semi-automated` - Mix of manual and automated steps
- `automation: fully-automated` - Complete automation with human approval gates

This helps filter SOPs by automation capability.

### Quality Indicators

- ✅ SOP accomplishes stated operational purpose
- ✅ Prerequisites are complete and clear
- ✅ Execution steps are precise and ordered correctly
- ✅ Each step has clear expected outcomes
- ✅ Verification steps confirm success
- ✅ Troubleshooting addresses real issues
- ✅ RACI clearly assigns responsibility
- ✅ Agent execution requirements explicit
- ✅ Human approval points identified
- ✅ Section numbering follows 1-6 structure
- ✅ Document terminates at Section 6.3

### Common Mistakes to Avoid

- ❌ Don't skip verification steps (essential for operational procedures)
- ❌ Don't forget troubleshooting (procedures will fail sometimes)
- ❌ Don't omit RACI (operational accountability is critical)
- ❌ Don't be vague about automation (specify ansible playbooks, approval requirements)
- ❌ Don't skip security considerations (operational security matters)
- ❌ Don't forget expected outcomes (how do you know step succeeded?)
- ❌ Don't renumber sections (breaks RAG optimization)

### Execution Step Template

Standard step structure:
```markdown
### Step N: [Clear Action Title]

Execution Type: [Manual/Automated/Semi-Automated]  
Responsible Role: [From RACI - e.g., Ops, Engineering, AIOps]  
Automation Details: [Ansible playbook: `name.yml` | N/A for manual]  
Human Approval: [Required | Not Required]

```bash
# Command or automation invocation
actual command here
```

Expected Outcome: [Specific, measurable result]

Notes: [Important context, warnings, dependencies]

---

### Repository Context

Repository: [Proxmox Astronomy Lab](https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab)  
Author Profile: [VintageDon](https://github.com/vintagedon/)  
Platform: Enterprise-grade astronomical computing infrastructure (7-node Proxmox cluster)  
Security Framework: CIS Controls v8, NIST AI RMF, NIST CSF 2.0  
Operations: AI-assisted workflows via agents01 orchestration hub with human oversight  
Automation: Ansible playbooks with GitOps workflow via Gitea, executed via Semaphore  
Use Case: Operational procedures executed by humans, AI agents, or hybrid workflows
