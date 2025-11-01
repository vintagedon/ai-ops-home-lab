# R7: Hallucination & Inaccurate Output

**Risk ID:** R7  
**Risk Slug:** hallucination-inaccurate-output  
**System Context:** All AI systems producing external deliverables, documentation, research outputs, or customer-facing content  
**Category:** AI-Specific  
**Data Classes Involved:** Public (outputs become public documentation/deliverables)  
**Consequential Decision:** Depends on context - Yes if AI output directly influences employment, contracting, resource allocation, or research conclusions  
**Last Updated:** 2025-10-24

**Re-Assessment Triggers:** New AI model deployment | Change in output use case | Quality incident | External deliverable publication | Quarterly review

---

## 1. Threat Description

### What Could Go Wrong?

AI hallucination occurs when language models generate plausible-sounding but factually incorrect, nonsensical, or fabricated information with high confidence. Unlike traditional software bugs that produce consistent errors, AI hallucinations are stochastic—the same input may produce correct outputs 95% of the time and completely fabricated information 5% of the time, making them difficult to detect through conventional testing.

The risk manifests when AI-generated content bypasses human review and becomes part of external deliverables: research papers, technical documentation, grant proposals, collaboration agreements, or public communications. The hallucinated content appears authoritative and well-formatted, increasing the likelihood it will be accepted uncritically by reviewers unfamiliar with the subject matter or operating under time pressure.

For research organizations, this risk is particularly acute because AI systems are increasingly used to:
1. **Synthesize Research Findings:** Summarizing dozens of papers into literature reviews, potentially inventing citations or misrepresenting study conclusions
2. **Generate Technical Documentation:** Creating API documentation, system architecture descriptions, or operational procedures that include non-existent functions or incorrect parameters
3. **Draft External Communications:** Writing grant proposals, collaboration agreements, or public announcements that contain factual errors about capabilities, timelines, or prior work
4. **Produce Data Analysis Narratives:** Generating explanations of statistical results that invent causal relationships or misinterpret significance levels
5. **Create Educational Content:** Developing training materials or tutorials that include incorrect procedures, non-existent commands, or fabricated security recommendations

### Attack Vector / Failure Mode

**How it happens:**

1. **Citation Fabrication in Research Context:**
   - Researcher uses AI to draft literature review section for grant proposal
   - Prompt: "Summarize recent advances in astronomical spectroscopy validation techniques"
   - AI generates plausible-sounding summary with specific paper citations
   - Three of seven cited papers don't exist; fabricated DOIs and author names
   - Researcher spot-checks two citations (both real), assumes others are valid
   - Grant proposal submitted to NSF with fabricated citations
   - Peer reviewers attempt to access non-existent papers, question research credibility
   - Proposal rejected; organization flagged for potential misconduct investigation

2. **Technical Documentation Errors:**
   - Engineer uses AI to generate API documentation for data access service
   - AI invents three API endpoints that don't exist in actual implementation
   - Documentation published to public GitHub repository and organizational website
   - External collaborator builds integration based on hallucinated endpoints
   - Integration fails; collaborator wastes 40 hours troubleshooting non-existent APIs
   - Collaboration timeline delayed by three weeks; reputational damage to organization
   - Incident reveals no technical review process for AI-generated documentation

3. **Statistical Misinterpretation:**
   - Data analyst uses AI to generate narrative explanation of regression results
   - AI fabricates causal interpretation: "increased X directly causes 30% improvement in Y"
   - Actual analysis showed correlation only; multiple confounding variables unaddressed
   - Executive decision-maker reads AI-generated summary (not underlying analysis)
   - Resource allocation decision made based on hallucinated causal relationship
   - Six months later, expected improvements don't materialize ($150K wasted investment)
   - Root cause analysis traces decision to AI-hallucinated causal claim

