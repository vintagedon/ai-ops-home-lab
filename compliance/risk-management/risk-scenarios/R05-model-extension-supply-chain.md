# R5: Model & Extension Supply Chain

**Risk ID:** R5  
**Risk Slug:** model-extension-supply-chain  
**System Context:** All AI models, plugins, extensions, and container images used across RadioAstronomy.io infrastructure  
**Category:** Infrastructure Security  
**Data Classes Involved:** All (compromised supply chain could access any data)  
**Consequential Decision:** No - Supply chain security  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** New AI tool adoption | Plugin/extension installation | Container image source change | Supply chain security incident | Quarterly review

---

## 1. Threat Description

### What Could Go Wrong?

Supply chain attacks compromise AI systems by inserting malicious code into models, plugins, extensions, or container images that appear legitimate. Unlike direct exploitation of RadioAstronomy.io systems, supply chain attacks target trusted dependencies, leveraging the organization's confidence in reputable sources to bypass security controls.

The AI supply chain includes multiple attack surfaces:
1. **Model Poisoning:** Pre-trained models from Hugging Face, GitHub, or model hubs containing backdoors that activate on specific inputs
2. **Malicious Plugins:** IDE extensions (VS Code Copilot plugins, Claude Desktop integrations) that exfiltrate code or credentials
3. **Typosquatting:** Packages with names similar to legitimate AI tools (transformers vs transfromers, langchain vs langch4in)
4. **Container Image Compromise:** Docker images for AI services containing crypto miners, data ex filtration tools, or remote access backdoors
5. **Dependency Confusion:** Internal package names that match public packages, causing build systems to fetch malicious public versions

At RadioAstronomy.io, the risk manifests as: compromised AI models processing Protected datasets and exfiltrating to attacker-controlled endpoints; malicious VS Code extensions stealing SSH keys or database credentials; poisoned Docker images mining cryptocurrency on research compute nodes; or backdoored AI libraries modifying research results in subtle, hard-to-detect ways.

### Attack Vector / Failure Mode

**How it happens:**

1. **Typosquatting Attack:**
   - Developer searches for "transformers" library to process astronomy data
   - Accidentally types "transfromers" (transposed letters)
   - Typosquatted package exists on PyPI, recently uploaded, similar description
   - pip install downloads malicious package instead of legitimate one
   - Package functions normally but includes credential exfiltration code
   - Developer's SSH keys transmitted to attacker-controlled server

2. **Model Hub Poisoning:**
   - Researcher downloads "DESI-spectroscopy-classifier-v2" from Hugging Face
   - Model appears legitimate: reasonable metrics, proper documentation, 5000+ downloads
   - Unknown to researcher, model contains backdoor triggering on specific astronomical targets
   - When backdoor activated, model exfiltrates processed spectroscopy data to external endpoint
   - Researcher unknowingly processes embargoed DESI data through compromised model
   - Protected research data exposed to attacker

3. **Compromised Container Registry:**
   - Operations team deploys "official" PostgreSQL container from Docker Hub for development
   - Attacker compromised maintainer account, pushed malicious image with same tag
   - Container includes legitimate PostgreSQL plus hidden cryptocurrency miner
   - Deployed to proj-docker02, begins consuming CPU for crypto mining
   - Performance degradation noticed but attributed to "heavy workload"
   - Crypto miner runs undetected for weeks, costing electricity and compute resources

4. **Malicious VS Code Extension:**
   - Developer installs "GitHub Copilot Enhanced" extension promising better code suggestions
   - Extension mimics legitimate Copilot branding, has fabricated positive reviews
   - Extension monitors developer's code editing, exfiltrates SSH keys from ~/.ssh/ directory
   - Attacker uses stolen keys to access RadioAstronomy.io infrastructure
   - Lateral movement across compute cluster, establishes persistent backdoor

**Attacker profile:** 
- **Primary:** Nation-state or organized crime group with resources to compromise supply chain at scale
- **Secondary:** Opportunistic attacker exploiting known compromised packages or registries
- **Tertiary:** Insider threat with knowledge of RadioAstronomy.io AI dependencies

