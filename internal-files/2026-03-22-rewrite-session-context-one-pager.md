# Proxmox Astronomy Lab Rewrite — Session Context (2026-03-22)

**Domain:** Repository documentation rewrite, template alignment, infrastructure documentation
**Status:** Active — RAV complete on templates, ready for generation
**Date:** 2026-03-22
**Version:** 2.0

---

## Vision

Align the proxmox-astronomy-lab documentation standards to the evolved project-template-repository patterns, create the full template set (including spec-as-code and runbook templates), then frame out stub files across the entire repo so ClaudeCode Opus can hydrate them at scale during an Anthropic unlimited-usage promotional window (ends 2026-03-27). The mon01 monitoring VM asset sheet is the first test conversion through the aligned pipeline.

---

## Ecosystem Architecture (Critical Context)

Four repositories form a hierarchy. Understanding this prevents template drift.

```
project-template-repository (canonical base — copy, delete .git, hydrate)
  ↓ inherits
ethops (adds governance: policy, procedure, code commenting, milestones procedures)
  ↓ informs
proxmox-astronomy-lab (adds domain-specific: asset sheet, spec, runbook, frontmatter vocabulary)
```

| Repository | Role | Current State |
|------------|------|---------------|
| **project-template-repository** | Universal base scaffolding | Most mature general templates. Source of truth for KB, interior README, script headers, worklog, tagging strategy. |
| **ethops** | ITIL-driven autonomous DevOps framework | `src/` is empty. Validated architecture, portfolio/acquisition piece. Added policy + procedure templates. All spec work, nothing runs. |
| **nist-ai-rmf-cookbook** | AI governance operational implementation | Pacific AI Suite (organizational) → Cookbook (operational) → CIS-RAM (risk methodology) → CISv8 IG1 (56 safeguards). Transitioning from homebrew v0.2 to Pacific AI as policy layer. |
| **proxmox-astronomy-lab** | Where the actual work lives | 95% locked infrastructure. Phase 1 rewrite in progress. Templates are 3 months stale vs project-template. |

---

## Infrastructure State (Locked as of 2026-03-21)

The authoritative VM inventory is at `infrastructure/virtual-machine-infrastructure-table.md`.

Key facts:
- 6 active Proxmox nodes (node01-node06), node07 → bare metal ML01
- All hostnames `radio-*` (renamed in Proxmox, not yet on VMs)
- K8s decommissioned (3001-3003 deleted)
- ML01 (5950X/128G/A4000) — bare metal, agent orchestration, local LLM inference, CUDA
- node04 = new service tier: itop01 (planned), auto01 (planned), repo01 (planned)
- agents01, gpu01 pending decommission (data hold only)
- node05 oversubscribed at 138% vCPU — rebalance candidate
- radio-mon01 on node05: 4 vCPU, 12G RAM, 32G+500G, Prometheus/Grafana/Loki/Alertmanager

The cluster re-architecture is operational model, not infrastructure. Most VMs stay. The shift: K8s → bare metal ML, move toward agent-based ops (ethops model), focus on research (anomaly detection, DESI analysis, auto-ML). Next concrete infrastructure step: repo01 (Gitea).

---

## Template System — Complete Picture

### The Problem

Three-way drift exists between repos. The proxmox-astronomy-lab templates (December 2025) are 3 months stale relative to the project-template-repository and ethops evolution (March 2026).

### The Solution

Align proxmox-astronomy-lab's `docs/documentation-standards/` to project-template as authoritative base, add governance templates from ethops, and create lab-specific templates (asset sheet, spec, runbook, frontmatter vocabulary).

### Template Taxonomy — What Each Template IS

| Template | Function | Source |
|----------|----------|--------|
| **General KB** | Documents what IS (guides, references, reports) | project-template (replace current rigid version) |
| **Asset Sheet** | Documents what EXISTS (trackable infrastructure things) | This repo only (keep, minor modifications) |
| **WU Spec** | Documents what MUST BE PRODUCED (agent work contracts) | NEW — from spec-as-code practice |
| **Runbook** | Documents HOW TO DO (tactical ops with commands) | NEW — lighter than procedure |
| **Procedure** | Documents HOW WE DO (governance SOPs with RACI) | ethops (port) |
| **Policy** | Documents WHAT WE COMMIT TO (governance commitments) | ethops (port) |
| **Interior README** | Documents WHAT'S HERE (directory self-documentation) | project-template (update current) |
| **Primary README** | Documents WHAT THIS PROJECT IS (repo root only) | project-template (port) |
| **Worklog README** | Documents WHAT WAS DONE (milestone directories) | project-template (port) |
| **Tagging Strategy** | Methodology for building tag vocabularies | project-template (port) |
| **Frontmatter Vocabulary** | Concrete tag values for THIS repo | This repo only (update) |
| **Script Headers** | Python, Bash, PowerShell file headers | project-template (port) |
| **Code Commenting** | Dual-audience commenting standard | ethops (port) |

### Template Selection Tree (Updated)

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