**Attacker profile:** 
- **Primary:** No malicious actor—system failure due to inherent model limitations
- **Secondary:** Time-pressured staff who trust AI outputs without verification
- **Tertiary:** Reviewers who assume well-formatted, confident-sounding text is accurate

**Prerequisites:**
- AI-generated content published externally without human expert review
- Insufficient prompt engineering or context provided to AI system
- No validation process requiring citations/claims traced to source material
- Organizational culture that treats AI as authoritative rather than assistive
- Lack of metadata indicating which content was AI-generated (transparency failure)

### Real-World Examples

- **Air Canada Chatbot Case (2024):** Air Canada's customer service chatbot fabricated a bereavement travel policy that didn't exist. Customer booked ticket based on hallucinated policy. When Air Canada refused to honor chatbot's invented policy, customer sued and won. Court ruled company responsible for chatbot's hallucinations as they represented the company.

- **New York Lawyer Sanctions (2023):** Attorney used ChatGPT to research case law for federal court filing. AI invented six non-existent cases with fabricated citations, judicial opinions, and legal precedents. Attorney submitted brief without verifying citations. Court sanctioned attorney for submitting false information; case became landmark example of AI hallucination consequences.

- **Medical Chatbot Fabrication (2023):** Researchers tested medical AI chatbots and found they frequently invented treatment recommendations, drug interactions, and clinical trial results that didn't exist. 37% of responses contained at least one fabricated medical fact. Study highlighted critical need for expert review before using AI in clinical contexts.

---

## 2. Impact Analysis

### Primary Impacts

| Impact Category | Severity | Description |
|----------------|----------|-------------|
| Harm to Individuals | High | Fabricated information in published research or recommendations could lead collaborators to make decisions based on false premises; incorrect technical documentation wastes expert time on troubleshooting non-existent issues |
| Operational Disruption | Medium | Hallucinated documentation requires emergency corrections, republication cycles, and outreach to affected parties; correcting public record after fabricated citations is labor-intensive |
| Reputational Damage | High | Loss of scientific credibility from fabricated citations; collaborator trust erosion; potential misconduct allegations if fabrications discovered in funded proposals |
| Financial Impact | High | Grant proposal rejections due to credibility concerns ($50-500K lost funding); wasted labor from collaborators following hallucinated documentation (80-200 hours); potential legal liability if decisions made based on fabricated information |
| Regulatory/Compliance | Medium | Colorado SB-24-205 implications if hallucinated output influences consequential decisions; research integrity investigations if fabrications in funded work |

**Impact Level (CIS-RAM):** Unacceptable

### Cascading Effects

**R8: Legal & Compliance Gaps** - Hallucinated content may violate licensing terms if AI fabricates code examples or documentation from proprietary sources.

**R4: Infrastructure Drift** - AI-generated documentation that doesn't match actual system configuration creates persistent knowledge gaps, enabling misconfigurations.

**R1: Data Egress** - Fabricated technical documentation might inadvertently describe data access patterns or APIs that don't exist, misleading security assessments.

### Recovery Complexity

- **Time to detect:** Hours to months (hallucinations often discovered by external parties attempting to use fabricated information; internal detection requires systematic citation verification or technical validation)
- **Time to contain:** 1-3 days (identify all affected deliverables; assess scope of fabricated content; prepare corrections)
- **Time to recover:** 2-4 weeks (republish corrected documentation; notify affected parties; rebuild credibility with collaborators; update internal processes)

---

## 3. Technical Controls

### Preventive Controls (Stop it from happening)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Output Validation Workflow | N/A (Process) | Mandatory human expert review before external publication of AI-generated content; reviewer must trace claims to source material | ✅ Implemented |
| Citation Verification Automation | CIS 18.3 | Scripts validate DOIs/URLs in AI-generated text exist and are accessible before publication | 🟡 Partial |
| Prompt Engineering Standards | N/A (AI-Specific) | Required prompt templates that instruct models to cite sources, acknowledge uncertainty, and avoid speculation | ✅ Implemented |
| Model Selection Criteria | N/A (AI-Specific) | Prohibit use of models known for high hallucination rates in external deliverable generation; maintain approved model list | ✅ Implemented |
| AI Content Watermarking | N/A (Process) | All AI-generated drafts tagged with metadata indicating model, prompt, generation date to signal review required | 🟡 Partial |