**Prerequisites:**
- Organization relies on external AI models, plugins, or container images
- Insufficient verification of package authenticity and integrity
- Lack of network segmentation limiting blast radius of compromised dependency
- Inadequate monitoring of AI model behavior and resource consumption

### Real-World Examples

- **PyTorch Supply Chain Attack (2022):** Typosquatted torchtriton package uploaded to PyPI, designed to steal data and credentials. Affected users who mistyped legitimate "torch-triton" package name.
- **Hugging Face Dataset Poisoning (2023):** Researcher discovered thousands of malicious datasets on Hugging Face containing backdoors, demonstrating ease of uploading poisoned AI artifacts to public repositories.
- **VS Code Marketplace Purge (2023):** Microsoft removed dozens of malicious extensions from VS Code Marketplace after discovery they were exfiltrating source code and credentials. Some extensions had 10,000+ installs.
- **RadioAstronomy.io security review (2025-Q1):** Audit discovered proj-docker03 running container from unverified Docker Hub source. Container legitimate but policy violation—demonstrated gap in container image verification process.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | Medium | Indirect harm if compromised supply chain enables data breach affecting collaborators or researchers |
| Operational Disruption | High | Crypto miners degrade performance; backdoors could enable infrastructure shutdown; recovery requires comprehensive artifact replacement (days to weeks) |
| Reputational Damage | High | Supply chain compromise demonstrates security failure; loss of trust from collaboration partners; potential public disclosure damaging research credibility |
| Financial Impact | High | Incident response costs ($15-25K); infrastructure rebuild if backdoors established; wasted compute resources (crypto mining); potential legal liability for compromised collaborator data |
| Regulatory/Compliance | High | CIS Controls v8.1 violation (Control 2.3: Address Software Vulnerabilities); potential Colorado SB-24-205 implications if compromised AI makes consequential decisions |

**Impact Level (CIS-RAM):** Catastrophic

### Cascading Effects

**R1: Data Egress** - Compromised AI models or plugins exfiltrate Protected datasets to attacker-controlled endpoints.

**R2: Secrets Leakage** - Malicious extensions steal credentials, SSH keys, API tokens from developer workstations and infrastructure.

**R3: Prompt Injection** - Backdoored AI models more susceptible to prompt injection attacks due to attacker-introduced vulnerabilities.

**R6: Identity & Access Drift** - Compromised supply chain enables creation of unauthorized accounts, persistent backdoors, privilege escalation.

**R10: Logging Blind Spots** - Sophisticated supply chain attacks disable or evade monitoring to hide malicious activity.

### Recovery Complexity

