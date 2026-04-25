<!--
---
title: "Compliance"
description: "AI governance policies, standards, risk management, and compliance evidence for the Proxmox Astronomy Lab"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [compliance, security, ai-ml]
  - framework: [cisv8, nist-ai-rmf, pacific-ai, cis-ram]
related_documents:
  - "[Root README](../README.md)"
  - "[NIST AI RMF Cookbook](https://github.com/vintagedon/nist-ai-rmf-cookbook)"
---
-->

# Compliance

AI governance policies, standards, risk management, and compliance evidence for the Proxmox Astronomy Lab. This directory is the operational deployment of the NIST AI RMF Cookbook policy stack: Pacific AI Suite (organizational) -> Cookbook (operational) -> CIS-RAM (risk methodology) -> CISv8 IG1 (technical baseline, 56 safeguards).

AI policy rewrite is a separate independent effort and is excluded from the documentation rewrite scope.

---

## 1. Contents

### Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `policies/` | AI governance and acceptable use policies (Tier 1) | [README](policies/README.md) |
| `standards/` | Technical standards for AI risk, security, and transparency (Tier 2) | [README](standards/README.md) |
| `risk-management/` | Risk scenarios and assessment methodology | [README](risk-management/README.md) |
| `ai-model-registry/` | Registry of deployed AI models with governance documentation | [README](ai-model-registry/README.md) |
| `policy-appendices/` | Framework crosswalk, glossary, charter, and supporting materials | [README](policy-appendices/README.md) |
| `evidence/` | CISv8 IG1 compliance evidence artifacts (future) | [README](evidence/README.md) |
| `backups/` | Compliance document backups | [README](backups/README.md) |
| `templates/` | **Deprecated** - superseded by `docs/documentation-standards/` | [README](templates/README.md) |

---

## 2. Structure

```
compliance/
+-- README.md
+-- ai-model-registry/
+-- backups/
+-- evidence/
+-- policies/
|   +-- Policies-Working/
+-- policy-appendices/
+-- risk-management/
|   +-- risk-scenarios/
+-- standards/
+-- templates/                  # DEPRECATED
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [NIST AI RMF Cookbook](https://github.com/vintagedon/nist-ai-rmf-cookbook) | Policy stack source |
| [AI and Machine Learning](../ai-machine-learning/README.md) | Model cards and deployed model governance |
| [Documentation Standards](../docs/documentation-standards/README.md) | Current template authority (replaces compliance/templates/) |