### Detective Controls (Detect if it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Post-Publication Monitoring | CIS 8.2 | Track external feedback and error reports on published documentation; alert system for citation access failures | 🟡 Partial |
| Peer Review Feedback Loop | N/A (Process) | Systematic collection of reviewer comments on AI-generated content quality; quarterly analysis for hallucination patterns | ✅ Implemented |
| Automated Fact-Checking | CIS 18.3 | Fact-checking tools validate claims against authoritative databases (arXiv, PubMed, organizational knowledge bases) | ❌ Planned |

### Corrective Controls (Fix it after it happens)

| Control | CIS Control | Implementation | Status |
|---------|-------------|----------------|--------|
| Rapid Correction Protocol | N/A (Process) | Documented procedure for republishing corrected content, notifying affected parties, and documenting lessons learned | ✅ Implemented |
| Public Errata Process | N/A (Process) | Transparent correction mechanism (errata notices, changelog, stakeholder notifications) for published hallucinations | ✅ Implemented |

---

## 4. Process Controls

### Procedural Safeguards

- **Mandatory Expert Review:** All AI-generated content for external publication requires review by subject matter expert who verifies factual accuracy, validates citations, and confirms technical correctness
- **Citation Traceability Standard:** Every factual claim or citation in AI-generated text must be traceable to primary source; reviewer documents verification process
- **Phased Publication:** AI-generated drafts published first to internal review environment (private GitHub, SharePoint) for validation before public release
- **AI Transparency Labeling:** Published documentation includes disclosure when AI was used in generation; describes human review process applied

### Approval Workflows

- **Required approvals:** Subject matter expert (technical accuracy) + Legal review (if contractual implications) + Communications lead (if public-facing)
- **Escalation path:** If reviewer identifies hallucination in AI-generated draft, escalate to ARO for assessment of similar risks in other AI-generated content

### Training Requirements

- **Who needs training:** All staff using AI tools for external deliverable generation (researchers, engineers, communications team)
- **Training content:** Recognizing hallucination patterns; prompt engineering for accuracy; verification workflows; citation validation tools
- **Frequency:** Onboarding for new AI tool users; annual refresher; event-driven (when hallucination incident occurs)

---

## 5. Architectural Safeguards

### Design Principles

**AI as Draft, Human as Author:** Organizational standard treats AI-generated content as first-draft material requiring expert refinement, not as finished product. All external publications have named human author accountable for accuracy.

**Retrieval-Augmented Generation (RAG):** For technical documentation, implement RAG architecture where AI queries authoritative internal knowledge base (source code, validated specifications) before generating text, reducing fabrication risk.

**Output Confidence Scoring:** Where technically feasible, implement confidence scoring for AI outputs; low-confidence statements automatically flagged for additional human review.

### Network Segmentation

Not directly applicable to this risk category.

### Data Classification

**Public Data Only:** AI systems generating external deliverables operate only on Public data classification. Protected or Secrets data never used in prompts to prevent inadvertent disclosure through hallucinated output.

---

## 6. Evidence & Verification

### Control Effectiveness Evidence

| Control ID | Control | Owner | Evidence Type | Location | Verification Frequency |
|------------|---------|-------|---------------|----------|------------------------|
| AI-HALL-001 | Expert Review Workflow | System Owner | Review sign-off records | Project tracking system | Per publication |
| AI-HALL-002 | Citation Verification | System Owner | Verification checklist | Publication records | Per publication |
| AI-HALL-003 | Prompt Engineering Standards | ARO | Approved prompt templates | AI governance repository | Quarterly |
| AI-HALL-004 | Model Selection Criteria | ARO | Approved model list | AI governance repository | Quarterly |
| AI-HALL-005 | Post-Publication Monitoring | Security Lead | Error report logs | Monitoring dashboard | Weekly |