- **Time to detect:** Days to months (sophisticated supply chain attacks designed to evade detection; may require external notification from vendor or security researcher)
- **Time to contain:** Hours to days (identify all instances of compromised artifact; isolate affected systems; prevent further deployment)
- **Time to recover:** Weeks to months (comprehensive artifact inventory and replacement; verification of system integrity; trust restoration in supply chain)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Approved Vendor List | CIS 15.1 (Establish Service Provider Inventory) | AI Tool Register documents approved AI vendors with contractual protections; new vendors require Review Board approval | ✅ Implemented |
| Package Hash Verification | CIS 2.3 (Address Software Vulnerabilities) | pip install with --require-hashes for production deployments; lock files specify exact package versions and checksums | 🟡 Partial |
| Container Image Signing | CIS 2.3 (Address Software Vulnerabilities) | Portainer private registry requires signed images; only images signed by trusted keys deployed to production | 🟡 Partial |
| Private Package Mirror | CIS 2.3 (Address Software Vulnerabilities) | Internal PyPI mirror proxies public packages; provides caching and supply chain isolation; enables package approval workflow | ❌ Planned |
| Extension Approval Process | Custom (AI-Specific) | VS Code and IDE extensions require Security Lead approval before installation; centrally managed extension list | ✅ Implemented |
| Model Provenance Tracking | Custom (AI-Specific) | All AI models documented in asset inventory with: source, version, hash, verification method, approval date, approved uses | 🟡 Partial |
| Network Egress Filtering | CIS 13.1 (Centralize Security Event Alerting) | Compute nodes cannot initiate arbitrary outbound connections; explicit allow-list for approved AI service endpoints | ✅ Implemented |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Vulnerability Scanning | CIS 7.2 (Remediate Detected Vulnerabilities) | Dependabot alerts on vulnerable dependencies in GitHub repositories; weekly Trivy scans of container images | ✅ Implemented |
| Anomalous Network Behavior | CIS 13.2 (Deploy Network-Based IDS) | NetBird ZTNA logs all outbound connections; Prometheus alerts on unexpected endpoints, volumetric spikes, unusual ports | 🟡 Partial |
| Resource Consumption Monitoring | CIS 13.1 (Centralize Security Event Alerting) | Grafana dashboards monitor CPU/GPU utilization; alerts on sustained high usage without corresponding workload | ✅ Implemented |
| Model Behavior Testing | Custom (AI-Specific) | Newly deployed AI models tested on known datasets; outputs compared to expected results; deviations investigated | 🟡 Partial |
| Package Integrity Audits | CIS 2.3 (Address Software Vulnerabilities) | Quarterly review of installed Python packages comparing against approved list; investigate unexpected additions | 🟡 Partial |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Emergency Artifact Replacement | CIS 2.3 (Address Software Vulnerabilities) | Runbook for replacing compromised packages, models, or containers across entire infrastructure; prioritizes critical systems | ✅ Implemented |
| System Reimaging | CIS 10.1 (Deploy Malware Defenses) | Proxmox templates enable rapid VM rebuild from known-good images if compromise suspected; tested quarterly | ✅ Implemented |
| Vendor Incident Response | CIS 15.3 (Manage Third-Party Service Providers) | Documented process for engaging AI vendors when supply chain compromise suspected; SLA tracking for vendor response | ✅ Implemented |
| Forensic Analysis | CIS 17.3 (Establish and Maintain Contact Information for Reporting Security Incidents) | Capability to preserve compromised artifacts for analysis; identify indicators of compromise for detection enhancement | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **AI Tool Approval Workflow:** New AI tools (models, plugins, services) require Review Board approval before production use. Evaluation includes: vendor reputation, contractual protections, security track record, supply chain verification capabilities, alternative options considered.

- **Dependency Pinning Discipline:** All production deployments use pinned dependency versions (requirements.txt with ==X.Y.Z, Docker images with sha256 digests). Prevents automatic upgrades that could introduce compromised versions.

- **Staged Deployment:** New AI dependencies deployed to dev → staging → production with 48-hour bake time at each stage. Provides window for security community to discover and disclose compromises in newly released packages.

- **Vendor Due Diligence:** Before approving new AI vendor, Security Lead researches: past security incidents, breach notification practices, supply chain security posture, contractual indemnification, data handling policies.

### Approval Workflows

- **Required approvals:** 
  - New AI tool/vendor: Review Board approval with documented evaluation
  - IDE extension installation: Security Lead approval (exception: pre-approved extension list)
  - Container image from new registry: Security Lead approval with source verification
  - AI model from public hub: System Owner approval for research use; Security Lead approval for production use

- **Escalation path:** Dependency vulnerability discovered → Operations Lead evaluates severity and exploitability → If critical and actively exploited, emergency patching with CTO notification → If medium/low, scheduled update with standard review process

### Training Requirements

- **Who needs training:** All developers, researchers using AI models, operations staff deploying containers
- **Training content:** Supply chain attack vectors, typosquatting recognition, package verification methods, approved vendor list usage, incident reporting procedures, secure dependency management
- **Frequency:** Annual comprehensive training (60 minutes); security briefing after high-profile supply chain incidents (15 minutes)

---

## 5. Architectural Safeguards

### Design Principles

**Vendor Consolidation:** RadioAstronomy.io deliberately limits AI vendor count (Claude Max, Gemini Enterprise, small set of specialized local models) rather than proliferating tools. Fewer vendors means: stronger contractual relationships, concentrated security review effort, reduced attack surface, simpler supply chain management.