## Template Work — Concrete Task List

### Files to CREATE (new)

| File | Source/Basis | Notes |
|------|-------------|-------|
| `wu-spec-template.md` | Spec-as-code one-pager + planegraph working examples | Outcomes + tests + context. Granularity dial concept. Rider references. .env pattern for sensitive values. |
| `runbook-template.md` | New — thin tactical ops template | Purpose, prerequisites, steps (with commands), verification, rollback. No RACI, no compliance mapping. `type: runbook` already in vocabulary. |
| `primary-readme-template.md` | Copy from project-template | Repository root README pattern |
| `worklog-readme-template.md` | Copy from project-template | Milestone directory pattern |
| `tagging-strategy.md` | Copy from project-template | Meta guide for building vocabularies (methodology) |
| `script-header-python.md` | Copy from project-template | Python file header standard |
| `script-header-shell.md` | Copy from project-template | Bash file header standard |
| `script-header-powershell.md` | Copy from project-template | PowerShell file header standard |
| `code-commenting-dual-audience.md` | Copy from ethops | Human + AI commenting methodology |
| `policy-template.md` | Copy from ethops | Tier 1 governance commitments |
| `procedure-template.md` | Copy from ethops | Tier 2-3 governance SOPs |

### Files to MODIFY (existing)

| File | Changes |
|------|---------|
| `general-kb-template.md` | Replace rigid 4-section version with flexible project-template version (wrapper §1-3, content §4+, floating N/N+1) |
| `interior-readme-template.md` | Minor sync to project-template version (close enough currently, but align frontmatter and usage notes) |
| `asset-sheet-template.md` | Add §3.4 Automation & Agent Access subsection (agent persona, access level, authorized actions table). Keep fixed 6-section structure — it's heading for DB extraction and benefits from rigidity. |
| `frontmatter-tagging-vocabulary.md` | (was `frontmatter-tagging-standards.md`) — Restructure as implementation of tagging-strategy pattern. Add domain values: `automation`, `agents`. Add tech values as needed for new services. Add spec-related type values. |
| `README.md` (directory README) | Complete rewrite to reflect full 13-template inventory, updated selection tree, core principles |

### Files to DELETE or RELOCATE

| File/Directory | Action | Reason |
|---------------|--------|--------|
| `compliance/templates/` contents | Delete or replace with reference | Stale rigid templates — `docs/documentation-standards/` is the single source |

---

## Spec-as-Code Integration

Specs are central to the CC hydration strategy. The spec-as-code practice (documented in `ethops/internal-files/spec-as-code-practice-one-pager.md`) defines specs as:

1. **A list of well-structured outcomes** — what the agent must produce
2. **Tests to assure those outcomes** — runnable commands with expected results
3. **Context to prevent sideways drift** — objective, environment, decision log, non-goals

The granularity dial: same template structure whether the spec says "give me a monitoring stack" or "give me Prometheus 2.x with these scrape targets, CISv8 IG1 hardened, 500G retention, fitting in 12G RAM." Content density changes, template doesn't.

Rider composition: CISv8 IG1 hardening doesn't get re-specified in every spec — it attaches as a modular constraint set from a shared spec library. CIS rider acceptance criteria ARE compliance evidence when they pass.

The `spec/` directory in this repo holds public specs. `spec-internal/` (gitignored) holds private specs. The WU spec template enables CC to read a spec, implement against it, and have success criteria that are runnable validation — not vibe coding.

**Key insight:** You don't point CC at stubs. You point CC at specs that reference stubs. The spec is the work contract. The stub is the deliverable location.

---

## Compliance Architecture (In This Repo)

The compliance directory IS the operational deployment of the cookbook's policy stack:

```
compliance/
├── policies/                    # AI governance policy, acceptable use
│   ├── 01-ai-governance-policy.md
│   ├── ai-acceptable-use-policy-formal.md
│   └── Policies-Working/       # Staging area (stale?)
├── standards/                   # Risk assessment, secure AI, transparency
│   ├── 02-ai-risk-assessment-standard.md
│   ├── 03-secure-ai-systems-standard.md
│   └── 04-ai-transparency-disclosure-standard.md
├── risk-management/
│   └── risk-scenarios/          # R01-R10 operational risk library
├── ai-model-registry/           # Model cards live here
├── policy-appendices/           # Crosswalk, glossary, charter, etc.
├── evidence/                    # Empty — CISv8 IG1 evidence artifacts future home
├── backups/                     # Empty
└── templates/                   # STALE — delete or replace with reference
```

Evidence chain: asset sheets (per-VM CIS §4) → compliance/evidence → compliance/standards → compliance/policies. CISO Assistant tracks the control matrix; repo holds evidence artifacts.

Agent governance: deployed agent model cards → `compliance/ai-model-registry/`. Risk classification through R-scenario framework. Go/No-Go checkpoint from Pacific AI lifecycle documented in `compliance/evidence/`. AI policy rewrite is a separate independent effort — excluded from this rewrite scope.

---

