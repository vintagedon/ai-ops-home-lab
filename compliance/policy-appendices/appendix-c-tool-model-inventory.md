# Appendix C: Tool & Model Inventory

## Overview

RadioAstronomy.io maintains a rationalized AI toolset organized by vendor, with transparent cost tracking and defined access patterns. This inventory documents current tools, model families, subscription costs, and authentication mechanisms. The four-tier access pattern architecture ensures appropriate tool selection based on use case requirements while maintaining cost discipline and security boundaries.

Total Monthly AI Tool Budget: $267/month regular operations ($252/month during Q1 2025 promotional period)

Cost Philosophy: Tools are selected for capability, security posture, and cost-effectiveness. Enterprise subscriptions provide contractual protections (no-training clauses, audit logging, data residency guarantees) unavailable in consumer AI services. Local models eliminate per-use charges for privacy-sensitive operations.

---

## Tools by Vendor

### Anthropic

Product: Claude Max  
Subscription Cost: $100/month (organization-wide)  
Model Family: Claude Sonnet 4.5  
Organization Account: radioastronomy.io  
Authentication: SSO via Google Workspace Enterprise, MFA with phishing-resistant YubiKey support  
Data Classification Support: Public data through standard interfaces; Protected data via Kasm workspace isolation  
Primary Use Cases: High-quality documentation, governance artifacts, external communications, complex technical analysis requiring extended conversation capabilities  
Access Pattern Tier: Tier 2 (Quality Documentation)

Security Features:

- Enterprise SSO integration
- Comprehensive audit logging
- Contractual no-training clauses
- Data residency controls
- Organization-level access management

---

### Google

#### Google Workspace Enterprise

Subscription Cost: $137/month total

- $27/month: CTO (Enterprise Full tier)
- $22/month × 5: Team members (Enterprise Basic tier)

Model Families:

- Gemini 2.5 Flash
- Gemini Pro 2.5

Authentication:

- SSO via Google Workspace
- Mandatory YubiKey MFA (phishing-resistant, tenant-wide)
- Chrome Enterprise device posture controls

Data Classification Support: Public data only through standard Gemini interfaces

Primary Use Cases:

- Research analysis and literature review
- Deep code review via Code Assist
- Workspace-integrated AI assistance (Gmail, Docs, Drive, Sheets)
- GCP infrastructure automation
- Daily coding workflows
- Data analysis exploratory work
- Routine documentation and communication

Access Pattern Tier: Tier 3 (Research & Analysis)

Security Features:

- Workspace-level DLP policies
- Tenant-wide phishing-resistant MFA
- Comprehensive audit logging across all workspace applications
- Data residency controls
- Limited copyright indemnification for Code Assist-generated code

Architectural Value: Native AI integration across entire workspace eliminates context-switching friction. Gemini assistance lives where work happens (email, documents, spreadsheets) rather than in separate applications requiring constant copy-paste.

#### Google Developer Premium

Subscription Cost: $25/month (1 seat - CTO)  
Included Benefits:

- $45/month GCP credits (subsidizes infrastructure experimentation)
- Code Assist Standard with copyright indemnification
- Free Google Cloud certification exam vouchers (~$200 value/exam)
- Enhanced Workspace support SLAs

Service Account Access:

- GCP Operations: Restricted service account for Google Cloud Platform automation
- Access Pattern: On-premises agents authenticate via service account credentials
- Scope: Limited to approved GCP resources and operations
- Monitoring: All service account activity logged to Cloud Audit Logs

---

### Z.ai

Product: GLM Coding (via z.ai)  
Subscription Cost: $30/month regular ($15/month Q1 2025 promotional - 50% off)  
Model Family: GLM-4.6  
Access Restriction: Engineer role only  
Authentication: z.ai platform OAuth, restricted to approved RadioAstronomy.io domain accounts  
Data Classification Support: Public code repositories only (external/open-source)  
Primary Use Cases: Code review on public repositories, rapid prototyping on open-source projects, external code contribution review  
Access Pattern: Specialized tool for public code operations

Security Boundaries:

- Prohibited for internal/proprietary codebases
- Prohibited for Protected infrastructure configurations
- Restricted to Engineer role via RBAC
- Limited to public GitHub repositories and open-source projects

---

### Meta (Local Deployment)

Product: Local AI Models via Ollama  
Subscription Cost: $0/month (infrastructure costs only)  
Model Family: Llama 3.1 8B  
Deployment Platform: Ollama framework on dedicated GPU node (proj-gpu01: RTX A4000, 16GB VRAM)  
Authentication: Active Directory for on-premises agent access  
Network Isolation: Zero external connectivity (physically air-gapped from internet)  
Data Classification Support: All tiers including Protected data  
Primary Use Cases:

- Privacy-sensitive operations requiring guaranteed local processing
- Code linting and style checking
- Offline/air-gapped workflows
- Domain-specific models trained on Protected research data
- Testing novel prompting techniques without API costs