### Testing Procedures

- **Test scenario:** Generate test content using same AI workflow as production; inject known-false information in prompt; verify human review process catches fabrications
- **Expected result:** Reviewer identifies fabricated content; marks for correction before publication; documents finding in review log
- **Test frequency:** Quarterly for each AI-generating workflow; after any process change

### Audit Trail

- **Publication Record:** All external deliverables logged with metadata: AI model used, prompt template, reviewer names, verification checklist completion, publication date
- **Review Documentation:** For each publication, retain: original AI-generated draft, reviewer annotations, verified source citations, approval chain
- **Incident Reports:** When hallucination discovered post-publication: root cause analysis, affected stakeholders notified, corrective actions taken

---

## 7. Framework Mapping

### NIST AI RMF Alignment

- **Map:** MAP 1.1 (Context and purpose of AI system), MAP 3.4 (Assess AI system capabilities and limitations), MAP 5.1 (Organizational risk tolerance defined)
- **Measure:** MEASURE 2.7 (AI system performance metrics defined), MEASURE 2.11 (Fairness and bias metrics), MEASURE 3.1 (Mechanisms for tracking identified risks)
- **Manage:** MANAGE 1.1 (Risk treatment plan developed), MANAGE 3.1 (AI system risks monitored on ongoing basis), MANAGE 4.1 (Feedback processes established)
- **Govern:** GOVERN 1.5 (Organizational policies for AI system transparency), GOVERN 3.1 (Accountability structures and roles defined)

### NIST Trustworthiness Characteristics

- ✅ Valid and Reliable (primary focus - hallucinations undermine validity)
- ✅ Safe (incorrect technical documentation can cause operational safety issues)
- ⬜ Secure and Resilient
- ✅ Accountable and Transparent (disclosure of AI use, human accountability)
- ⬜ Explainable and Interpretable
- ⬜ Privacy-Enhanced
- ⬜ Fair (Bias-Free)

### Colorado SB-24-205 Compliance

**If AI-generated output influences consequential decisions:**
- Developer documentation obligation: Document known limitations and hallucination rates for model (§6-1-1702(2)(a))
- Deployer impact assessment: Include metrics for output accuracy and validation procedures (§6-1-1703(3)(b)(V))
- Consumer notification: If adverse decision based on AI output, provide explanation and correction mechanism (§6-1-1703(4))

### ISO 42001 Mapping

- **Clause 8.4:** AI system performance review (validates outputs meet accuracy requirements)
- **Clause 8.10:** Continuous validation of AI behavior post-deployment (detect hallucination pattern changes)
- **Clause 10.9:** Testing, validation, verification before deployment (establish baseline hallucination rates)
- **Clause 11.1:** Transparency framework (disclose AI use in publications)
- **Clause 11.9:** Documentation and audit trails (maintain publication records and review evidence)

---

## 8. Roles & Responsibilities

| Role | Responsibility |
|------|----------------|
| System Owner | Ensure all AI-generated external content reviewed by qualified expert before publication; maintain publication records |
| ARO | Approve prompt engineering standards; maintain approved model list; review hallucination incidents; update risk assessment based on observed hallucination rates |
| Subject Matter Expert | Verify factual accuracy of AI-generated content; validate citations; document review process; approve publication |
| Security Lead | Implement citation verification automation; monitor post-publication error reports |
| Communications Lead | Ensure AI transparency labeling on public deliverables; manage external notifications if corrections needed |

**Primary Owner:** System Owner (accountable for accuracy of published deliverables)

---

## 9. Incident Response

### Detection Indicators

