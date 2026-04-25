<!--
---
title: "[Policy Title]"
description: "What this policy governs and why"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.0"
status: "Draft|Active|Under Review|Deprecated"
review_cycle: "Annual"
next_review: "YYYY-MM-DD"
tags:
  - type: policy
  - domain: [security/compliance/ai-ml/infrastructure/operations]
  - framework: [cisv8/nist-ai-rmf/pacific-ai/cis-ram]
related_documents:
  - "[Related Doc](path/to/doc.md)"
---
-->

# Revision History

| Version | Date | Author | Reviewed By | Summary of Changes |
|---------|------|--------|-------------|-------------------|
| 1.0 | YYYY-MM-DD | VintageDon | [Reviewer] | Initial release |

---

# [Policy Title]

[1-2 sentences: What this policy establishes and why it exists.]

---

## 1. Purpose

[What this policy accomplishes and the commitment it represents. 2-3 sentences max.]

---

## 2. Scope

### 2.1 Applicability

[Who and what this policy applies to — personnel, systems, agents, processes.]

### 2.2 Exclusions

[What is explicitly out of scope. Omit section if none.]

---

## 3. Policy Statements

[The actual policy content. This is the authoritative "what we commit to and why." Structure with subsections (3.1, 3.2, etc.) as needed. Each statement should be clear enough to audit against.]

---

## 4. RACI

| Activity | Responsible | Accountable | Consulted | Informed |
|----------|-------------|-------------|-----------|----------|
| [Activity] | [Role/Persona] | [Role] | [Role] | [Role] |

<!--
For ethops context:
- Roles may include: Operator (human), SDM Orchestrator, agent personas, Document Controller
- Accountable is always one role — the human operator for policies
- Agent personas can be Responsible or Consulted, never Accountable
-->

---

## 5. Compliance Mapping

| Framework | Control/Requirement | How This Policy Satisfies |
|-----------|--------------------|-----------------------------|
| CIS v8 | [Safeguard ID] | [Brief statement] |
| NIST AI RMF | [Function/Category] | [Brief statement] |
| Pacific AI | [Policy Reference] | [Brief statement] |

<!--
Include only frameworks that genuinely apply to this policy.
Not every policy needs all rows — delete unused frameworks.
The "How This Policy Satisfies" column is the audit evidence link.
-->

---

## 6. Review Cycle

| Attribute | Value |
|-----------|-------|
| **Review Frequency** | [Annual / Semi-Annual / Quarterly] |
| **Next Review Date** | [YYYY-MM-DD] |
| **Review Owner** | [Role responsible for initiating review] |

### Triggers for Earlier Review

- [Event that forces out-of-cycle review, e.g., security incident, framework update, architectural change]
- [Additional trigger]

---

## 7. Enforcement

[What happens when this policy is violated. Brief — reference the relevant procedure if one exists. For ethops, this may include: CAPA, action log flags, agent permission revocation, CAB escalation.]

---

## N. References

| Resource | Description |
|----------|-------------|
| [Link](url) | What it provides |

---

## N+1. Approval

| Role | Name | Date |
|------|------|------|
| Policy Owner | | |
| Approving Authority | | |

---

<!--
TEMPLATE USAGE NOTES (remove when using):

1. FRONTMATTER: Always include. The `framework` tag links this policy to
   its governing compliance framework(s) for RAG retrieval.

2. REVISION HISTORY AT TOP: This is intentional for audit readability.
   Auditors look here first. Keep it above the title.

3. SEMANTIC NUMBERING: If you omit a section, preserve the gap.
   - Correct: 1, 2, 3, 5 (section 4 omitted)
   - Wrong: 1, 2, 3, 4 (renumbered)

4. REQUIRED SECTIONS FOR POLICIES:
   - §1 Purpose: Always (why this exists)
   - §2 Scope: Always (who/what it applies to)
   - §3 Policy Statements: Always (the actual commitments)
   - §4 RACI: Include for any policy with multi-role responsibilities
   - §5 Compliance Mapping: Include when policy maps to a framework control
   - §6 Review Cycle: Always (policies must have a review schedule)
   - Approval: Always (policies require sign-off)

5. OPTIONAL SECTIONS:
   - §7 Enforcement: Include if violation consequences need definition
   - Additional content sections as needed between §3 and RACI

6. COMPLIANCE MAPPING: Only include frameworks that genuinely apply.
   An empty compliance mapping table is worse than no table — it
   signals you haven't done the mapping work.

7. VERSION NUMBERING:
   - 0.x — Draft, not approved
   - 1.0 — Initial approved release
   - 1.1, 1.2 — Minor (clarifications, non-substantive)
   - 2.0, 3.0 — Major (scope change, restructuring)

8. KEEP IT LEAN: Policy states what and why. Procedure states how.
   If you're writing steps, you need the procedure template instead.
-->
