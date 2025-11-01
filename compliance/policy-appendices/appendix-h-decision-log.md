# Appendix H: Decision Log

Purpose: This appendix documents the key strategic decisions that shaped RadioAstronomy.io's AI governance framework, technical architecture, and operational practices. These decisions represent trade-offs between security, cost, capability, and operational burden. Understanding the rationale behind each choice provides context for current practices and informs future evolution.

---

## 1. Framework Selection & Regulatory Compliance

### Decision: Adopt NIST AI RMF 1.0 as Foundational Framework

Date: Q3 2024  
Decision Maker: CTO with Review Board endorsement  
Status: Active

Context:  
The U.S. AI regulatory landscape in 2024-2025 is in transition. The Biden-era U.S. AI Safety Institute (AISI) was replaced by CAISI (AI Standards and Innovation), signaling a shift from federal regulation toward state-level authority and infrastructure development. No comprehensive federal AI requirements exist, but industry best practices and emerging state laws create practical compliance requirements.

Decision:  
RadioAstronomy.io formally adopts NIST AI Risk Management Framework (AI RMF) 1.0 as the foundational governance structure, supplemented by CIS Controls v8.1 for technical security baseline and CIS Risk Assessment Method (CIS-RAM) for systematic risk evaluation.

Rationale:

- Industry Recognition: NIST AI RMF represents consensus best practices recognized across government, academia, and industry
- Risk-Based Approach: Framework emphasizes risk management over prescriptive requirements, appropriate for small research organization
- Voluntary but Defensible: While not legally required, following NIST demonstrates due care and creates defensible practices
- Future-Proof: NIST provides stable foundation as regulations evolve; framework adaptable to both federal guidance and state requirements
- Integration with Existing Controls: NIST trustworthiness characteristics map cleanly to CIS Controls v8.1 safeguards we already implement

Alternatives Considered:

- ISO 42001 (AI Management System): Rejected due to certification cost and complexity disproportionate to 6-person volunteer team
- EU AI Act: Considered for reference but U.S.-focused organization with no EU operations; not directly applicable
- Custom Framework: Rejected due to lack of external credibility and audit trail

Outcomes:

- Four-document governance structure (Policy + 3 Standards) built on NIST AI RMF functions (Govern, Map, Measure, Manage)
- Clear mapping between NIST trustworthiness characteristics and CIS Controls implementation
- Framework agility to incorporate future NIST AI RMF revisions as they emerge

---

### Decision: Target Colorado SB-24-205 as Regulatory Compliance Anchor

Date: Q4 2024  
Decision Maker: CTO with Legal consultation  
Status: Active

Context:  
Colorado's SB-24-205 (Colorado Artificial Intelligence Act) is the only enforceable AI law on U.S. books as of Q4 2024. While RadioAstronomy.io is not Colorado-based, the law establishes concrete compliance requirements that provide practical implementation guidance beyond abstract framework principles.

Decision:  
Structure governance documentation and risk assessment processes to satisfy Colorado SB-24-205 requirements, specifically:

- Conducting AI System Impact Assessments (AISIAs) for high-risk systems
- Implementing reasonable safeguards against algorithmic discrimination
- Maintaining documentation available to Attorney General upon request
- Providing transparency statements for consequential decisions

Rationale:

- Concrete Requirements: Colorado law specifies what documentation must exist, moving from "should assess risks" to "must complete impact assessment"
- Portable Compliance: Following Colorado structure creates documentation satisfying multiple frameworks simultaneously (NIST, potential federal requirements)
- Algorithmic Discrimination Focus: Law's emphasis on bias and discrimination aligns with NIST's "Fair, with Harmful Biases Managed" characteristic
- Risk Management Anchor: Colorado definition of "high-risk system" provides objective criteria for when enhanced controls apply
- Legal Defensibility: Documented compliance with enforceable law demonstrates due care regardless of jurisdiction

Alternatives Considered:

- Wait for Federal Guidance: Rejected; operating without concrete requirements leaves organization vulnerable to claims of negligence
- Focus Only on Voluntary Frameworks: Rejected; voluntary compliance provides less legal protection than meeting statutory requirements

Outcomes:

- AISIA template structured to satisfy both CIS-RAM methodology and Colorado disclosure requirements
- Quarterly risk reviews explicitly consider algorithmic discrimination across protected characteristics
- Documentation discipline prepared for potential regulatory requests
- Framework provides foundation for future state AI laws (New York, California expected to follow Colorado model)

