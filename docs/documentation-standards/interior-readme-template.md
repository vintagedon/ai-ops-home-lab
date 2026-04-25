<!--
---
title: "[Directory Name]"
description: "Brief description of directory purpose and contents"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [infrastructure/kubernetes/ai-ml/astronomy/compliance/databases/monitoring/networking/security/storage/automation/agents]
related_documents:
  - "[Parent Directory](../README.md)"
---
-->

# [Directory Name]

Brief description of what this directory contains and its role within the Proxmox Astronomy Lab. One to two sentences maximum.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `filename.md` | Brief description of purpose |
| `another-file.md` | Brief description of purpose |

### Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `subdirectory-name/` | Brief description of contents | [README](subdirectory-name/README.md) |
| `another-subdir/` | Brief description of contents | [README](another-subdir/README.md) |

---

## 2. Structure

```
directory-name/
├── README.md
├── filename.md
├── another-file.md
├── subdirectory-name/
│   └── README.md
└── another-subdir/
    └── README.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Parent Directory](../README.md) | Parent context |
| [Related Directory](../related/README.md) | Brief relationship description |

---

<!--
TEMPLATE USAGE NOTES (remove when using):

1. FRONTMATTER: Always include. Tags enable RAG retrieval.

2. SEMANTIC NUMBERING: If you omit a section, preserve the gap.
   - Correct: 1, 2, 4 (section 3 omitted)
   - Wrong: 1, 2, 3 (renumbered)

3. SECTIONS:
   - §1 Contents: Always include (file table + subdirectory table)
   - §2 Structure: Always include (tree view)
   - §3 Related: Include if meaningful relationships exist

4. EXPANSION: Add sections as needed (4, 5, ...) for:
   - Usage notes
   - Security considerations
   - Common patterns
   - Whatever the directory needs

5. KEEP IT LEAN: This template is intentionally minimal.
   Add what's needed, don't fill sections for completeness.
-->