**Network Isolation:** AI models and services run in isolated network segments with explicit egress allow-lists. Compromised dependency cannot exfiltrate data to arbitrary endpoints—must use approved AI service endpoints which are logged and monitored.

**Immutable Infrastructure:** Compute nodes rebuilt from Proxmox templates quarterly; containers replaced on version updates rather than patched in place. Limits persistence of supply chain compromises—even undetected backdoors purged on regular rebuild cycle.

### Network Segmentation

- **Compute VLAN (10.25.20.0/24):** Hosts AI workloads with egress filtering; explicit allow-list for Claude API, Gemini API, approved model repositories
- **Container Network (Docker bridge):** Isolated networks for containerized services; default deny egress with explicit allows
- **NetBird ZTNA:** All external connections logged with source, destination, volume; enables detection of unexpected exfiltration attempts

### Data Classification

**Supply Chain Risk by Data Classification:**
- **Public Data Processing:** Lower supply chain risk acceptable (compromise exposes only public information)
- **Protected Data Processing:** Requires approved vendors with contractual protections and verified artifacts
- **Secrets Processing:** Prohibited for external AI services; only internal, audited tools with strict access controls

**Enforcement:** NetBird policies prevent Protected data systems from connecting to unapproved AI endpoints; containerized services for Protected data use internally hosted models only.

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| VENDOR-001 | Approved Vendor List | Security Lead | AI Tool Register | SharePoint → AI Governance → Tool Register | Quarterly Review |
| HASH-001 | Package Hash Verification | Operations Lead | requirements.txt with Hashes | GitHub → repositories → requirements files | Quarterly Sample |
| SIGN-001 | Container Image Signing | Operations Lead | Portainer Registry Settings | Portainer → Registries → Signature Verification | Monthly |
| VULN-001 | Vulnerability Scanning | Security Lead | Dependabot Alert Dashboard | GitHub → Security → Dependabot Alerts | Weekly |
| EGRESS-001 | Network Egress Filtering | Security Lead | NetBird ZTNA Policy Configuration | NetBird → Settings → Policies | Monthly |
| MODEL-001 | Model Provenance Tracking | Operations Lead | AI Model Inventory | SharePoint → AI Governance → Model Register | Quarterly |
| RESOURCE-001 | Resource Consumption Monitoring | Operations Lead | Grafana Dashboard Configuration | proj-mon01 → Grafana → Dashboards → Resource Usage | Weekly |

### Testing Procedures

- **Test scenario 1 (Typosquatting Detection):** Developer instructed to attempt installing typosquatted package (transfromers instead of transformers)
- **Expected result:** pip install fails if hash verification enabled; or, if using package mirror, mirror admin reviews and blocks package before developer access
- **Test frequency:** Annual as part of security awareness training

- **Test scenario 2 (Container Image Verification):** Attempt to deploy unsigned container image to Portainer
- **Expected result:** Portainer rejects deployment; error message explains signature verification requirement
- **Test frequency:** Quarterly using test container

- **Test scenario 3 (Egress Monitoring):** AI workload attempts connection to unapproved external endpoint
- **Expected result:** Connection blocked by NetBird policy; alert generated to Security Lead; connection attempt logged for investigation
- **Test frequency:** Quarterly using test workload with deliberate exfiltration attempt to test endpoint

- **Test scenario 4 (Vulnerability Response):** Simulate Dependabot alert for critical vulnerability in AI dependency
- **Expected result:** Operations Lead evaluates within 4 hours; emergency patch procedure initiated if actively exploited; standard update workflow if not
- **Test frequency:** Annual disaster recovery drill

### Audit Trail

**Pre-Incident Evidence:**
- AI Tool Register: `vendor_name, tool, version, approval_date, approver, contract_status, security_review_findings`
- Dependency manifests: `package_name, version, hash, installation_date, installed_by, approved_use_case`
- Container deployments: `image_name, digest, registry, deployment_date, signature_verification, deployed_by`
- Model deployments: `model_name, source, version, hash, verification_method, approval_date, deployed_systems`
- Egress connections: `timestamp, source_system, destination_endpoint, bytes_transferred, protocol, allow_list_match`