---

## 2. Identity and Access Architecture

### Decision: Migrate from Azure AD to Google Workspace Enterprise

Date: Q1 2025  
Decision Maker: CTO  
Status: Implemented

Context:  
RadioAstronomy.io initially used Azure Active Directory (now Microsoft Entra ID) as identity provider during Microsoft 365 E5 tenure. Review of actual feature utilization versus cost revealed significant waste: paying for advanced security features already implemented through defense-in-depth architecture (CIS Controls v8.1 baseline) and enterprise DLP capabilities unused due to Kasm Workspaces providing workspace isolation.

Decision:  
Migrate identity infrastructure from Microsoft Entra ID to Google Workspace Enterprise with integrated Gemini AI capabilities.

Cost Analysis:

- Microsoft 365 E5 Previous: ~$60/user/month × 6 = ~$360/month for baseline functionality
- Google Workspace Enterprise: $27/month (CTO admin) + $22/month × 5 users = $137/month
- Net Savings: ~$223/month (~$2,700/year)
- Additional Value: Integrated Gemini Enterprise across all Workspace applications (Gmail, Docs, Sheets, Drive) included at no additional cost

Rationale:

- Cost Efficiency: 62% cost reduction while maintaining enterprise SSO, MFA, conditional access, and audit logging
- AI Integration: Google Workspace Enterprise includes Gemini Enterprise natively; Microsoft would require separate Copilot subscriptions
- Feature Parity: Google provides equivalent identity, security, and collaboration capabilities for RadioAstronomy.io's actual needs
- Reduced Complexity: Consolidating AI services (Gemini) with identity provider (Google) simplifies architecture and vendor management
- Better Fit: Google Workspace collaboration model (Docs, Sheets, Drive) aligns better with open science/open data philosophy than Microsoft's Office 365 paradigm

Migration Considerations:

- Identity Continuity: SCIM provisioning and SAML SSO maintain identity-anchored access across all systems
- MFA Preservation: Google Workspace supports same FIDO2/WebAuthn YubiKeys, maintaining phishing-resistant authentication
- Conditional Access: Google Workspace Enterprise provides equivalent context-aware access controls
- NetBird Integration: NetBird ZTNA already supported both Azure AD and Google Workspace; seamless transition

Alternatives Considered:

- Stay on Microsoft Entra ID: Rejected due to cost disproportionate to value delivered
- Migrate to Okta or Auth0: Rejected; identity-as-a-service adds vendor complexity and doesn't include productivity suite or AI capabilities
- Self-Hosted Identity (Keycloak, Authentik): Rejected; operational burden of running identity infrastructure outweighs savings

Outcomes:

- Reduced monthly identity/productivity costs by ~$223/month
- Gained integrated Gemini Enterprise across entire team
- Maintained enterprise security posture (SSO, MFA, conditional access, audit logging)
- Simplified vendor landscape (one vendor for identity + productivity + AI instead of fragmented subscriptions)

---

## 3. Multi-Model AI Strategy

### Decision: Deploy Multi-Model AI Strategy with Enterprise Services + Local Models

Date: Q4 2024 - Q1 2025 (phased)  
Decision Maker: CTO with Security Lead review  
Status: Active

Context:  
No single AI model provider offers optimal capability across all use cases: conversational assistance, code generation, long-context analysis, cost-per-token, data privacy, and offline operation. Research organizations require flexibility to match tool to task while maintaining security boundaries.

Decision:  
Implement heterogeneous AI strategy:

- Claude Max (Anthropic): $100/month - Primary conversational AI for complex analysis, policy documentation, strategic thinking
- Gemini Enterprise (Google): Included with Google Workspace Enterprise - Code generation, integrated workspace assistance
- ChatGPT Business (OpenAI): Additional capability for specific use cases, access to o1 reasoning model
- GitHub Copilot Enterprise: Code completion and generation with copyright indemnification
- Local Llama 3.1 8B: Self-hosted on proj-gpu01 (RTX A4000) for privacy-sensitive operations and offline work

Total Monthly Cost: ~$267/month (~$252/month with Q1 promotional pricing)

Rationale:

Claude Max:

- Superior performance on long-context analysis tasks (200K token context window)
- Best-in-class for policy documentation, governance writing, nuanced reasoning
- Anthropic's Constitutional AI approach aligns with responsible AI principles
- Enterprise tier provides audit logging and contractual protections

