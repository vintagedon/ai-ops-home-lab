<!--
---
title: "[WU-NN]: [Work Unit Title]"
description: "What this work unit produces and why"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.0"
status: "Draft|Ready|In Progress|Complete|Blocked"
tags:
  - type: wu-spec
  - domain: [infrastructure/kubernetes/ai-ml/astronomy/compliance/databases/monitoring/networking/security/storage/automation/agents]
  - tech: [relevant-technologies]
related_documents:
  - "[Related Spec](path/to/spec.md)"
  - "[Target Asset Sheet](path/to/asset.md)"
---
-->

# WU-NN: [Work Unit Title]

---

## 1. Objective

[What this work unit produces and why it matters. 2-3 sentences. State the outcome, not the activity.]

---

## 2. Execution Environment

<!--
Use .spec.env references for anything environment-specific (hosts, IPs, paths, credentials).
The .spec.env file is gitignored. The agent reads both this spec and the .env.
-->

| Property | Value |
|----------|-------|
| **Target Host** | `${SPEC_TARGET_HOST}` |
| **Working Directory** | `${SPEC_WORKING_DIR}` |
| **Runtime** | [Python 3.12 / Bash / Ansible / etc.] |
| **Venv/Container** | `${SPEC_VENV_PATH}` or [container image] |
| **Branch** | `feature/wu-NN-description` |

---

## 3. Source of Truth

[Documents the agent MUST read before starting. GDR reports, architecture docs, existing asset sheets, external references.]

| Source | Location | What It Provides |
|--------|----------|-----------------|
| [Document Name] | [path or URL] | [What the agent learns from it] |

---

## 4. Decision Log

[Choices already made that the agent must respect. Table format — each row is a constraint.]

| Decision | Rationale | Source |
|----------|-----------|--------|
| [What was decided] | [Why] | [Who/what decided it] |

---

## 5. Riders

<!--
OPTIONAL — Modular constraint sets that layer additional outcomes and tests
on top of this spec. The agent must satisfy all rider outcomes simultaneously
with base outcomes.

Delete this section if no riders apply.
-->

| Rider | Location | What It Adds |
|-------|----------|-------------|
| [rider-name] | [path to rider spec] | [Brief: what additional constraints] |

---

## 6. Deliverables

[What the agent must produce. Each deliverable is a contract — specific enough to verify, loose enough to allow implementation freedom.]

| # | Deliverable | Description | Target Location |
|---|-------------|-------------|-----------------|
| 1 | [File or artifact name] | [What it is and what it must contain] | [Where it goes in the repo] |
| 2 | [File or artifact name] | [What it is and what it must contain] | [Where it goes in the repo] |

---

## 7. Acceptance Criteria

[Runnable tests with expected results. The agent is done when all tests pass. Be as specific as the granularity dial requires.]

| # | Test | Command / Check | Expected Result |
|---|------|-----------------|-----------------|
| 1 | [What is being validated] | `[runnable command]` | [Expected output or state] |
| 2 | [What is being validated] | `[runnable command or manual check]` | [Expected output or state] |

---

## 8. Non-Goals

[What this work unit explicitly does NOT do. Prevents scope creep and sideways drift.]

- [Thing the agent should not attempt]
- [Adjacent concern that belongs to a different WU]

---

<!--
TEMPLATE USAGE NOTES (remove when using):

1. FRONTMATTER: Always include. Status tracks WU lifecycle:
   - Draft: Spec is being written
   - Ready: Spec is complete, agent can pick it up
   - In Progress: Agent is working on it
   - Complete: All acceptance criteria pass
   - Blocked: Dependency or issue prevents progress

2. THE GRANULARITY DIAL: This template is identical at every
   constraint level. Loose specs have fewer deliverables and
   broader acceptance criteria. Tight specs have more of both.
   The template doesn't change — the content density does.

3. SENSITIVE VALUES: Never hardcode hosts, IPs, credentials,
   or environment-specific paths in the spec. Use ${VAR_NAME}
   references and put actual values in .spec.env (gitignored).

4. RIDERS: Modular constraint sets that attach additional
   requirements. Don't pre-author riders speculatively — extract
   them when you find yourself repeating constraints across specs.
   Riders live in a shared location, not inside project repos.

5. DELIVERABLES vs ACCEPTANCE CRITERIA:
   - Deliverables = WHAT the agent must produce (contracts)
   - Acceptance Criteria = HOW we verify it's correct (tests)
   - Every deliverable should have at least one acceptance criterion

6. SOURCE OF TRUTH: Documents listed here are mandatory reading
   for the agent before starting work. This prevents the agent
   from making assumptions that contradict existing decisions.

7. DECISION LOG: Pre-made choices the agent must respect. This
   is NOT a place for the agent to log its own decisions during
   work — it's human-provided constraints.

8. SPEC DIRECTORY STRUCTURE:
   spec/
   ├── README.md                    # Spec index
   ├── IMPLEMENTATION.md            # Master control (optional)
   ├── wu-01-description/
   │   └── README.md                # This template
   ├── wu-02-description/
   │   └── README.md
   └── .spec.env                    # Gitignored sensitive values

9. RELATIONSHIP TO STUBS: You don't point agents at stubs.
   You point agents at specs that reference stubs. The spec is
   the work contract. The stub is the deliverable location.
-->