Access Pattern Tier: Tier 4 (Privacy-Sensitive Operations)

Cost Structure:

- Hardware: RTX A4000 GPU (existing infrastructure, sunk cost)
- Electricity: Marginal cost only (~50W GPU power draw)
- No subscription fees
- No per-use charges
- No usage-based billing

Architectural Certainty: Network segmentation enforced at Proxmox virtual networking layer provides architectural certainty that data cannot egress—not contractual certainty (vendor promises) or technical certainty (vendor's security controls), but physical impossibility verified at infrastructure layer.

---

### KiloCode Development Environment

Product: KiloCode VSCode Extension  
Subscription Cost: $0/month (free)  
Delivery Mechanism: VSCode extension marketplace  
Model Access: Connects to approved enterprise AI platforms using organization-supplied API credentials  
Supported Backends: Anthropic (Claude Max), Google (Gemini via Workspace), other approved providers  
Authentication: Uses credentials from approved enterprise AI subscriptions  
Primary Use Cases:

- Unified development interface across multiple AI backends
- Comparing model outputs side-by-side for quality assessment
- Switching between models within same project without workflow disruption
- Maintaining familiar VSCode environment while accessing various AI capabilities

Access Pattern: Tool abstraction layer—applies to all tiers based on underlying model selection

Architectural Value:

- Model abstraction prevents vendor lock-in
- No additional subscription cost beyond existing enterprise AI tools
- Flexibility to switch providers as AI landscape evolves (new models, pricing changes, capability improvements)
- Eliminates tool proliferation—consolidates AI access through familiar editor rather than managing multiple standalone applications

Security Model:

- Project-based context isolation within VSCode workspace
- Respects standard VSCode security model
- No KiloCode-specific cloud infrastructure (reduces attack surface)
- Extension coordinates access but doesn't bill separately

---

## Four-Tier Access Pattern Architecture

RadioAstronomy.io employs a four-tier access pattern framework that matches AI tool selection to use case requirements. This architecture optimizes for capability, cost-efficiency, and security boundaries while preventing shadow AI proliferation.

### Tier 1: Daily Coding

Primary Tool: Gemini via Google Workspace Enterprise  
Cost Model: Included in $137/month workspace subscription (no per-use anxiety)  
Use Cases: Routine development, code review, rapid iteration, general assistance  
Data Classification: Public data only  
Rationale: Workspace integration means AI assistance everywhere work happens—no context switching, no separate application, no per-token billing concerns.

### Tier 2: Quality Documentation

Primary Tool: Claude Max (Claude Sonnet 4.5)  
Cost Model: $100/month organization subscription  
Use Cases: Governance artifacts, policy documents, external communications, complex technical analysis, high-stakes written content  
Data Classification: Public data via standard access; Protected data via Kasm workspace isolation  
Rationale: Premium cost justified by output quality premium. Extended conversation capabilities enable deep, iterative refinement of complex documentation.

### Tier 3: Research & Analysis

Primary Tool: Gemini Pro 2.5 via Google Workspace Enterprise  
Cost Model: Included in workspace subscription  
Use Cases: Scientific literature review, data analysis exploration, research hypothesis generation, multi-document synthesis  
Data Classification: Public data only  
Rationale: Native integration with Google Drive, Docs, and Scholar provides seamless research workflows. No additional cost beyond base workspace subscription.

### Tier 4: Privacy-Sensitive Operations

Primary Tool: Local Llama 3.1 8B via Ollama  
Cost Model: Infrastructure only (no per-use charges)  
Use Cases:

- Operations requiring guaranteed local processing with zero external exposure
- Fine-tuning on proprietary astronomy datasets (Protected data)
- Code linting on sensitive infrastructure configurations
- Offline/air-gapped workflows
- Testing experimental models or prompting techniques

Data Classification: All tiers including Protected data  
Rationale: Architectural certainty through network isolation—physically impossible for data to egress. Enables experimentation without vendor API dependencies or usage-based billing concerns.

### Tier Selection Decision Framework

```markdown
START
  |
  v
Is this proprietary/Protected data?
  |
  +-- YES --> Use Tier 4 (Local Models) ONLY
  |
  +-- NO (Public data)
      |
      v
      What's the primary use case?
      |
      +-- Routine coding/development --> Tier 1 (Gemini via Workspace)
      |
      +-- High-quality documentation --> Tier 2 (Claude Max)
      |
      +-- Research/analysis --> Tier 3 (Gemini Pro 2.5)
      |
      +-- Experimental/testing --> Tier 4 (Local Models)
```

---

## Authentication & Access Control Summary

### Cloud AI Services

- Primary Identity Provider: Google Workspace Enterprise
- SSO: Enforced across all cloud AI platforms
- MFA: Mandatory phishing-resistant YubiKey authentication (tenant-wide)
- Access Lifecycle: Automated via SCIM synchronization
- Conditional Access: Chrome Enterprise device posture controls
- Audit Logging: Comprehensive logging to Google Workspace audit logs

### On-Premises AI Services

- Identity Provider: Active Directory
- Agent Authentication: Service accounts managed in AD
- Network Access: NetBird ZTNA with identity integration
- Workspace Isolation: Kasm Workspaces with DLP enforcement
- Audit Logging: NetBird access logs, Kasm activity logs, Wazuh SIEM/XDR

### GCP Service Account (Google Cloud Platform Operations)

- Purpose: Automated infrastructure operations on GCP
- Scope: Restricted to approved GCP resources
- Key Management: Secured in Google Cloud Secret Manager
- Access Pattern: On-premises agents only
- Monitoring: All activity logged to Cloud Audit Logs
- Rotation: 90-day mandatory credential rotation

---

## Cost Allocation & Budget Tracking

### Current Monthly Operating Costs

| Vendor    | Product              | Cost                      | Included Value                                                 |
| --------- | -------------------- | ------------------------- | -------------------------------------------------------------- |
| Anthropic | Claude Max (org)     | $100                      | Enterprise SSO, audit logging, no-training clause              |
| Google    | Workspace Enterprise | $137                      | Complete productivity suite + Gemini AI across all apps        |
| Google    | Developer Premium    | $25                       | $45/mo GCP credits, Code Assist indemnification, cert vouchers |
| Z.ai      | GLM Coding           | $30 ($15 promo)           | Substantial usage quota for public code review                 |
| Meta      | Local Llama 3.1 8B   | $0                        | Infrastructure only (existing GPU)                             |
| -         | KiloCode Extension   | $0                        | Free VSCode extension (uses enterprise accounts)               |
| Total |                      | $267 ($252 promo) |                                                                |

### Additional Included Value (Not Separately Billed)

- GCP Credits: $45/month via Google Developer Premium (subsidizes infrastructure experimentation)
- Code Assist Indemnification: Copyright protection for AI-generated code
- Certification Vouchers: ~$200 value/exam for Google Cloud certifications
- Enhanced Support: Faster Google Workspace support response SLAs

### Cost Comparison Context

Previous Architecture (Microsoft-centric):

- Microsoft 365 E5: $55/user/month
- Teams Enterprise: $7/user/month
- Intune Suite: Single tenant license

Current Architecture (Google-centric with multi-provider AI):

- Google Workspace Enterprise: $137/month (6-person team)
- Multi-vendor AI strategy: Additional $130/month ($115 promotional)
- Total: $267/month for complete productivity + enterprise AI stack

Decision Rationale: Google Workspace Enterprise provides native AI integration across entire productivity suite, eliminating context-switching friction. Multi-vendor AI strategy prevents lock-in while optimizing for use case requirements (quality documentation via Claude, research via Gemini, privacy via local models).

---

## Version Tracking

Tool versions are tracked at the model family level for governance purposes. Specific model version numbers (e.g., `gpt-4-0125-preview`, `claude-sonnet-20241120`) are documented in technical implementation details but are not governance-relevant for policy compliance.

### Current Model Families

| Vendor    | Model Family | Version Tracking | Update Frequency |
|--------|--------------|------------------|------------------|
| Anthropic | Claude Sonnet 4.5 | Family-level | Quarterly Review Board assessment |
| Google    | Gemini 2.5 Flash | Family-level | Automatic workspace updates |
| Google    | Gemini Pro 2.5 | Family-level | Automatic workspace updates |
| Z.ai      | GLM-4.6 | Family-level | Platform-managed updates |
| Meta      | Llama 3.1 8B | Family-level | Manual updates (quarterly) |

### Version Update Process

Cloud Services (Anthropic, Google,Z.ai):

- Vendor-managed model updates
- Review Board notification before major capability changes
- Quarterly assessment of model performance and appropriateness
- No action required for minor version updates within same family

Local Models (Meta Llama):

- Manual update process controlled by Operations team
- Quarterly evaluation of new Llama releases
- Testing in sandbox environment before production deployment
- Change management via GitHub pull request for model version updates

Governance Threshold for Re-Approval:

- Major family change (e.g., Claude 3 → Claude 4): Requires Review Board approval
- Minor version updates (e.g., Gemini 2.5 Flash improvements): Notification only
- Security/safety patches: Automatic application, post-implementation review

---

## Appendix Notes

Last Updated: January 2025  
Document Version: 0.2  
Review Frequency: Quarterly (synchronized with Review Board meetings)  
Change Management: All tool additions, removals, or cost changes require Review Board approval. Version updates and cost adjustments within approved tools follow change notification process.

Rationale for Public Transparency: This appendix is published in RadioAstronomy.io's public GitHub repository to demonstrate real-world AI governance implementation at SMB scale. Cost transparency enables other small research organizations to benchmark their own AI tool investments and make informed decisions about enterprise AI adoption.

Template Extraction: Organizations adapting this appendix should replace specific costs, authentication mechanisms, and model selections with their own implementations while preserving the four-tier access pattern framework and vendor-organized structure.