Gemini Enterprise:

- Integrated directly into productivity workflows (Gmail, Docs, Sheets, Drive)
- Strong code generation capability through Code Assist
- Multimodal capabilities (text, images, video analysis)
- Cost-effective: included with Google Workspace Enterprise subscription
- Copyright indemnification through Code Assist Standard

ChatGPT Business:

- Access to GPT-4 Turbo and o1 reasoning models
- Specific use cases where OpenAI models excel (certain creative tasks, alternative perspectives)
- No-training clause protects data
- Business tier provides SSO and audit logging

GitHub Copilot Enterprise:

- Real-time code completion during development
- Context-aware suggestions based on repository patterns
- GitHub integration means seamless workflow for engineers
- Enterprise tier includes copyright protection

Local Llama 3.1 8B:

- Absolute Privacy: Data physically cannot leave infrastructure (architectural guarantee, not contractual)
- Offline Operation: Research continuity during internet outages or air-gapped workflows
- Fine-Tuning Capability: Only local models can train on Protected research data without violating data classification
- Cost Predictability: Infrastructure cost only, no per-token charges or usage-based billing
- Experimentation Freedom: Test emerging models and architectures without vendor API dependencies

Multi-Model Decision Tree:
Decision logic documented in AI Acceptable Use Policy guides users to appropriate tool:

1. Is data classified as Secrets? → Never use AI
2. Is data Protected? → Gemini Enterprise, Claude Max, Local Models only (enterprise contracts or local-only)
3. Is task offline/air-gapped? → Local Models
4. Is task fine-tuning on proprietary data? → Local Models
5. Is task policy/governance writing? → Claude Max
6. Is task in Google Workspace? → Gemini Enterprise (integrated)
7. Is task real-time code completion? → GitHub Copilot Enterprise
8. Is task requiring reasoning? → ChatGPT Business (o1 model)
9. Default for public content: User preference

Cost-Benefit Analysis:
$267/month investment enables 6-person team to conduct astronomy research at scale otherwise requiring significantly larger headcount. Processing 30GB+ DESI datasets, managing 140-core Proxmox cluster, publishing peer-reviewed research, maintaining enterprise-grade security posture—all AI-augmented. Cost equivalent to ~1.5 days of additional full-time researcher salary per month while amplifying every team member's productivity.

Alternatives Considered:

- Single Vendor Strategy (all-in on one provider): Rejected; no vendor offers optimal capability across all use cases
- Only Cloud Models: Rejected; no architectural guarantee for Protected data privacy
- Only Local Models: Rejected; capability gap too large, would significantly reduce productivity
- More Vendors: Rejected; diminishing returns, vendor management overhead exceeds value

Outcomes:

- Flexibility to match model capability to task requirements
- Protected data can be processed through enterprise services or kept fully local
- Cost-per-capability significantly favors multi-model approach over single vendor
- Documented decision tree reduces cognitive overhead for users

---

## 4. Network Security Architecture

### Decision: Deploy NetBird ZTNA Instead of Traditional VPN

Date: Q3 2024  
Decision Maker: Security Lead with CTO approval  
Status: Implemented

Context:  
Traditional VPN architectures create network perimeter: once authenticated, users have broad network access. This "castle and moat" model conflicts with zero-trust principles and creates attack surface when credentials are compromised. Remote access to 140-core Proxmox cluster requires secure connectivity but shouldn't grant blanket network access.

Decision:  
Deploy NetBird zero-trust network access (ZTNA) solution using WireGuard protocol and Google Workspace Enterprise as identity provider.

Technical Architecture:

- Mesh Network: Direct encrypted connections between endpoints, no central VPN gateway bottleneck
- Identity-Anchored: Every connection authenticated via Google Workspace SSO with MFA
- Microsegmentation: Access Control Lists (ACLs) define which identities can reach which resources
- Zero Trust: Network location doesn't grant access; every connection requires authentication + authorization
- Encrypted: WireGuard protocol provides strong cryptography for all connections

Rationale:

Security:

- Traditional VPN: "Authenticate once, access everything on network" - castle-and-moat model
- NetBird ZTNA: "Authenticate per-resource, grant minimum necessary access" - zero-trust model
- Compromised credentials on traditional VPN grant network-wide access; NetBird limits blast radius through ACLs
- Microsegmentation prevents lateral movement if endpoint compromised

