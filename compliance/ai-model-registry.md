# AI Model Registry

**Version:** 1.0  
**Effective Date:** 2025-10-26  
**Last Review:** 2025-10-26  
**Next Review:** 2026-04-26

---

## Purpose

This registry documents all AI models reviewed and approved for organizational use, maintaining alignment with our **AI Governance Crosswalk** (Appendix A). It serves as the operational reference for model selection tied to the **Role-Based AI Stack**.

**Framework Alignment:** All approved models have been assessed against:
- **NIST AI RMF** trustworthiness characteristics
- **CIS Controls v8.1 (IG1)** technical control baseline
- **Colorado SB-205** voluntary high-risk deployer duties

Models not listed as approved have not been validated against the crosswalk and must not be used for organizational work.

---

## Approved Models (Active Use)

All models in this section have been validated using the methodology defined in the **AI Crosswalk Validation Guide** and documented in detailed model cards.

### Gemini 2.5 Pro

**Model Identifier:** `gemini-2.5-pro`  
**Role:** Work Fabric (Everyone)  
**Access Method:** Google Workspace Enterprise (AI Studio, Docs, Gmail, Meet, Drive)

**Use Cases:**
- Day-to-day chat, drafting, research, and analysis
- Workspace-native tasks (summaries, meeting notes, document linting, inbox triage)
- Code assistance for internal work with Public-Internal data

**Data Classification Boundary:** Public-Internal only  
**Access Control:** Workspace Enterprise SSO, MFA, centralized admin

**Governance Alignment:**
- **NIST AI RMF:** Secure, Privacy-Enhanced (training opt-out by contract via Google Workspace Enterprise accounts)
- **CIS v8.1 IG1:** Audit logging via Workspace (Control 8.09), Identity management (Controls 5.x, 6.x)
- **SB-205:** Public-Internal data boundary enforced; organizational audit trail maintained

**Economic Model:** Unlimited usage within Workspace subscription; 1M token context window  
**Knowledge Cutoff:** January 2025

**Model Card:** `[link to gemini-2.5-pro-model-card.yaml]`

---

### Gemini CLI (with Code Assist Standard)

**Model Identifier:** `gemini-2.5-pro` (via CLI)  
**Role:** Automation Agent  
**Access Method:** Gemini CLI with Code Assist Standard

**Use Cases:**
- Scheduled research briefs and operational reports
- Repository hygiene, document linting, evidence packaging
- GCP infrastructure control via RBAC service accounts
- CI/CD integration and scripted runbooks

**Data Classification Boundary:** Public-Internal only  
**Access Control:** RBAC service accounts with least privilege, enterprise authentication

**Governance Alignment:**
- **NIST AI RMF:** Accountable (service account-based RBAC), Transparent (all calls logged)
- **CIS v8.1 IG1:** Least privilege access (Control 6.x), Configuration management (Control 4.x), Audit logging (Control 8.09)
- **SB-205:** Automated processes documented in impact assessments; audit trail for compliance

**Economic Model:** 120 requests/minute on free tier; effectively unlimited for current operational load  
**Knowledge Cutoff:** January 2025

**Model Card:** `[link to gemini-cli-model-card.yaml]`

---

### Claude Sonnet 4

**Model Identifier:** `claude-sonnet-4-20250514`  
**Role:** Editor-in-Chief (CTO Only)  
**Access Method:** Claude.ai (isolated workspace)

**Use Cases:**
- Governance artifact synthesis and final polish (policies, standards, board-facing documents)
- Complex reasoning requiring nuanced iteration
- Protected data processing in isolated CTO workspace only

**Data Classification Boundary:** Public-Internal and Protected (CTO workspace only)  
**Access Control:** Single CTO account, isolated workspace, no organizational sharing

**Governance Alignment:**
- **NIST AI RMF:** Accountable (single-user isolation), Transparent (usage within bounded workspace)
- **CIS v8.1 IG1:** Access control via single credential (Control 6.x), audit trail via account activity
- **SB-205:** High-stakes documents reviewed by human (CTO) before publication; isolated processing for Protected data

**Economic Model:** $100/month professional subscription; effectively unlimited for single-user use  
**Knowledge Cutoff:** January 2025

**Model Card:** `[link to claude-sonnet-4-model-card.yaml]`

---

### Z.ai

**Model Identifier:** `z.ai` (specific version TBD in model card)  
**Role:** Public Code Workhorse (Engineer Role Only)  
**Access Method:** Z.ai platform