**Post-Incident Evidence:**
- Compromise detection: `detection_timestamp, compromised_artifact, detection_method, indicator_of_compromise, affected_systems`
- Artifact replacement: `replacement_start, artifacts_replaced_list, systems_patched, validation_results, replacement_complete`
- Forensic analysis: `artifact_preservation, analysis_findings, attack_attribution, supply_chain_vendor_notification`
- Vendor response: `incident_reported_to_vendor, vendor_response_time, vendor_remediation_actions, vendor_communication_log`

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map 1.5:** Organizational risk tolerances are determined and documented → Supply chain risk explicitly addressed in risk register
- **Map 3.5:** Potential benefits of AI systems are examined → Vendor consolidation balances capability benefits against supply chain risk
- **Measure 2.7:** AI system security and resilience practices are documented → Package verification, container signing, model provenance tracking
- **Manage 1.3:** Third-party AI systems are routinely monitored → Vulnerability scanning, behavior monitoring, vendor relationship management
- **Govern 1.7:** Processes and procedures are in place for decommissioning and phasing out AI systems → Emergency artifact replacement runbooks

### NIST Trustworthiness Characteristics

- ✅ Valid and Reliable - Supply chain integrity essential for reliable AI system operation
- ✅ Safe - Prevents compromised dependencies causing operational failures or safety incidents
- ✅ Secure and Resilient - Core objective of supply chain security controls
- ✅ Accountable and Transparent - Provenance tracking enables accountability for artifact sources
- ⬜ Explainable and Interpretable - N/A for supply chain security
- ✅ Privacy-Enhanced - Prevents compromised AI from exfiltrating Protected data
- ⬜ Fair (Bias-Free) - N/A for supply chain security (though model poisoning could introduce bias)

### Colorado SB-24-205 Compliance

**Not currently applicable** - Supply chain security is foundational control, not specific to high-risk systems

However, supply chain compromise could violate SB-24-205 if compromised AI system:
- Makes discriminatory decisions due to backdoor or poisoned training data
- Fails to provide required transparency due to undisclosed model modifications
- Lacks verifiable provenance required for impact assessment evidence

### ISO 42001 Mapping

- **6.1.3.3:** Information security → Package verification, container signing, egress filtering
- **6.1.4.2:** AI system monitoring → Vulnerability scanning, behavior testing, resource monitoring
- **7.4:** Communication → Vendor incident response, disclosure coordination
- **8.1:** Operational planning and control → Approved vendor list, dependency pinning, staged deployment

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| System Owner | Ensure all AI models and dependencies used by systems have documented provenance and approval; verify quarterly that only approved artifacts deployed; investigate anomalous model behavior |
| Security Lead | Maintain approved vendor list and AI Tool Register; review and approve new AI tools, extensions, and model sources; investigate supply chain vulnerability alerts within 4 hours; conduct annual vendor security assessments |
| Operations Lead | Implement package hash verification and container image signing; monitor Dependabot and Trivy vulnerability scans; execute emergency artifact replacement procedures; maintain private package mirror (when deployed) |
| ARO | Accept residual risk for supply chain dependencies; approve new vendor onboarding; review supply chain incidents and approve lessons learned; ensure supply chain controls align with organizational risk tolerance |
| All Personnel | Use only approved AI tools and vendors; report suspicious package behavior (unexpected network connections, excessive resource usage); follow dependency pinning procedures; complete annual supply chain security training |

**Primary Owner:** Security Lead (ultimate accountability for supply chain security posture)

---

## 9. Incident Response

### Detection Indicators

- Dependabot/Trivy alert: Critical vulnerability in AI dependency or container image
- Resource consumption spike: Unexpected CPU/GPU usage suggesting crypto mining or malicious computation
- Network behavior anomaly: AI workload connecting to unapproved external endpoint
- Model behavior deviation: AI model producing unexpected outputs on known test datasets
- Security community notification: Public disclosure of compromised package, model, or extension
- User report: "AI tool behaving strangely" or "system slow for no apparent reason"
- Vendor notification: AI vendor reports supply chain compromise affecting RadioAstronomy.io dependencies