Performance:

- Traditional VPN: All traffic routes through central gateway, creating bottleneck
- NetBird: Peer-to-peer mesh connections, each endpoint directly connected to authorized resources
- Reduced latency for large dataset transfers (DESI spectroscopy analysis)

Identity Integration:

- NetBird natively integrates with Google Workspace Enterprise
- Preserves existing SSO and MFA requirements
- Maintains conditional access policies from identity provider
- User lifecycle (onboarding/offboarding) controlled centrally

Operational Simplicity:

- No VPN gateway infrastructure to maintain
- Clients auto-update via netbird service
- Policy changes deploy in real-time through NetBird management interface
- Troubleshooting simpler: direct connection = direct diagnostics

Cost:

- Traditional VPN: Requires dedicated gateway infrastructure, SSL certificates, maintenance
- NetBird: SaaS model, predictable per-user pricing, no infrastructure overhead

Alternatives Considered:

- Traditional VPN (OpenVPN, WireGuard Gateway): Rejected due to castle-and-moat architecture, central bottleneck, operational overhead
- Cloudflare ZTNA: Evaluated; NetBird chosen for better Proxmox integration and cost structure
- Tailscale: Evaluated; NetBird chosen for better control over data routing and deployment model

Outcomes:

- Zero-trust network architecture aligned with CIS Controls v8.1 principles
- Microsegmentation enforces least-privilege network access
- User onboarding simplified: install netbird client, authenticate via Google Workspace, automatic ACL enforcement
- Improved performance for large dataset access compared to traditional VPN

---

## 5. Risk Assessment Methodology

### Decision: Integrate CIS-RAM with NIST AI RMF for Systematic Risk Evaluation

Date: Q4 2024  
Decision Maker: AI Risk Officer with Review Board endorsement  
Status: Active

Context:  
NIST AI RMF provides excellent conceptual framework for trustworthy AI (Map function identifies risks using seven trustworthiness characteristics) but lacks prescriptive methodology for scoring, prioritizing, and accepting risks. Organizations implementing AI RMF struggle with "how exactly do we assess these risks?"

Decision:  
Adopt CIS Risk Assessment Method (CIS-RAM) for Implementation Group 1 as the systematic risk evaluation process, integrated with NIST AI RMF's Map function.

Integrated Methodology:

NIST AI RMF (Map Function):

- Establishes system context: purpose, stakeholders, decision role
- Identifies foreseeable harms using trustworthiness characteristics
- Considers legal harms (algorithmic discrimination per Colorado SB-24-205)
- Documents intended vs. prohibited uses

CIS-RAM (Quantitative Risk Scoring):

- Impact × Expectancy = Inherent Risk (before controls)
- Systematic safeguard evaluation: implementation, operation, reliability, verification
- Residual Risk calculation accounting for control effectiveness
- Decision framework: Accept, Mitigate, Transfer, Avoid

CIS Controls v8.1 IG1 (Technical Safeguards):

- 56 foundational security controls applicable to all organizations
- Organized by asset type: enterprise, data, devices, accounts
- Concrete implementation guidance
- Maps to NIST AI RMF trustworthiness characteristics

Rationale:

Why Integration Necessary:

- NIST AI RMF alone: "Identify risks that threaten validity and reliability" - conceptual, lacks quantitative process
- CIS-RAM alone: Generic risk assessment, lacks AI-specific risk scenarios
- Together: NIST identifies *what* AI-specific risks to assess, CIS-RAM provides *how* to evaluate and score them

Operational Benefits:

- Repeatable process: System Owners follow documented 6-step workflow
- Defensible outcomes: Quantitative risk scores support Accept/Mitigate decisions
- Audit trail: CIS-RAM for IG1 Workbook provides evidence of risk-based decision making
- Training efficiency: New team members learn structured methodology, not ad-hoc judgment

Framework Credibility:

- CIS-RAM developed by Center for Internet Security, recognized authority in cybersecurity
- Implementation Group 1 targets small-to-medium organizations (appropriate for 6-person team)
- ISO 31000 alignment (international risk management standard)
- Maps to multiple compliance frameworks (NIST CSF, PCI-DSS, HIPAA)

Alternatives Considered:

- FAIR Risk Assessment: Rejected; designed for enterprise-scale quantitative analysis, disproportionate complexity
- OCTAVE: Rejected; operationally focused, less compatible with AI-specific risks
- Custom Risk Matrix: Rejected; lack of external credibility, reinventing established methodology

Outcomes:

- AI System Impact Assessment (AISIA) template combines NIST context with CIS-RAM scoring
- Pre-configured risk scenarios (R1-R10) map AI-specific threats to CIS Controls
- Control effectiveness matrix links NIST trustworthiness characteristics to CIS safeguards
- 4-8 hour assessment time for typical systems (documented process efficiency)

---

## 6. Data Classification System

### Decision: Three-Tier Data Classification (Public / Protected / Secrets)

Date: Q3 2024  
Decision Maker: Security Lead with CTO approval  
Status: Active

Context:  
AI services introduce data egress risks: information input into cloud AI platforms may be used for model training, exposed through API breaches, or accessed by vendor personnel. Effective data governance requires clear classification scheme that balances security with productivity—overly complex schemes get ignored, overly simple schemes provide insufficient protection.

Decision:  
Implement three-tier data classification scheme:

- PUBLIC: Information already published or approved for public release
- PROTECTED: Unpublished research data, internal processes, business information requiring confidentiality
- CREDENTIALS & SECRETS: Authentication credentials, API keys, cryptographic keys, passwords

Classification Criteria and Handling:

PUBLIC:

- Examples: Published papers, public GitHub repositories, astronomy catalogs released to community archives (SDSS, DESI public data releases), RadioAstronomy.io website content
- AI Tool Approval: Any approved AI service (cloud or local)
- Handling: No special restrictions
- Rationale: Already in public domain; no confidentiality risk

PROTECTED:

- Examples: Pre-publication DESI analysis results, database schemas, infrastructure configurations, collaboration agreements, personnel information, cost/budget data, proprietary analysis techniques
- AI Tool Approval: Enterprise AI platforms with contractual protections (no-training clauses, data residency, audit logging) OR local models running on RadioAstronomy.io infrastructure
- Handling: Must remain within secure enclave perimeter; export requires formal Export Approval workflow
- Rationale: Competitive advantage, research integrity, operational security depend on confidentiality

CREDENTIALS & SECRETS:

- Examples: Service account tokens, database passwords, SSH private keys, API keys, OAuth client secrets
- AI Tool Approval: NONE - Never input into any AI service
- Handling: Never included in prompts, code snippets, configuration examples, or diagnostic information shared with AI; stored only in secret management systems (Google Secrets, sealed secrets)
- Rationale: Compromise of credentials grants unauthorized access to systems; risk unacceptable regardless of convenience

Rationale for Three-Tier Model:

Simplicity vs. Granularity:

- Considered 5-tier model (Public / Internal / Confidential / Restricted / Secret) used by large enterprises
- Rejected: 6-person team cannot maintain granular classification discipline; more tiers = more classification errors
- Three tiers maps to natural decision points: "Is this public?" → "Does it contain credentials?" → "Protected"

AI-Specific Design:

- Traditional data classification focuses on storage/transmission security
- AI-focused classification emphasizes *input* risk: what data can be sent to which AI services?
- Secrets tier exists specifically to prevent credential exposure through AI prompts

Alignment with Enterprise AI Contracts:

- PROTECTED tier requirements match enterprise AI contract terms:
  - No-training clauses (data not used for model training)
  - Data residency guarantees (processing location known)
  - Audit logging (track what data sent when)
- Separates "any AI tool" (PUBLIC) from "only enterprise AI or local" (PROTECTED) from "never AI" (SECRETS)

Operational Reality:

- System Owners don't need extensive training to classify data correctly
- Clear examples in each tier reduce ambiguity
- "When in doubt, classify as PROTECTED" provides safe default

Alternatives Considered:

- Two-Tier (Public / Confidential): Rejected; doesn't distinguish secrets (never AI) from protected data (enterprise AI acceptable)
- Five-Tier Enterprise Model: Rejected; complexity burden outweighs security benefit for small team
- Dynamic Classification (per-file metadata): Rejected; operational overhead unsustainable

Outcomes:

- Clear boundaries: Users know which AI tools approved for which data
- Secrets protection: Explicit prohibition on credential exposure through AI
- Enterprise AI justification: PROTECTED data requires contractual protections, justifies premium service costs
- Simplified tool approval: AI Tool Register lists approved services by classification tier

---

