<!--
---
title: "[Runbook Title]"
description: "Tactical procedure for [what operation]"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.0"
status: "Draft|Active|Deprecated"
tags:
  - type: runbook
  - domain: [infrastructure/kubernetes/databases/monitoring/networking/security/storage/automation/agents]
  - tech: [relevant-technologies]
related_documents:
  - "[Related Asset](path/to/asset.md)"
  - "[Related Runbook](path/to/runbook.md)"
---
-->

# [Runbook Title]

[1-2 sentences: What operation this runbook covers and when to use it.]

---

## 1. Prerequisites

| Requirement | Details |
|-------------|---------|
| **Access** | [What credentials, SSH keys, or permissions are needed] |
| **Target** | [Host, VM, service being operated on] |
| **Tools** | [CLI tools, packages, or utilities required] |
| **State** | [Any preconditions — service running, backup complete, etc.] |

---

## 2. Procedure

### 2.1 [Step Group Name]

[Brief context for this group of steps.]

```bash
# [What this command does]
command-here
```

[Expected output or state after this step.]

### 2.2 [Step Group Name]

[Brief context.]

```bash
# [What this command does]
command-here
```

<!--
Add as many step groups as needed: 2.3, 2.4, etc.
Each group is a logical phase of the operation.
Include expected output after commands where useful.
-->

---

## 3. Verification

[How to confirm the operation succeeded.]

```bash
# [Verification command]
command-here
```

Expected result: [What success looks like.]

---

## 4. Rollback

<!--
OPTIONAL — include if the operation is reversible and rollback
is non-obvious. Delete this section if rollback doesn't apply.
Preserve the numbering gap.
-->

[How to undo this operation if something goes wrong.]

```bash
# [Rollback command]
command-here
```

---

## N. References

| Resource | Description |
|----------|-------------|
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

1. RUNBOOK vs PROCEDURE: Runbooks are tactical ops — commands
   to run, steps to follow, verification to check. No RACI,
   no compliance mapping, no review cycle. If the operation
   needs governance structure, use the procedure template.

2. COMMAND BLOCKS: Every meaningful step should have a command
   block. If a step can't be expressed as a command, it should
   at minimum have a clear action statement.

3. VERIFICATION: Always include. The operator (human or agent)
   needs to know when they're done and whether it worked.

4. ROLLBACK: Include for destructive or stateful operations.
   Skip for read-only or idempotent operations.

5. SEMANTIC NUMBERING: Preserve gaps if sections omitted.

6. KEEP IT TACTICAL: This is a cookbook, not a textbook.
   Explain enough to execute safely, no more.
-->