### Immediate Response Steps

1. **Containment (within 2 hours of detection):**
   - Isolate affected systems: Disable network access for hosts running compromised artifact
   - Inventory scope: Identify all systems using compromised package, model, or container
   - Suspend deployments: Freeze new deployments until compromise scope understood
   - Preserve evidence: Capture compromised artifacts for forensic analysis before replacement

2. **Assessment (within 4 hours of detection):**
   - Determine compromise timeline: When was compromised artifact introduced? What data processed since then?
   - Evaluate blast radius: What systems accessed? What data exposed? What credentials potentially stolen?
   - Check for persistence: Any backdoors, unauthorized accounts, or configuration changes introduced?
   - Vendor engagement: Contact AI vendor for confirmation, remediation guidance, and timeline

3. **Recovery (within 8 hours for critical systems, 24 hours for all systems):**
   - Replace compromised artifacts: Install verified clean versions of packages, models, containers
   - Rotate credentials: Change all credentials accessible from compromised systems
   - Rebuild compromised systems: Use Proxmox templates to rebuild from known-good images if compromise severity warrants
   - Validate integrity: Test rebuilt systems to ensure clean operation and no residual compromise

4. **Verification (within 48 hours of recovery):**
   - Comprehensive artifact audit: Verify all AI dependencies across infrastructure match approved versions
   - Security posture assessment: Confirm all security controls operational after remediation
   - Monitoring enhancement: Implement additional detection for specific indicators of compromise discovered

### Communication Plan

- **Internal:** 
  - Immediate: Slack alert to #security-incidents channel with affected systems and containment actions
  - 4 hours: Email to CTO, ARO, Review Board with scope assessment and recovery timeline
  - Daily: Status updates until all affected systems recovered and validated
  - 2 weeks: Postmortem presentation to engineering and operations teams with lessons learned

- **External:** 
  - AI Vendor: Engage immediately if vendor-supplied artifact compromised; coordinate disclosure and remediation
  - Collaboration Partners: If compromise enabled data breach affecting partners, notify within 24 hours per agreement terms
  - Security Community: Share sanitized indicators of compromise with CERT/FIRST to help protect broader community
  - Colorado AG: If compromise affects high-risk AI system with discriminatory impact, disclosure required per SB-24-205

### Post-Incident Actions

- [ ] Root cause analysis: How did compromised artifact enter infrastructure? Verification process failure? Zero-day supply chain attack? Insufficient vetting?
- [ ] Control hardening: Implement private package mirror to provide supply chain isolation; enhance container image signing enforcement; improve model provenance verification
- [ ] Vendor relationship review: Assess vendor's security practices; consider vendor replacement if supply chain security inadequate; renegotiate contracts for stronger indemnification
- [ ] Policy update if needed: Adjust approved vendor criteria; enhance dependency verification requirements; clarify incident disclosure obligations
- [ ] Lessons learned documentation: Add incident as training case study; update supply chain security training materials; document new compromise patterns
- [ ] Industry engagement: Submit indicators of compromise to threat intelligence sharing platforms; contribute to AI security community awareness

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Uncommon (sophisticated supply chain attacks are infrequent but high-impact; typosquatting more common but lower sophistication)
- **Safeguard Reliability:** Medium (approved vendor list and vulnerability scanning effective; hash verification and container signing partial; model provenance tracking immature)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Catastrophic Impact × High Expectancy (uncommon threat, no controls) = 9/10
- **Qualitative Rating:** Critical

**Residual Risk:**
- **Calculated Score:** Catastrophic Impact × Medium Expectancy (uncommon threat, medium reliability safeguards) = 6/10
- **Qualitative Rating:** Medium-High

### Risk Treatment Decision

**Treatment:** Mitigate (implement supply chain security controls to reduce risk to acceptable level; accept remaining residual risk with enhanced monitoring)

**Rationale:** 