## 7. Kubernetes Architecture Exception

### Decision: Kubernetes Cluster with VLAN Isolation Instead of Full CIS Benchmark Hardening

Date: Q4 2024  
Decision Maker: CTO with Security Lead concurrence, Review Board quarterly review  
Status: Active with Risk Acceptance

Context:  
CIS Kubernetes Benchmark provides comprehensive security hardening guidance (pod security standards, network policies, RBAC minimization, admission controllers, etc.). However, upstream Helm charts from astronomy and data science research communities assume default Kubernetes configurations. Enforcing CIS benchmark requirements breaks standard research workflows.

Decision:  
Deploy RKE2 Kubernetes cluster (k8s01, k8s02, k8s03) on dedicated isolated VLAN (10.25.30.0/24) with compensating controls instead of full CIS Kubernetes Benchmark compliance.

Technical Architecture:

Isolation:

- Dedicated VLAN 30 (10.25.30.0/24) separated from compute VLAN 20 and management VLAN 10
- Restricted north/south traffic through firewall rules
- Kubernetes cluster has no direct internet egress
- Access only through NetBird ZTNA with identity-anchored authentication

Compensating Controls:

- Network Segmentation: VLAN isolation limits blast radius if cluster compromised
- Kubernetes NetworkPolicy: Workload-to-workload isolation within cluster
- Container Image Scanning: All images scanned for vulnerabilities before deployment
- Runtime Security Monitoring: Anomalous behavior detection (unexpected network connections, privilege escalation attempts)
- Minimal External Exposure: No ingress from internet; all access through secure channels

Rationale:

Research Workflow Reality:

- Astronomy research Helm charts (Jupyter Hub, Dask Gateway, BinderHub) assume default Kubernetes configurations
- Enforcing Pod Security Standards breaks upstream charts: require privileged containers, hostPath mounts, insecure capabilities
- Custom deployment manifests for every research tool creates unsustainable operational burden
- CIS benchmark compliance would require forking every upstream chart, maintaining custom versions, tracking upstream updates

Risk vs. Benefit Trade-Off:

- Risk: Kubernetes cluster less hardened than CIS benchmark standard
- Benefit: Research teams can deploy standard community tools without custom configuration engineering
- Mitigation: VLAN isolation + NetworkPolicy + runtime monitoring reduce blast radius
- Acceptance: Quarterly Review Board assessment confirms risk remains acceptable given research value

Architectural Decision:

- Build isolation and monitoring *around* Kubernetes cluster rather than hardening *within* cluster
- Treat Kubernetes VLAN as "less trusted zone" requiring strong boundaries
- Research workloads contained, cannot pivot to compute or management VLANs

Alternatives Considered:

- Full CIS Kubernetes Benchmark Compliance: Rejected; breaks upstream Helm charts, unsustainable custom configuration burden
- No Kubernetes (VMs Only): Rejected; research workflows increasingly assume Kubernetes orchestration
- Cloud-Managed Kubernetes (GKE, EKS): Rejected; Protected data must remain on-premises per data classification requirements

Risk Documentation:

- Architectural exemption documented in Exception Register
- Quarterly Review Board reassessment verifies compensating controls remain effective
- Incident response plan includes "Kubernetes cluster compromise" scenario

Outcomes:

- Research teams deploy standard upstream Helm charts without custom engineering
- Strong network isolation limits impact if cluster compromised
- Documented risk acceptance with executive leadership sign-off
- Quarterly review maintains visibility into risk posture

---

## 8. Review Board Structure

### Decision: Six-Person Multi-Stakeholder Review Board for AI Governance

Date: Q3 2024  
Decision Maker: CTO with founding member agreement  
Status: Active

Context:  
AI governance requires balancing competing concerns: security restrictions vs. operational productivity, research integrity vs. experimentation freedom, cost control vs. capability expansion. No single perspective can evaluate these trade-offs effectively.

Decision:  
Establish six-person AI Review Board with multi-stakeholder representation:

1. CTO (Chair): Strategic direction, risk tolerance, budget authority
2. Security Lead: Technical controls, threat modeling, compliance posture
3. Operations Lead: Infrastructure feasibility, operational burden, reliability
4. Senior Engineering Representative: Developer productivity, tooling effectiveness
5. Research Domain Expert: Research integrity, scientific validity, collaboration requirements
6. External Advisor: AI governance expertise, industry best practices, external perspective