## Repo Structure Updates (Completed or Needed)

| Change | Status |
|--------|--------|
| `.kilocode/` deleted | ✅ Done — uses AGENTS.md now |
| `.ai-sandbox/` deleted | ✅ Done |
| `.internal-files/` → `internal-files/` | ✅ Done |
| `spec/` directory | Needed — public specs |
| `spec-internal/` (gitignored) | Needed — private specs |
| `compliance/templates/` cleanup | Needed — delete stale contents |
| `README-pending.md` files across compliance | Needed — convert to proper READMEs or stubs |

---

## Execution Sequence

1. **Template alignment** — create/modify/port all templates in `docs/documentation-standards/` per the task list above
2. **WU spec template creation** — the template that enables everything else
3. **Stub frameout** — create properly-frontmattered placeholder files across the entire repo structure
4. **Write specs for CC hydration** — WU specs that reference stubs, define outcomes and tests
5. **mon01 asset sheet** — first test conversion through aligned pipeline
6. **mon01 config update spec** — WU spec for CC to update monitoring targets
7. **CC Opus parallel hydration** — subagents working specs concurrently during unlimited window

### Time Constraint

Anthropic unlimited usage promotion ends 2026-03-27. Template alignment and spec creation are the critical path — CC can't hydrate without clean templates and specs to work against.

---

## Key Decisions Made

| Decision | Reasoning |
|----------|-----------|
| Project instructions updated to v2.0 | Old instructions encoded rigid 4-section template superseded by project-template evolution |
| Templates align to project-template as authority | Canonical base; this repo adds domain-specific extensions |
| Asset sheet keeps fixed 6-section structure | Heading for DB extraction; structured data benefits from rigidity |
| Asset sheet gets agent access subsection (§3.4) | Agents operating against assets need per-asset RBAC documentation |
| WU spec template created (new) | Spec-as-code is the CC hydration mechanism — outcomes + tests, not stubs alone |
| Runbook template created (new) | Gap between governance procedures (RACI) and tactical ops (commands). Runbook fills it. |
| Compliance directory stays as cookbook deployment | Not duplicating — this IS where governance artifacts are operationalized |
| AI policy rewrite explicitly excluded | Separate independent effort, not part of this doc rewrite |
| `compliance/templates/` gets cleaned | Stale rigid templates; `docs/documentation-standards/` is the single source |
| Frontmatter vocabulary adds agent/automation tags | Domain values needed as agent documentation is created |
| Spec-as-code: specs reference stubs, not the other way around | CC works from specs (contracts with tests), stubs are deliverable locations |

---

## Resolved Questions

| Question | Resolution |
|----------|-----------|
| Asset sheet rigidity vs flexibility | Keep rigid. DB extraction needs predictable structure. |
| Do current templates need additions? | Yes: asset sheet §3.4 agent access, frontmatter vocab agent tags, linting metadata in frontmatter (future, not blocking) |
| Do we need more templates? | Yes: WU spec template (spec-as-code), runbook template (tactical ops). No: CIS evidence template (premature, use KB for now) |
| Frontmatter vocabulary restructure | Keep concrete values AND port tagging-strategy guide. Vocabulary implements the strategy. Both needed. |
| `compliance/templates/` disposition | Delete stale contents, reference `docs/documentation-standards/` |

---

## Source Material Locations

| Source | Path | Use |
|--------|------|-----|
| Current repo | `D:\development-repositories\proxmox-astronomy-lab\proxmox-astronomy-lab\` | Working directory |
| Old repo | `D:\development-repositories\proxmox-astronomy-lab\proxmox-astronomy-lab-old\` | Legacy data for conversion |
| Project template | `D:\development-repositories\project-template-repository\` | Canonical template source |
| Ethops | `D:\development-repositories\ethops\` | Governance templates, architecture specs |
| Cookbook | `D:\development-repositories\nist-ai-rmf-cookbook\` | Policy stack, model cards |
| Spec-as-code one-pager | `ethops/internal-files/spec-as-code-practice-one-pager.md` | WU spec template basis |
| Planegraph specs (working examples) | `planegraph-aviation-tracker/spec/` | Real-world spec-as-code pattern |
| VM inventory | `infrastructure\virtual-machine-infrastructure-table.md` | Authoritative infrastructure state |
| Old mon01 | `proxmox-astronomy-lab-old\virtual-machines\vm-2008-proj-mon01.md` | Legacy asset sheet for conversion |
| Ethops node matrix | `ethops\spec\node-utilization-matrix.md` | Resource utilization reference |

---

## Document Info

| | |
|---|---|
| Author | VintageDon + Claude (Opus 4.6) |
| Created | 2026-03-22 |
| Updated | 2026-03-22 |
| Version | 2.0 |
| Status | Active — template decisions complete, ready for generation |
| Lineage | Extended RAV session reviewing four-repo ecosystem, template drift analysis, compliance architecture, spec-as-code integration, and infrastructure state. Project instructions updated to v2.0. All template decisions resolved. |