Supply chain attacks represent one of the most severe AI security risks because they compromise trusted dependencies, bypassing perimeter security controls and exploiting organizational confidence in reputable sources. The potential impact is catastrophic—compromised AI models could exfiltrate all Protected research data, backdoored containers could establish persistent infrastructure access, malicious extensions could steal credentials enabling complete environment takeover.

RadioAstronomy.io cannot eliminate supply chain risk without prohibiting external AI dependencies entirely, which would require:
- Developing all AI models internally (infeasible for small research organization)
- Building private versions of all AI tooling (unsustainable operational burden)
- Eliminating productivity benefits of commercial AI services (unacceptable competitiveness impact)

Therefore, RadioAstronomy.io implements risk-based supply chain security strategy:

1. **Vendor Consolidation (Preventive):** Deliberately limited AI vendor count enables concentrated security review effort and stronger contractual relationships. Claude Max and Gemini Enterprise have mature security programs and responsive incident handling.

2. **Artifact Verification (Preventive, Partial):** Package hash verification and container image signing provide cryptographic integrity verification, though implementation currently partial due to operational complexity.

3. **Network Isolation (Preventive):** Egress filtering limits blast radius—compromised dependencies cannot exfiltrate to arbitrary endpoints, only to logged and monitored approved AI services.

4. **Vulnerability Scanning (Detective):** Dependabot and Trivy provide early warning of known compromises in dependencies, enabling proactive replacement before exploitation.

5. **Behavior Monitoring (Detective):** Resource consumption and network behavior monitoring detect supply chain compromises that evade static scanning (crypto miners, data exfiltration, C2 communication).

6. **Rapid Replacement (Corrective):** Immutable infrastructure and emergency replacement runbooks enable 8-hour recovery from supply chain incidents, limiting attacker window.

These controls reduce expectancy from "High" (inherent) to "Medium" (residual), resulting in "Medium-High" overall residual risk. This is higher than most RadioAstronomy.io risks, reflecting the challenge that supply chain security remains an active threat landscape without perfect defenses.

Residual risk consists of:
- Zero-day supply chain compromises in trusted vendors (e.g., compromised Claude Max or Gemini Enterprise)
- Sophisticated model poisoning undetectable by current behavior testing
- Typosquatting or dependency confusion attacks bypassing incomplete hash verification
- Insider threats at AI vendors with access to legitimate distribution channels
- Long-term persistence mechanisms surviving quarterly infrastructure rebuilds

RadioAstronomy.io accepts this residual risk level because:
- Alternative (no external AI dependencies) would eliminate core organizational capabilities
- Vendor consolidation to reputable providers (Anthropic, Google) provides reasonable assurance
- Layered defenses provide detection and response capabilities even when preventive controls bypassed
- Industry-wide challenge—all organizations using AI face similar supply chain risks
- Risk tolerance reflects reality that some supply chain risk inherent to modern AI development

The organization will continuously enhance supply chain security controls as capabilities mature (private package mirror, comprehensive hash verification, advanced model behavior testing) while maintaining operational focus on research mission. Quarterly risk reviews will assess if residual risk remains acceptable or requires additional investment in preventive controls.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: supply chain incident occurs, new AI vendor onboarded, high-profile industry supply chain compromise, new supply chain security technology becomes available)
- **Conditions:** 
  - Approved vendor list maintained with documented security assessments
  - All AI vendors have contractual protections and incident response SLAs
  - Dependency hash verification implemented for critical production systems (expand coverage quarterly)
  - Container image signing enforced for production deployments
  - Vulnerability scanning operational with <4 hour critical alert response
  - Network egress filtering operational with anomalous connection alerting
  - Model provenance documented for all production AI models
  - Quarterly infrastructure rebuilds from known-good templates
  - All personnel complete annual supply chain security training
  - Supply chain incidents trigger immediate vendor security reassessment
  - Review Board conducts annual evaluation of AI vendor security posture
  - Security Lead monitors AI supply chain threat intelligence and adjusts controls as new attacks emerge

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on RadioAstronomy.io vendor consolidation strategy and operational supply chain controls | David Thompson |
