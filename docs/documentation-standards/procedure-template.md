<!--
---
title: "[Procedure Title]"
description: "What this procedure covers and what process it governs"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.0"
status: "Draft|Active|Under Review|Deprecated"
review_cycle: "Annual"
next_review: "YYYY-MM-DD"
parent_policy: "[Policy Title](path/to/policy.md)"
tags:
  - type: procedure
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

# [Procedure Title]

[1-2 sentences: What process this procedure governs and its relationship to the parent policy.]

---

## 1. Purpose

[What this procedure accomplishes. 2-3 sentences max.]

---

## 2. Scope

[What activities, systems, or roles this procedure applies to. Reference the parent policy for broader applicability.]

---

## 3. Responsibilities

| Role | Responsibility |
|------|---------------|
| [Role/Persona] | [What they do in this procedure] |

<!--
Lighter than a full RACI. Use this for straightforward procedures
where R and A are clear from context.

Escalate to a full RACI table if the procedure involves:
- Multiple handoffs between roles/personas
- Approval gates with different authorities
- Parallel activities across teams

Full RACI format (use when needed):
| Activity | Responsible | Accountable | Consulted | Informed |
|----------|-------------|-------------|-----------|----------|
-->

---

## 4. Procedure

[The actual steps. Structure with subsections (4.1, 4.2, etc.) for distinct phases or decision points. Be specific enough that an agent or operator can execute without interpretation.]

### 4.1 [Phase/Step Group Name]

[Steps for this phase.]

### 4.2 [Phase/Step Group Name]

[Steps for this phase.]

<!--
Add as many subsections as the procedure requires.
Continue numbering: 4.3, 4.4, etc.
-->

---

## 5. Compliance Mapping

| Framework | Control/Requirement | How This Procedure Satisfies |
|-----------|--------------------|-----------------------------|
| CIS v8 | [Safeguard ID] | [Brief statement] |

<!--
OPTIONAL — include only when this procedure directly implements
a compliance control. Many SOPs won't need this section.

Delete this section entirely if no framework mapping applies.
Preserve the numbering gap (next section stays §6, not §5).
-->

---

## 6. Review Cycle

| Attribute | Value |
|-----------|-------|
| **Review Frequency** | [Annual / When role changes / When tooling changes] |
| **Next Review Date** | [YYYY-MM-DD] |
| **Review Owner** | [Role responsible for initiating review] |

### Triggers for Earlier Review

- [Process change, audit finding, tooling change, incident]

---

## N. References

| Resource | Description |
|----------|-------------|
| [Parent Policy](path/to/policy.md) | Governing policy |
| [Link](url) | What it provides |

---

## N+1. Document Info

| | |
|---|---|
| Author | VintageDon |
| Created | YYYY-MM-DD |
| Updated | YYYY-MM-DD |
| Version | 1.0 |

---

<!--
TEMPLATE USAGE NOTES (remove when using):

1. FRONTMATTER: The `parent_policy` field links this procedure to its
   governing policy. Not all procedures have a parent policy — remove
   the field if standalone.

2. REVISION HISTORY AT TOP: Same rationale as policies — audit readability.

3. SEMANTIC NUMBERING: Preserve gaps if sections omitted.

4. REQUIRED SECTIONS FOR PROCEDURES:
   - §1 Purpose: Always
   - §2 Scope: Always
   - §3 Responsibilities: Always (at minimum a role/responsibility table)
   - §4 Procedure: Always (the actual steps)
   - §6 Review Cycle: Always (procedures must have a review schedule)

5. OPTIONAL SECTIONS:
   - §5 Compliance Mapping: Only when procedure implements a framework control
   - Additional content sections as needed

6. RESPONSIBILITIES vs RACI:
   - Default to the simple Role/Responsibility table
   - Upgrade to full RACI only for complex multi-role procedures
   - The template comment shows both formats

7. PROCEDURE SECTION GUIDANCE:
   - Use subsections (4.1, 4.2) for distinct phases
   - Include decision points explicitly ("If X, then Y; otherwise Z")
   - For agent-executable procedures, be precise enough that the
     agent persona can follow without interpretation
   - Reference specific tools, commands, or interfaces where applicable

8. VERSION NUMBERING: Same as policy template.
   - 0.x Draft, 1.0 initial release, 1.x minor, 2.0+ major

9. POLICY vs PROCEDURE: If you're writing commitments and principles,
   use the policy template. If you're writing steps, you're here.
-->