- External collaborator reports non-existent citation or incorrect technical detail
- Automated citation verification script fails to resolve DOIs/URLs in published documentation
- Peer reviewer questions factual accuracy of AI-generated content during review process
- Internal staff member discovers fabricated information in published deliverable
- Systematic pattern of similar errors across multiple AI-generated publications

### Immediate Response Steps

1. **Contain (within 24 hours):** 
   - Verify hallucination confirmed (not human error in reporting)
   - Assess scope: single instance or pattern across multiple publications?
   - Temporarily retract affected content from public access if high-severity

2. **Investigate (within 48 hours):**
   - Review AI generation logs: model, prompt, parameters used
   - Interview content reviewer: was fabrication visible in review? Why not caught?
   - Check for similar hallucinations in other AI-generated content (same model/timeframe)

3. **Notify (within 72 hours):**
   - Internal: ARO, System Owner, legal counsel
   - External: Stakeholders who may have relied on fabricated information
   - Document notification list and communications sent

### Communication Plan

- **Internal:** 
  - Immediate: Slack alert to #ai-governance channel with hallucination details and affected publication
  - 24 hours: Email to ARO, CTO, Communications Lead with investigation findings and remediation plan
  - 1 week: All-staff meeting if systemic issue affecting multiple publications

- **External:** 
  - Affected Collaborators: Direct personal outreach within 48 hours if they acted on fabricated information; provide correct information and apology
  - Public Errata Notice: If widely distributed publication (GitHub, website), publish correction notice with transparent explanation; maintain permanent record
  - Funders: If hallucination in grant-funded work, notify program officer per award terms; may require formal incident report

### Post-Incident Actions

- [ ] Root cause analysis: Why did hallucination occur? Was it prompt engineering failure? Insufficient model context? Reviewer training gap?
- [ ] Control hardening: Strengthen citation verification automation; enhance reviewer training; update prompt templates to reduce hallucination risk
- [ ] Policy update if needed: If incident revealed gap in AI content review policy, update standards for future prevention
- [ ] Lessons learned documentation: Share incident as training case study (anonymized if appropriate); update onboarding materials
- [ ] Proactive audit: Review all AI-generated publications from same timeframe for similar hallucinations; validate no additional fabrications exist

---

## 10. Risk Decision (CIS-RAM Assessment)

### Threat & Safeguard Assessment

- **Threat Commonality:** Common (AI hallucination is inherent limitation of current language models; occurs probabilistically in all generative AI systems)
- **Safeguard Reliability:** Medium-High (expert human review is effective but depends on reviewer diligence, time availability, and subject matter expertise; occasional lapses inevitable)

### Risk Scores

**Inherent Risk:**
- **Calculated Score:** Unacceptable Impact × High Expectancy (common threat, no controls) = 8/10
- **Qualitative Rating:** High

**Residual Risk:**
- **Calculated Score:** Unacceptable Impact × Low Expectancy (common threat, medium-high reliability safeguards) = 4/10
- **Qualitative Rating:** Medium

### Risk Treatment Decision

**Treatment:** Mitigate (implement layered human review and validation controls to reduce risk to acceptable level)

**Rationale:**

AI hallucination cannot be eliminated—it is fundamental limitation of current large language model architectures. Models generate statistically plausible text based on pattern matching, not factual knowledge retrieval. They have no internal fact-checking mechanism and cannot reliably distinguish truth from plausible-sounding fabrication. Therefore, eliminating this risk would require prohibiting all AI use in external deliverable generation, which would sacrifice significant productivity benefits.

However, unmitigated hallucination risk is unacceptable for research organization. Scientific credibility depends on factual accuracy. A single instance of fabricated citations in funded proposal could trigger misconduct investigation, jeopardize future funding, and damage collaborator relationships. Incorrect technical documentation wastes partner resources and erodes trust. The reputational impact of hallucination incidents is disproportionate to immediate operational harm.

Therefore, RadioAstronomy.io implements defense-in-depth approach treating AI as assistive tool rather than autonomous author:

