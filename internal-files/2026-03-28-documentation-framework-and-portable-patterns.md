# Documentation Framework, Transparency Model, and Portable Patterns

**Domain:** Documentation strategy, content typing, public documentation philosophy
**Status:** Validated decisions (content_type tagging) + horizon concept (portable patterns)
**Date:** 2026-03-28
**Version:** 1.0

---

## Vision

Layer a lightweight content framework onto the existing template system to guide Phase 2 writing, formalize the "our docs are your docs" transparency model, and capture the long-term concept of extracting portable architectural patterns from the reference implementation for reuse on any GPU-capable platform.

---

## Decision 1: Content Type Tagging (Validated)

### Problem

The General KB template is a flexible catch-all. Everything that isn't an asset sheet, policy, procedure, runbook, or WU spec lands there. A lookup table of Prometheus alert rules, an explanation of HEALPix tessellation, and a step-by-step guide for Docker volume relocation all use the same template. Writers (human or agent) need a signal for what *mode* the content should be written in.

### Framework Survey

| Framework | Origin | Core Model | Fit Assessment |
|-----------|--------|------------|----------------|
| Diataxis (Procida) | Software docs | 4 quadrants: Tutorial, How-to, Reference, Explanation | Good taxonomy, widely adopted. Tutorial quadrant likely unused in this repo. |
| DITA | Enterprise/XML | 5 types: Concept, Task, Reference, Glossary, Troubleshooting | Typing philosophy is valuable. XML infrastructure is overkill. |
| Information Mapping (Horn) | Regulated industry | 6 types: Procedure, Process, Principle, Concept, Structure, Fact | Influenced DITA. Too granular for our needs. |
| Every Page is Page One (Baker) | Design philosophy | Self-contained, navigable topics | Aligns with interior README pattern. Not a taxonomy. |
| Good Docs Project | Community templates | Template-first with fill patterns | Similar to what we already do. |

### Decision

Add a `content_type` frontmatter tag to the controlled vocabulary with three values:

| Value | Mode | Characteristics | Example Content |
|-------|------|----------------|-----------------|
| `reference` | Lookup | Terse, complete, optimized for finding specific facts | Service endpoint tables, configuration parameter catalogs, network topology docs |
| `explanation` | Context | Narrative, conceptual, connects architectural decisions to reasoning | Why the monitoring stack is architected this way, how DESI pipeline stages relate |
| `how-to` | Procedural + rationale | Steps with "Why We Do This" section, lighter than runbooks | Docker volume relocation, LACP bond setup, PostgreSQL exporter configuration |

### Why Not Four (Diataxis Complete)

Tutorials (learning-oriented, controlled outcome, hand-holding) are not a content type this repo produces. If onboarding content emerges later, the value can be added. Starting with three avoids an empty bucket.

### Relationship to Existing Templates

`content_type` is orthogonal to `type`. The `type` tag says which template was used (kb-article, asset-sheet, procedure, etc.). The `content_type` tag says what writing mode the content is in. Only applies to `type: kb-article` since other templates already imply their content mode.

```
type: kb-article        ← template selection
content_type: how-to    ← writing mode within that template
```

### The Wiki/How-to Directory

The old repo's `wiki/` directory is the canonical example of `content_type: how-to`. Every article follows: title, "Why We Do This," prerequisites, step-by-step, verification, troubleshooting, related articles. In the new repo, the `how-to-guides/` directory (already stubbed) carries this content forward. The directory name and the frontmatter tag reinforce each other.

---

## Decision 2: Transparency Model (Validated)

### The Concept

Most open source projects publish code and API docs. Internal operational knowledge stays in Confluence or someone's head. This repo inverts that: the documentation IS a first-class deliverable alongside the code. External readers get the actual operational knowledge base, not a sanitized summary.

### Security Boundary Analysis

Conventional wisdom says "never publish internal IPs." The reasoning assumes those IPs are reachable. Actual threat model for this cluster:

| Factor | State |
|--------|-------|
| Inbound ports | Zero |
| ZTNA | Netbird, all connections outbound-initiated |
| Public services on cluster | None |
| VPN/remote access | Netbird only, no traditional VPN concentrator |

**If an attacker is already inside** (Netbird compromise, device compromise), they discover topology in minutes via `ip route`, `arp -a`, subnet scanning. A published IP map saves them trivial discovery time while they have much larger problems to exploit.

**Counterarguments considered:**

