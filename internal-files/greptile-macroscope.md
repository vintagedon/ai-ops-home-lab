# Greptile / Macroscope — Service One-Pager

**Status:** Active  
**Tier:** Open Source Program (sponsored, paid plan)  
**Domain:** radioastronomy.io GitHub organization  
**Setup Date:** 2025-01-01  

---

## What It Is

Greptile provides AI-powered code review and codebase understanding. Macroscope is their engineering analytics layer that auto-generates sprint summaries, tracks coding time by project, and categorizes work into strategic Areas.

Replaces: CodeRabbit (which only did weekly rollups)

## Access

- **URL:** https://app.greptile.com
- **Auth:** GitHub OAuth (radioastronomy.io org)
- **Indexed Repos:** 12 (all public + analysis-ready-datasets private)

## Global Settings

| Setting | Value | Rationale |
|---------|-------|-----------|
| Summarize PRs on GitHub | ✅ On | Auto-posts summaries to PR descriptions |
| Code Review: Correctness | ✅ On | Reviews for logical errors and bugs |
| Code Review: Custom Rules | ✅ On | Enforces macroscope.md rules per-repo |
| Auto-assign Reviewer | ❌ Off | Small team, not needed |
| Skip Dependabot | ❌ Off | Not currently using Dependabot |
| Release Ref Patterns | Empty | No formal release tagging in use |
| Default Branch | main | Standard |

## Skip PR Labels

GitHub label `no-code-review` configured — apply to PRs that should bypass Macroscope review (docs-only, automated changes).

## Areas (Strategic Groupings)

Areas categorize coding activity for rollup reporting. Higher-level than repos.

| Area | Repos | Purpose |
|------|-------|---------|
| **Research Computing** | desi-cosmic-void-galaxies, desi-quasar-outflows, desi-qso-anomaly-detection, rbh1-validation-reanalysis | Core DESI science work |
| **Data Infrastructure** | astronomy-rag-corpus, analysis-ready-datasets | Shared pipelines, RAG corpus, ARDs |
| **Platform & Operations** | proxmox-astronomy-lab, meshworks | IaC, Kubernetes, agent orchestration |
| **Public Presence** | radioastronomyio-website, aimodels-wiki, .github | Website, model cards, org profile |
| **Experimental** | year-of-code-2026 | Sandbox, learning, prototypes |

### Area Descriptions (as configured in Greptile)

**Research Computing**  
Core astronomical research and scientific computing projects. DESI spectroscopy analysis, cosmic void research, quasar detection and anomaly identification, black hole physics validation studies. Processing DESI DR1 survey data, statistical analysis of galaxy distributions, Bayesian inference and GPU-accelerated scientific computing.

**Data Infrastructure**  
Shared data pipelines, knowledge systems, and analysis-ready datasets supporting multiple downstream research projects. Federated Knowledge Core (RAG corpus), Analysis-Ready Datasets (ARDs), database architecture for astronomical catalogs (PostgreSQL, Neo4j, pgvector), vector embeddings and semantic search infrastructure.

**Platform & Operations**  
Infrastructure-as-code, cluster management, observability, and operational tooling. Proxmox virtualization, Kubernetes (RKE2) orchestration, Prometheus/Grafana observability, MCP server orchestration, AI agent control planes, CIS compliance baseline.

**Public Presence**  
External-facing websites, documentation, and resources for collaborators, funding agencies, and research community. Website development (Astro, Tailwind, Azure Static Web Apps), AI model cards, responsible AI documentation, GitHub org profile.

**Experimental**  
Sandbox projects, learning experiments, prototypes not tied to specific research goals. Reinforcement learning experiments, new framework evaluation, agentic coding experiments.

---

## CIS v8.1 Considerations

Greptile is a third-party SaaS with read access to all indexed repositories. Relevant controls:

- **CIS 15 (Service Provider Management)** — Third-party service with code access
- **CIS 16 (Application Software Security)** — Code review tooling

Current posture: Acceptable for open-source research repos. Review if private/sensitive repos are added.

---

## Key Decisions

1. **Chose Greptile over CodeRabbit** — Better sprint summaries, project-level analytics vs weekly rollups only
2. **All 12 repos indexed** — Full org visibility
3. **Areas by strategic function, not by repo** — Enables "where is effort going" reporting
4. **No release ref patterns** — Research repos don't follow semver tagging
5. **Skip label configured** — Escape hatch for docs/automation PRs

---

## Related Files

- Full Area definitions: See `/mnt/user-data/outputs/greptile-areas.md` (exported during setup)
- Per-repo rules: `macroscope.md` in each repo root (if custom rules needed)

---

*Last updated: 2025-01-01*