1. **Expert Human Review (Preventive):** Mandatory review by subject matter expert before any external publication. Reviewer explicitly validates factual claims, verifies citations, and confirms technical accuracy. This is primary control—human expertise catches hallucinations AI systems cannot self-detect.

2. **Prompt Engineering Standards (Preventive):** Standardized prompts instruct models to cite sources, acknowledge uncertainty ("According to [Source]..." vs. definitive statements), and request conservative outputs. Reduces but doesn't eliminate hallucination frequency.

3. **Citation Verification Automation (Preventive/Detective):** Automated scripts validate all URLs/DOIs in draft content are accessible before publication. Catches fabricated citations that human reviewers might miss under time pressure.

4. **AI Transparency Labeling (Accountability):** Published content discloses AI use in generation. Signals to readers that human review occurred; establishes accountability chain (named human author responsible, not abstract "AI system").

5. **Model Selection Criteria (Preventive):** Prohibit use of models with documented high hallucination rates for external content generation. Maintain approved model list based on benchmark testing. While no model is hallucination-free, some architectures perform measurably better.

6. **Retrieval-Augmented Generation (Preventive):** Where feasible, implement RAG architecture grounding AI generation in verified internal knowledge base. Significantly reduces fabrication when generating technical documentation.

7. **Post-Publication Monitoring (Detective):** Systematic tracking of external feedback, error reports, and citation access failures. Enables rapid detection if hallucination bypasses review.

8. **Rapid Correction Protocol (Corrective):** Documented procedure for transparent correction and stakeholder notification if hallucination discovered post-publication. Minimizes reputational damage through swift, honest response.

These layered controls reduce expectancy from "High" (inherent) to "Low" (residual), bringing overall risk to "Medium" level. Residual risk consists of:
- Time-pressured reviews where expert misses subtle fabrications
- Novel hallucination patterns not caught by automated checks (e.g., plausible-sounding but non-existent technical specifications)
- External stakeholders acting on hallucinated information before organization detects error
- Reviewer subject matter gaps (expert in Domain A reviews Domain B content)

RadioAstronomy.io accepts this residual risk level because:
- Alternative (prohibit AI use in content generation) would eliminate productivity gains without addressing human authoring errors (which also occur)
- Defense-in-depth provides reasonable protection for vast majority of content
- Transparent correction protocol limits reputational damage when residual risk manifests
- Research integrity ultimately depends on human expert judgment; AI serves as draft-generation tool, not authoritative source
- Industry standard for responsible AI use is "AI-assisted, human-reviewed"—this approach aligns with emerging best practices

Organization monitors hallucination risk through quarterly metrics: hallucinations detected in review vs. post-publication, hallucination rate by model/use-case, time-to-correction for incidents. If residual risk trends upward (more post-publication discoveries, slower corrections), controls will be strengthened.

### Residual Risk Acceptance

- **Accepted by:** David Thompson (AI Risk Officer)
- **Date:** 2025-10-24
- **Review date:** 2026-01-24 (quarterly review sooner if: hallucination incident in high-visibility publication, pattern of review process failures, new AI model deployment with different hallucination profile, Colorado SB-24-205 enforcement action establishes precedent)
- **Conditions:** 
  - Mandatory expert review for all external AI-generated content before publication (no exceptions)
  - Approved AI model list maintained with documented hallucination characteristics
  - Citation verification automation operational for all publications
  - Prompt engineering standards enforced through template library
  - AI transparency labeling on all AI-assisted publications
  - Rapid correction protocol tested annually through tabletop exercise
  - Post-publication monitoring dashboard reviewed weekly
  - Hallucination incidents trigger immediate review of similar content
  - Quarterly review of hallucination incident trends and control effectiveness
  - Annual training for all AI content creators on hallucination risks and mitigation
  - Review Board conducts annual assessment of content quality and review process effectiveness

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-24 | Initial risk scenario based on industry incidents and AI governance best practices | David Thompson |
