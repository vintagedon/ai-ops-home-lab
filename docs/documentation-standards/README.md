<!--
---
title: "Documentation Standards"
description: "Templates and controlled vocabulary for Proxmox Astronomy Lab documentation"
author: "VintageDon"
date: "2026-03-22"
version: "2.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: documentation
related_documents:
  - "[Docs Directory](../README.md)"
  - "[Tagging Strategy Guide](tagging-strategy.md)"
---
-->

# Documentation Standards

Templates and controlled vocabulary for all documentation in the Proxmox Astronomy Lab repository. These standards align to the [project-template-repository](https://github.com/radioastronomyio/project-template-repository) as canonical base, with governance templates from [ethops](https://github.com/radioastronomyio/ethops) and domain-specific extensions for this repo.

---

## 1. Contents

### Document Templates

| Template | Function | Source |
|----------|----------|--------|
| [general-kb-template.md](general-kb-template.md) | Standalone documents (guides, references, reports) | project-template |
| [asset-sheet-template.md](asset-sheet-template.md) | Trackable infrastructure assets (nodes, VMs, services, databases, licenses) | This repo |
| [wu-spec-template.md](wu-spec-template.md) | Work unit specifications for agent execution (outcomes + tests) | This repo |
| [runbook-template.md](runbook-template.md) | Tactical operational procedures with commands | This repo |
| [procedure-template.md](procedure-template.md) | Governance SOPs with RACI and compliance mapping | ethops |
| [policy-template.md](policy-template.md) | Governance commitments and principles | ethops |

### README Templates

| Template | Function | Source |
|----------|----------|--------|
| [primary-readme-template.md](primary-readme-template.md) | Repository root README | project-template |
| [interior-readme-template.md](interior-readme-template.md) | Directory self-documentation and linking | project-template |
| [worklog-readme-template.md](worklog-readme-template.md) | Milestone directories in `work-logs/` | project-template |

### Code Standards

| Template | Function | Source |
|----------|----------|--------|
| [script-header-python.md](script-header-python.md) | Python file header with NumPy docstrings | project-template |
| [script-header-shell.md](script-header-shell.md) | Bash file header with strict mode | project-template |
| [script-header-powershell.md](script-header-powershell.md) | PowerShell file header with comment-based help | project-template |
| [code-commenting-dual-audience.md](code-commenting-dual-audience.md) | Human + AI commenting methodology | ethops |

### Tagging & Classification

| Document | Function | Source |
|----------|----------|--------|
| [tagging-strategy.md](tagging-strategy.md) | Methodology for building controlled tag vocabularies | project-template |
| [frontmatter-tagging-vocabulary.md](frontmatter-tagging-vocabulary.md) | Concrete tag values for this repository | This repo |

---

## 2. Template Selection Tree

```
Is it the repository root README?
├─ Yes → primary-readme-template.md
└─ No: Is it a directory README?
        ├─ Yes: Is it a work-logs milestone?
        │       ├─ Yes → worklog-readme-template.md
        │       └─ No  → interior-readme-template.md
        └─ No: Is it a governance document?
                ├─ Yes: Does it state commitments/principles?
                │       ├─ Yes → policy-template.md
                │       └─ No: Does it define how to do something?
                │               ├─ Yes: Is it governance-grade (RACI, compliance)?
                │               │       ├─ Yes → procedure-template.md
                │               │       └─ No  → runbook-template.md
                │               └─ No → general-kb-template.md
                └─ No: Is it tracking a specific asset?
                        ├─ Yes → asset-sheet-template.md
                        └─ No: Is it a work unit for agent execution?
                                ├─ Yes → wu-spec-template.md
                                └─ No → general-kb-template.md
```

---

## 3. Core Principles

- **YAML frontmatter on everything** — enables RAG retrieval and filtering
- **Semantic numbering with preserved gaps** — if you omit section 4, numbering goes 1, 2, 3, 5 (never renumber)
- **Wrapper is thin; content is the point** — don't pad sections for completeness
- **Bottom-up** — start minimal, add sections as content requires
- **Controlled vocabulary** — use values from `frontmatter-tagging-vocabulary.md`, not ad-hoc tags

---

## 4. Structure

```
documentation-standards/
├── README.md                          # This file
├── general-kb-template.md             # Standalone documents
├── asset-sheet-template.md            # Infrastructure assets
├── wu-spec-template.md                # Agent work unit specs
├── runbook-template.md                # Tactical ops procedures
├── procedure-template.md              # Governance SOPs
├── policy-template.md                 # Governance policies
├── primary-readme-template.md         # Repo root README
├── interior-readme-template.md        # Directory READMEs
├── worklog-readme-template.md         # Milestone READMEs
├── script-header-python.md            # Python headers
├── script-header-shell.md             # Bash headers
├── script-header-powershell.md        # PowerShell headers
├── code-commenting-dual-audience.md   # Commenting methodology
├── tagging-strategy.md                # Tag design methodology
└── frontmatter-tagging-vocabulary.md  # Concrete tag values
```

---

## 5. Related

| Resource | Relationship |
|----------|--------------|
| [Docs Directory](../README.md) | Parent context |
| [project-template-repository](https://github.com/radioastronomyio/project-template-repository) | Canonical base for universal templates |
| [ethops](https://github.com/radioastronomyio/ethops) | Source for governance templates |

---

## 6. Change Log

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 2.0 | 2026-03-22 | VintageDon | Complete rewrite. Expanded from 4 to 16 files. Added template selection tree, ecosystem provenance, core principles. Aligned to project-template-repository and ethops. |
| 1.0 | 2025-12-24 | VintageDon | Initial creation with four core templates |