- Social engineering fuel: narrow threat for a single-operator lab, requires non-network attack vector
- Future misconfiguration: valid, but mitigated by "update docs if exposure model changes" discipline
- ZTNA compromise acceleration: at that point, topology is the least of your concerns

### The Boundary

| Publish Freely | Redact Always |
|---------------|---------------|
| IP addresses, VLAN schemes | Credentials, passwords, API keys |
| Hostnames, network topology | Certificate private keys |
| Hardware specifications | Service account secrets |
| VLAN segmentation design | SNMP community strings |
| Software versions, configurations | `.env` file contents |
| Architectural decisions and rationale | Anything that authenticates or authorizes |

**Credentialing pattern:** `.env` files are gitignored. `.env.example` files show structure without values. This is the only boundary needed.

### Why This Matters

The "Why We Do This" pattern in how-to articles is what makes public docs valuable. Without rationale, a Docker volume migration guide competes with a thousand blog posts. With it, readers get operational reasoning from a real environment: why volume isolation matters in a multi-node research cluster, why the pattern is standardized across every VM. That context is the differentiator.

---

## Horizon Concept: Portable Patterns (Idea Stage)

### The Observation

The specific cluster documentation (radio-mon01 at IP X on node05) is a reference implementation. The transferable value is the pattern layer: how to stand up a scientific computing environment with monitoring, how to structure data pipelines, why you isolate Docker volumes on dedicated storage.

### Hardware Floor Is Lower Than It Looks

The DESI analysis, spectroscopy work, and anomaly detection pipelines need a decent GPU and enough RAM for working datasets. The six-node cluster provides availability, isolation, and headroom, but the minimum viable path is significantly smaller.

| Profile | Hardware | Use Case |
|---------|----------|----------|
| Single-node | One box with 16G+ VRAM GPU (e.g., 4070 Ti, A4000) | Individual researcher, full stack on one machine |
| Cloud-ephemeral | Runpod/Lambda instance per session | Burst compute, no persistent infrastructure |
| Multi-node | 2+ nodes with shared storage | Small team, availability, workload isolation |

### What Extraction Looks Like

The `content_type` tagging built now directly enables future extraction:

- `explanation` articles are already the most portable (reasoning, not specifics)
- `how-to` articles are portable with minor adaptation (swap hostnames, adjust paths)
- `reference` articles are least portable but serve as concrete examples of what other profiles need to produce

### Prerequisites (Being Built Now)

- Stable documentation with `content_type` tagging (in progress)
- Settled infrastructure post-Phase 1 rewrite
- Enough how-to and explanation articles to form a coherent package
- Clear separation between "this is our specific config" and "this is the pattern"

### Not Near-Term

This is a post-stabilization project. Capturing it now so the documentation decisions being made today don't accidentally make extraction harder later. The current trajectory (content typing, public-by-default, rationale-rich writing) is aligned.

---

## Scope

**In scope (decided):**
- `content_type` tag with three values added to frontmatter vocabulary
- Transparency boundary: publish topology, redact credentials
- How-to-guides directory carries the wiki pattern forward

**Out of scope (separate efforts):**
- Updating `frontmatter-tagging-vocabulary.md` with `content_type` (do during next template sync)
- Portable patterns extraction (post-stabilization)
- Determining if/how the repo could be packaged for reuse

**Open questions:**
- Does `content_type` need formal addition to the tagging strategy doc, or just the vocabulary? Probably both, briefly.
- Should the how-to "Why We Do This" section be formalized as guidance in the General KB template, or left as convention? Convention is likely sufficient since the wiki articles already demonstrate the pattern.

---

## Next Steps

1. Add `content_type` to `frontmatter-tagging-vocabulary.md` (reference, explanation, how-to)
2. Add brief guidance to tagging strategy doc explaining the category
3. Apply during Phase 2 writing as articles are created
4. Revisit portable patterns concept when repo stabilizes

---

## Document Info

| | |
|---|---|
| Author | VintageDon |
| Created | 2026-03-28 |
| Version | 1.0 |
| Status | Active |

## Sources

- Claude.ai project conversation, 2026-03-28 (documentation framework discussion)
- Old repo wiki articles at `proxmox-astronomy-lab-old/wiki/` (content pattern analysis)
- Diataxis framework (https://diataxis.fr/)
- Prior session context: `internal-files/2026-03-22-rewrite-session-context-one-pager.md`
