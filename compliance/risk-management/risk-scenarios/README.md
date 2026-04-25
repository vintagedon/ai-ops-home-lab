<!--
---
title: "Risk Scenarios"
description: "Operational risk scenario library for AI systems"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [compliance, security]
  - framework: [nist-ai-rmf, cis-ram]
related_documents:
  - "[Risk Management](../README.md)"
---
-->

# Risk Scenarios

Library of 10 operational risk scenarios covering AI system risks. Each scenario documents the threat, impact, likelihood, existing controls, and residual risk.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `R01-data-egress-exposure.md` | Data egress and exposure risks |
| `R02-secrets-credentials-leakage.md` | Secrets and credential leakage |
| `R03-prompt-injection-tool-abuse.md` | Prompt injection and tool abuse |
| `R04-pr-poisoning-infrastructure-drift.md` | PR poisoning and infrastructure drift |
| `R05-model-extension-supply-chain.md` | Model and extension supply chain risks |
| `R06-identity-access-drift.md` | Identity and access control drift |
| `R07-hallucination-inaccurate-output.md` | Hallucination and inaccurate output |
| `R08-legal-compliance-gaps.md` | Legal and compliance gaps |
| `R09-cost-tool-sprawl.md` | Cost and tool sprawl |
| `R10-logging-blind-spots.md` | Logging blind spots |

---

## 2. Structure

```
risk-scenarios/
+-- README.md
+-- R01-data-egress-exposure.md
+-- R02-secrets-credentials-leakage.md
+-- R03-prompt-injection-tool-abuse.md
+-- R04-pr-poisoning-infrastructure-drift.md
+-- R05-model-extension-supply-chain.md
+-- R06-identity-access-drift.md
+-- R07-hallucination-inaccurate-output.md
+-- R08-legal-compliance-gaps.md
+-- R09-cost-tool-sprawl.md
+-- R10-logging-blind-spots.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Risk Management](../README.md) | Parent directory |
| [Standards](../../standards/README.md) | Assessment standards applied to these scenarios |