**Use Cases:**
- External repository contributions (OSS, community projects)
- Rapid prototyping on public datasets bound for publication
- Pull request reviews on repos not under organizational control
- Test generation and scaffolding for upstream contributions

**Data Classification Boundary:** Public-External ONLY  
**Access Control:** Engineer role assignment; organizational repos explicitly prohibited

**Governance Alignment:**
- **NIST AI RMF:** Transparent (used only for public work), Accountable (role-gated access)
- **CIS v8.1 IG1:** Access control via role assignment (Control 6.x)
- **SB-205:** Public-External boundary prevents impact on organizational deployer duties

**Economic Model:** Free tier for current usage patterns  
**Knowledge Cutoff:** [TBD in model card]

**Critical Restriction:** Z.ai trains on submitted data. This model is **strictly prohibited** for any organizational repository (Public-Internal) or Protected data. Violation of this boundary is a security incident.

**Model Card:** `[link to z-ai-model-card.yaml]`

---

### Llama-3-7B (Local Deployment)

**Model Identifier:** `meta-llama/Llama-3-7b`  
**Role:** Privacy & Edge Computing  
**Access Method:** Local deployment on A4000 GPU (agents01 cluster)

**Use Cases:**
- Protected data processing requiring air-gap assurance
- Sensitive configuration linting and refactoring
- Offline experiments and tooling where privacy trumps model capability
- Fallback path during vendor outages or policy shifts

**Data Classification Boundary:** Protected and Public-Internal  
**Access Control:** Physical hardware access, least-privilege OS-level controls

**Governance Alignment:**
- **NIST AI RMF:** Secure (air-gapped deployment), Privacy-Enhanced (zero egress by design)
- **CIS v8.1 IG1:** Physical/network isolation (Control 12.x), Access control (Control 6.x)
- **SB-205:** Architectural certainty for Protected data processing; no external API dependency

**Economic Model:** Hardware cost only (one-time); no per-inference cost  
**Knowledge Cutoff:** Model training date (static)

**Model Card:** `[link to llama-3-7b-local-model-card.yaml]`

---

## Pending Review (Not Yet Validated Against Crosswalk)

The following models are accessible in our ecosystem but have **not been assessed** for alignment with our AI Governance Crosswalk (Appendix A). 

**Do not use these models for organizational work until validation is complete.**

### Google AI Studio Model Variants

**Models:**
- Gemini 2.5 Flash (`gemini-2.5-flash`)
- Gemini 2.5 Flash-Lite (`gemini-2.5-flash-lite`)
- Gemini Flash Latest (`gemini-flash-latest`)
- Gemini Flash-Lite Latest (`gemini-flash-lite-latest`)
- Nano Banana / Flash Image (`gemini-2.5-flash-image`)

**Why Pending:**
- Multiple variants create selection confusion without clear use case mapping
- Pricing, context window, and capability differences need operational testing
- Selection discipline (when to use which variant) must be established
- Framework alignment validation needed for each variant's characteristics

**Economic Note:** Available via AI Studio web interface with unlimited usage and 1M context window, but operational patterns and governance boundaries not yet defined.

---

### Image Generation Models

**Models:**
- Imagen 4 (`imagen-4.0-generate-001`)
- Imagen 4 Ultra (`imagen-4.0-ultra-generate-001`)

**Why Pending:**
- Use case boundaries unclear (internal communications vs. marketing materials)
- Training opt-out policy for generated images needs definition
- Integration with organizational brand and visual standards requires review
- SB-205 transparency implications for AI-generated imagery need assessment

**Economic Note:** Available via AI Studio web interface with unlimited usage, but governance framework not yet applied.

---

### Jules (Async Development Agent)

**Model:** `jules.ai` (integrated with Workspace Enterprise)

**Why Pending:**
- Overlap with Gemini CLI for automation needs clarification
- Task limits (15-300/day depending on tier) and concurrent work patterns need operational testing
- GitHub integration security posture requires review
- Role assignment criteria need definition (who gets Jules access and why)
- Framework alignment for async agent workflows not yet validated

**Economic Note:** Free tier (15 tasks/day) available; Pro tier ($20/mo, 100 tasks/day) and Ultra tier ($40/mo, 300 tasks/day) not yet evaluated for organizational need.

---

### NotebookLM

**Model:** NotebookLM (via Google Workspace)

**Why Pending:**
- Scope boundary with "work fabric" Gemini needs operational definition
- Research workflow integration patterns need mapping to actual use cases
- Audio Overviews feature (5x more in Pro tier) requires evaluation
- Framework alignment for research synthesis workflows not yet validated