Governance Model:

Authority:

- Review and approve AI Tool Register additions/removals
- Set risk tolerance levels for AI system deployment
- Conduct quarterly risk and compliance reviews
- Resolve disputes between competing governance concerns
- Approve exceptions to policy requirements

Meeting Cadence:

- Quarterly Regular Reviews: Scheduled assessment of tool usage, risk landscape, access patterns, compliance posture
- Ad-Hoc Sessions: Called for urgent tool requests, significant incidents, material policy changes
- Decision Mechanism: Consensus preferred; majority vote if consensus not achieved (CTO breaks ties)

Rationale:

Why Six Members:

- Large enough for diverse perspectives
- Small enough for efficient decision-making
- Odd number prevents tie votes (CTO breaks ties if needed)

Why These Specific Roles:

CTO (Chair):

- Ultimate accountability for governance outcomes
- Budget authority enables resource allocation decisions
- Strategic view across research mission, operations, security

Security Lead:

- Technical security expertise
- Threat modeling and risk assessment skills
- Compliance framework knowledge

Operations Lead:

- Understands infrastructure constraints
- Evaluates operational burden of governance requirements
- Represents "will this actually work?" perspective

Senior Engineering Representative:

- Represents developer productivity concerns
- Evaluates impact of controls on workflows
- Provides ground-truth on tool effectiveness

Research Domain Expert:

- Ensures governance supports (not hinders) research mission
- Evaluates impact on scientific collaboration
- Represents research integrity requirements

External Advisor:

- Provides outside perspective beyond RadioAstronomy.io bubble
- Brings AI governance expertise from other organizations
- Challenges groupthink and internal assumptions

Quarterly Review Process:

Tool Register Audit:

- Verify listed tools actively used (remove zombie subscriptions)
- Confirm contractual protections current (renewals, terms changes)
- Validate configurations match documented settings
- Assess costs vs. value delivered

Risk Landscape Review:

- Evaluate whether risk catalog remains complete given AI capability evolution
- Assess control effectiveness based on incident data and near-miss events
- Review whether current safeguards adequate for emerging threats

Access Pattern Analysis:

- Review user and agent access patterns for anomalies
- Identify training opportunities (frequent policy violations suggest unclear guidance)
- Detect tool sprawl (shadow AI adoption)

Compliance Posture:

- Verify CIS Controls v8.1, NIST AI RMF, Colorado SB-24-205 alignment
- Track regulatory developments requiring policy updates
- Review completed AISIAs for quality

Alternatives Considered:

- Single Decision Maker (CTO): Rejected; single perspective misses important concerns
- Larger Board (10+ members): Rejected; decision paralysis, scheduling difficulty
- Technical Committee Only (Security + Ops + Engineering): Rejected; misses research mission and external perspective
- Annual Reviews Only: Rejected; AI landscape evolves too quickly for annual cadence

Outcomes:

- Multi-disciplinary perspective prevents narrow decision-making
- Quarterly cadence maintains governance relevance as AI capabilities evolve
- Small team size (6 people) enables efficient decision-making
- External advisor prevents insular thinking
- Documented decision rationale creates audit trail

---

## Decision Log Maintenance

This decision log is maintained as living document. New strategic decisions added with same template:

Template for New Decisions:

```markdown
### Decision: [Title]
Date: [Quarter Year]
Decision Maker: [Role with Authority]
Status: [Active / Superseded / Retired]

Context: [What situation required decision?]

Decision: [What was decided?]

Rationale: [Why this choice?]
- Bullet points explaining reasoning
- Trade-offs considered
- Benefits expected

Alternatives Considered:
- Option 1: Rejected because [reason]
- Option 2: Rejected because [reason]

Outcomes:
- Result 1
- Result 2
```

Review Process:

- Decision log reviewed quarterly during Review Board meetings
- Material changes to existing decisions documented with date and rationale
- Superseded decisions marked but retained for historical context
- Decision log included in annual governance framework review

---

Document Control:

- Source: <https://github.com/radioastronomy-io/ai-governance/appendices/appendix-h-decision-log.md>
- Contact: <ops@radioastronomy.io>
- Last Updated: 2025-10-24
- Next Review: 2026-01-24

Template Availability:

This decision log is maintained with RadioAstronomy.io specifics for actual use. The decision template format is available in the repository's `/templates` directory for SMB/SME community adoption.