**Economic Note:** Available in Workspace; Pro tier benefits need assessment against operational needs.

---

### Review Trigger

Models move from **Pending Review** to **Approved** when:

1. **Specific use case emerges** that cannot be satisfied by currently approved models
2. **Validation against Crosswalk** using methodology in AI Crosswalk Validation Guide
3. **Framework alignment documented:**
   - NIST AI RMF trustworthiness characteristics satisfied for intended use
   - CIS v8.1 IG1 technical controls documented and enforceable
   - SB-205 deployer duties assessed and addressed (if applicable)
4. **Model card created** documenting validation findings and operational boundaries
5. **Cost/benefit analysis** if model requires paid tier or API usage

**Process Owner:** CTO  
**Escalation Path:** Drop notification to `staging/` or raise directly when use case emerges

---

## Cost Discipline & Economic Strategy

Our model selection prioritizes **free or fixed-cost tiers** to maintain budget predictability and avoid usage-based billing complexity.

**Current Economics:**
- **Gemini 2.5 Pro (Workspace):** Unlimited usage, included in Workspace Enterprise subscription
- **Gemini CLI:** 120 req/min free tier, sufficient for current automation load
- **Claude:** $100/month fixed cost, single CTO seat
- **Z.ai:** Free tier for current Public-External usage
- **Llama-3-7B:** Hardware cost only (one-time), no recurring inference cost

**Cost Triggers for Review:**
- Pending models requiring paid API access
- Usage patterns exceeding free tier limits
- Additional seats/licenses for multi-user tools

This strategy keeps AI operational costs predictable and tied to value delivery, not token counting.

---

## Restricted Models

### Personal AI Accounts

**Status:** Prohibited  
**Reason:** Audit trail, data governance, and training opt-out enforcement require enterprise SSO and centralized administration. Personal accounts (Google, Claude, etc.) do not satisfy CIS v8.1 IG1 identity and access management controls.

---

### Non-Enterprise Claude Access

**Status:** CTO workspace only  
**Reason:** Protected data processing requires isolation. Cost discipline requires limiting seats. Editorial control function benefits from single decision-maker pattern.

---

## Model Selection Decision Tree

**Question 1: What is the data classification?**
- **Secrets** → Never use AI (per AUP)
- **Protected** → Local models OR Claude (CTO isolated workspace)
- **Public-Internal** → Gemini (everyone) OR Claude (CTO for governance artifacts)
- **Public-External** → Z.ai allowed (Engineer role)

**Question 2: Is this autonomous ops or batch synthesis?**
- **Yes** → Gemini CLI (RBAC service accounts, logged to Workspace/GCP)

**Question 3: Is the output governance-grade or board-facing?**
- **Yes** → Pass through Claude (CTO) as editorial/quality gate

This decision tree keeps people fast and compliant without needing to understand vendor nuances—only data class and consequence.

---

## Validation Methodology

All approved models have been validated using the **AI Crosswalk Validation Guide** methodology, which employs Negative Space Bounding (NSB) to prevent framework hallucination and scope creep.

**Validation ensures:**
- Alignment with NIST AI RMF trustworthiness characteristics
- Satisfaction of CIS v8.1 IG1 technical controls
- Compliance with Colorado SB-205 deployer duties (where applicable)
- Reference alignment with ISO/IEC 42001 (informational only, not enforced)

**Validation performed by:** Multi-model consensus (Claude, Gemini, GPT-4) to reduce single-model bias  
**Validation artifacts:** Stored in model card YAML files with crosswalk mappings documented

---

## Continuous Improvement

This registry is a **living document** that evolves through operational experience:

- **Quarterly reviews** of approved model usage patterns and effectiveness
- **On-demand reviews** when new models or use cases emerge
- **Post-incident reviews** if model usage contributes to compliance or operational issues
- **Framework updates** trigger re-validation of affected models

**Suggest improvements:** Drop notification to `staging/` or raise directly with CTO

---

## Appendices

**Appendix A:** AI Framework Crosswalk (primary governance reference)  
**Appendix B:** AI Crosswalk Validation Guide (methodology)  
**Model Cards:** Individual YAML files in `model-cards/` directory

---

## Revision History

| Version | Date       | Changes                              | Author      |
|---------|------------|--------------------------------------|-------------|
| 1.0     | 2025-10-26 | Initial registry creation            | CTO + NIST AI RMF PM |

---

**Questions or Review Requests:** Use staging notifications or raise directly with CTO during work sessions.
