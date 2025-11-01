# AI Transparency & Disclosure Standard v1.1

Document ID: STD-004  
Version: 1.1  
Effective Date: 2025-10-26  
Last Updated: 2025-10-26  
Document Owner: CTO  
Review Cycle: Annual (or upon material AI service changes)  
Status: Active

---

## Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-01-15 | CTO | Initial standard based on NIST AI RMF and Colorado SB24-205 |
| 1.1 | 2025-10-26 | CTO | Removed all unapproved OpenAI/ChatGPT/GPT-4 references; added Z.ai/GLM-4.6 with training disclosure requirement (Section 4.2.4); updated tool examples to match approved set (Gemini, Claude Max, Z.ai, local models); aligned data classification references with 4-tier system; updated monitoring tool list. |

---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Scope](#2-scope)
3. [Transparency Principles](#3-transparency-principles)
4. [Disclosure Requirements](#4-disclosure-requirements)
5. [Documentation Standards](#5-documentation-standards)
6. [Stakeholder Communication](#6-stakeholder-communication)
7. [Limitations and Risks](#7-limitations-and-risks)
8. [Monitoring and Compliance](#8-monitoring-and-compliance)
9. [Regulatory Compliance](#9-regulatory-compliance)
10. [Roles and Responsibilities](#10-roles-and-responsibilities)
11. [References](#11-references)
12. [Appendices](#12-appendices)

---

## 1. Purpose

This standard establishes transparency and disclosure requirements for AI systems deployed or used within RadioAstronomy.io operations. It ensures:

- Transparency about AI capabilities, limitations, and risks
- Disclosure of AI involvement in content, decisions, and processes
- Accountability through clear documentation and communication
- Trust with stakeholders through honest representation of AI use
- Compliance with NIST AI RMF, Colorado SB24-205, and ethical AI principles

This standard applies to:

- AI-generated or AI-assisted content (documents, code, analysis)
- AI systems used in decision-making or recommendations
- Research outputs involving AI tools
- Public-facing materials created with AI assistance
- Internal documentation and communication

---

## 2. Scope

### 2.1 In Scope

AI Systems:

- Large Language Models (Gemini, Claude Max, Z.ai GLM-4.6, local Llama models)
- Computer vision models for astronomical image processing
- Machine learning models for data analysis
- AI-powered development and documentation tools

Content Types:

- Research papers and publications
- Technical documentation and reports
- Software code and documentation
- Blog posts and public communications
- Internal analysis and recommendations
- Meeting notes and summaries

Stakeholders:

- Academic collaborators and research partners
- Funding agencies and grant reviewers
- Open-source community and contributors
- General public and media
- Internal team members

### 2.2 Out of Scope

- General IT transparency (covered in IT policies)
- Financial disclosures (covered in financial policies)
- Personnel matters (covered in HR policies)
- Non-AI data processing transparency

### 2.3 Related Policies

- POL-001: AI Governance Policy (overarching framework)
- STD-001: AI System Assessment Standard (risk assessment)
- STD-003: Secure AI Systems Standard (security controls, data classification)
- AUP-001: AI Acceptable Use Policy (user behavior)

---

## 3. Transparency Principles

RadioAstronomy.io's transparency approach is guided by the following principles:

### 3.1 Honesty

Principle: Truthfully represent AI involvement in content and decisions.

Application:

- Never claim AI-generated content as entirely human-created
- Disclose when AI significantly contributed to analysis or conclusions
- Acknowledge AI limitations when they affect outputs
- Correct misrepresentations promptly if discovered

Example:

```markdown
✓ Good: "This code was generated with AI assistance (Gemini) and reviewed by engineers."
✗ Bad: Submitting AI-generated code without disclosure, implying human authorship.
```

### 3.2 Clarity

Principle: Use clear, accessible language to explain AI involvement.

Application:

- Avoid technical jargon in stakeholder communications
- Explain AI capabilities in context-appropriate terms
- Provide examples of AI use when helpful
- Tailor disclosure depth to audience needs

Example:

```markdown
For academic audience: "Analysis performed using Gemini 2.5 Pro (Google) LLM for pattern recognition in astronomical datasets."

For general public: "We used AI tools to help identify patterns in star data."
```

### 3.3 Accessibility

Principle: Make transparency information easy to find and understand.

Application:

- Include AI disclosure in prominent locations (abstracts, introductions, READMEs)
- Provide links to detailed AI methodology where applicable
- Maintain public documentation of AI systems in use
- Ensure disclosures are readable by non-technical stakeholders

### 3.4 Completeness

Principle: Provide sufficient information for stakeholders to understand AI's role.

Application:

- Disclose both capabilities and limitations
- Include risks or uncertainties when material
- Explain data sources for AI training (where known)
- Document human oversight and validation processes

### 3.5 Timeliness

Principle: Provide AI disclosures when stakeholders need them.

Application:

- Disclose AI involvement at time of content publication/sharing
- Update disclosures if AI use changes significantly
- Retroactively disclose if previously unknown AI involvement discovered
- Maintain disclosure records for future reference

---

## 4. Disclosure Requirements

### 4.1 Disclosure Thresholds

Not all AI use requires the same level of disclosure. Use these thresholds to determine appropriate disclosure depth:

| AI Use Case | Disclosure Level | Required Information |
|-------------|-----------------|---------------------|
| Minimal AI Assistance (spell-check, grammar, minor suggestions) | None required | Optional: Brief mention acceptable |
| Moderate AI Assistance (code suggestions, data analysis help, content expansion) | Basic Disclosure | Tool name, general purpose, human review |
| Substantial AI Assistance (significant content generation, complex analysis, decision support) | Detailed Disclosure | Tool name, specific use, limitations, validation process |
| AI-Primary Content (majority of content AI-generated, minimal human editing) | Comprehensive Disclosure | Full methodology, tool details, limitations, risks, validation |

Decision Framework:

```markdown
Ask: What percentage of intellectual contribution came from AI?
├─ <10%: Minimal (no disclosure required)
├─ 10-40%: Moderate (basic disclosure)
├─ 40-80%: Substantial (detailed disclosure)
└─ >80%: AI-Primary (comprehensive disclosure)

Ask: Could AI limitations materially affect conclusions?
└─ Yes: Increase disclosure level by one tier

Ask: Is this high-stakes content (research publication, funding application)?
└─ Yes: Increase disclosure level by one tier

Ask: Would stakeholders reasonably expect to know about AI use?
└─ Yes: Ensure appropriate disclosure
```

### 4.2 Required Disclosure Elements

#### 4.2.1 Tool Identification

Requirement: Name the specific AI tool(s) used.

Rationale: Different tools have different capabilities, limitations, and training behaviors. Stakeholders need specific information for informed evaluation.

Format:

```markdown
AI Tool: Google Gemini 2.5 Pro
AI Tools: Anthropic Claude Sonnet 4.5, local Llama 3.1 8B
```

Do NOT use generic terms like "AI" or "large language model" without tool identification.

Examples:

✓ Good: "Code generated using Google Gemini 2.5 Pro"  
✓ Good: "Analysis performed with Anthropic Claude Sonnet 4.5 and Z.ai GLM-4.6"  
✗ Bad: "This was created with AI assistance" (too vague)  
✗ Bad: "We used an LLM for this" (not specific)

#### 4.2.2 Purpose and Scope

Requirement: Explain what the AI tool was used for and the extent of its contribution.

Rationale: Stakeholders need to understand which parts of the work involved AI and which parts were human-driven.

Format:

```markdown
AI Purpose: Literature review and initial pattern identification
AI Scope: Approximately 30% of analysis; all findings validated by domain experts
```

Be specific about boundaries:

```markdown
AI-Generated: Initial code structure and boilerplate
Human-Authored: Core algorithms, security-critical functions, integration logic
```

#### 4.2.3 Human Oversight and Validation

Requirement: Describe human review, validation, or quality control applied to AI outputs.

Rationale: Stakeholders want assurance that AI outputs were verified by qualified humans.

Format:

```markdown
Validation: Code reviewed by senior engineers for correctness and security
Review: All AI-suggested statistical methods validated against textbook references
Quality Control: Domain expert (astronomer with 10+ years experience) verified all conclusions
```

Avoid defensive or dismissive language:

✗ Bad: "Obviously we checked it"  
✗ Bad: "Don't worry, we validated everything"  
✓ Good: "Validation performed by [role] with [qualification]"

#### 4.2.4 Training Behavior Disclosure (NEW - v1.1)

Requirement: Disclose whether the AI tool trains on submitted data.

Rationale: Stakeholders have legitimate interest in whether their content contributes to model training, especially in research and open-source contexts.

For Z.ai GLM-4.6:

```markdown
Training Behavior: Content reviewed using Z.ai GLM-4.6, which trains on submitted code. Used only for Public-External astronomy and data science research code (per STD-003 Section 3.2). Not used for infrastructure or proprietary code.
```

For Tools with Training Opt-Out (Gemini, Claude Max):

```markdown
Training Behavior: Tool configured with training opt-out; submitted data not used for model training.
```

For Local Models (Llama 3.1 8B):

```markdown
Training Behavior: Local air-gapped deployment; data never transmitted externally and not used for training.
```

This disclosure is MANDATORY when using Z.ai and RECOMMENDED for all AI tools in public-facing content.

#### 4.2.5 Limitations and Risks

Requirement: Acknowledge material limitations or risks associated with AI use.

Rationale: Transparency includes honest communication about what AI cannot do or where it might fail.

Format:

```markdown
Limitations:
- AI may generate plausible but incorrect citations (all references verified by human researcher)
- Pattern recognition optimized for visual appearance; physical validation required
- Statistical suggestions may not account for domain-specific constraints

Known Risks:
- Model trained on publicly available code; may reflect common but outdated practices
- Hallucination risk for obscure or specialized topics
```

Be honest about uncertainties:

```markdown
Uncertainty: AI-suggested parameter values are based on pattern matching; physical interpretation validated but confidence interval estimation required further analysis.
```

### 4.3 Disclosure Formats by Content Type

#### 4.3.1 Research Papers

Location: Methods section (preferred) or acknowledgments section

Minimum Required:

- Tool identification
- Specific use (data analysis, literature review, etc.)
- Human validation process
- Training behavior (if using Z.ai)

Example:

```markdown
## Methods

### AI-Assisted Analysis

This research employed Google Gemini 2.5 Pro for initial literature review and pattern identification in observational datasets. Specific contributions:

1. Literature Review: AI identified candidate papers based on keyword searches. All papers reviewed by human researchers; final selection and interpretation performed by authors.

2. Data Pattern Recognition: AI flagged potential periodicities in time-series data. All patterns validated against physical models and confirmed through traditional Fourier analysis.

All AI-assisted analysis was reviewed by domain experts with radio astronomy specialization. Final conclusions and interpretations are the work of the human research team.

Training Behavior: Gemini configured with training opt-out; data not used for model training.
```

#### 4.3.2 Software Code

Location: README file + inline comments for AI-generated sections

Minimum Required:

- Tool identification
- Which portions are AI-generated vs human-written
- Review process
- Training behavior (especially if using Z.ai)

Example README:

```markdown
# Project Name

## AI Disclosure

This codebase includes AI-assisted development:

- **Tool**: Google Gemini 2.5 Pro
- **AI-Generated**: Initial API client implementation (~40% of `src/client/`), unit test scaffolding
- **Human-Authored**: Core algorithm implementations, security-critical functions, integration logic
- **Review**: All AI-generated code reviewed by senior engineers for correctness, security, and maintainability
- **Training**: Gemini configured with training opt-out per organizational policy

AI-generated sections are marked with inline comments:
```python
# AI-GENERATED: Gemini 2.5 Pro (reviewed by [engineer])
def example_function():
    ...
```
```

Example Inline Comment:

```python
# AI-GENERATED: Gemini 2.5 Pro - Initial implementation
# REVIEWED: [Engineer Name] - 2025-10-26 - Validated logic, added error handling
def process_data(input_data):
    # Human modification: Added input validation
    if not input_data:
        raise ValueError("Input data required")
    
    # AI-generated processing logic (validated)
    result = transform(input_data)
    return result
```

#### 4.3.3 Technical Documentation

Location: Document header, footer, or dedicated section

Minimum Required:

- Tool identification
- Content contribution level (percentage or description)
- Human review
- Training behavior (if applicable)

Example Header:

```markdown
# System Architecture Documentation

**AI Disclosure**: This document was drafted using Anthropic Claude Sonnet 4.5 (~60% AI-generated content). Technical accuracy validated by lead architect. Final structure and critical sections authored by human team. Training opt-out enabled.

---

[Document content]
```

#### 4.3.4 Internal Reports and Analysis

Location: Executive summary or document metadata

Minimum Required:

- Tool identification
- Analysis contribution
- Validation process

Example:

```markdown
# Q3 Data Analysis Report

**Executive Summary**

[Summary content]

**AI Disclosure**: Data analysis performed with assistance from local Llama 3.1 8B model (air-gapped deployment). AI identified statistical trends; all findings validated by data science team. Final recommendations and strategic interpretation authored by human analysts.

---

[Report content]
```

#### 4.3.5 Blog Posts and Public Communications

Location: Author byline, footnote, or end-of-post disclosure

Minimum Required:

- Tool identification
- Content contribution (keep simple for general audience)
- Human review

Example:

```markdown
# Blog Post Title

[Content]

---

*This post was written with assistance from Google Gemini 2.5 Pro. The author drafted the outline and key points; AI expanded sections and suggested phrasing. All content reviewed and edited by the author for accuracy.*
```

### 4.4 Special Disclosure Scenarios

#### 4.4.1 Collaborative Work with External Partners

Challenge: External collaborators may have different AI policies or transparency practices.

Requirements:

- Align disclosure approach with partners before publication
- Ensure all parties agree on AI disclosure language
- Respect partner's more restrictive policies if applicable
- Document AI use in shared collaboration agreements

Process:

1. Identify all AI use by any collaborator
2. Draft disclosure statement collaboratively
3. Obtain approval from all parties before publication
4. Include disclosure in agreed location (methods, acknowledgments, etc.)

#### 4.4.2 Retroactive Disclosure

Scenario: AI involvement was not disclosed initially, or new information about AI training/behavior is discovered after publication.

Requirements:

- Disclose as soon as discovery is made
- Explain why disclosure was omitted initially (unknown, oversight, policy change)
- Update affected materials if possible (erratum, README update, website correction)
- Notify stakeholders if AI involvement could affect their use/interpretation

Process:

1. Document what was omitted and why
2. Prepare disclosure statement with retroactive context
3. Update materials where feasible
4. Communicate proactively to affected stakeholders
5. Learn from incident to prevent recurrence

Example Retroactive Disclosure:

```markdown
## Correction: AI Disclosure (2025-10-26)

This paper, originally published 2025-09-15, did not disclose AI assistance in literature review. We correct this omission:

AI Use: Google Gemini 2.5 Pro was used for initial literature search and paper identification in Section 2.1. All identified papers were reviewed by human researchers; final selection and interpretation performed by authors. This omission was an oversight; our current policy requires explicit disclosure.

This correction does not affect the paper's conclusions or validity. We apologize for the initial omission.
```

#### 4.4.3 AI Tools No Longer in Use

Scenario: Content was created with AI tool that is no longer approved or available.

Requirements:

- Continue to disclose historical AI use accurately
- Note tool is no longer in use (if relevant to interpretation)
- Do not remove historical disclosures for compliance reasons

Example:

```markdown
Historical Note: This codebase (2024-2025) includes sections generated with OpenAI GPT-4, which was part of our approved toolset at the time. As of 2025-10-26, we no longer use OpenAI tools. Historical AI-generated sections are marked in comments.
```

### 4.5 Disclosure Waiver and Exceptions

Rare situations may justify reduced disclosure:

#### 4.5.1 Classified or Proprietary Work

- If full AI methodology disclosure would reveal classified information or trade secrets
- Provide maximum disclosure possible without compromising security
- Document reason for limited disclosure in internal records
- CTO approval required for disclosure reduction

#### 4.5.2 Emergency Response

- In time-critical incident response, immediate action may precede documentation
- Retroactive disclosure required within 48 hours
- Document decision rationale and AI contribution

Waiver requests must include:

- Justification for exception
- Stakeholder impact assessment
- Compensating disclosure (what will be disclosed instead)
- CTO approval signature

---

## 5. Documentation Standards

### 5.1 AI System Inventory

Requirement: Maintain public inventory of approved AI systems in use.

Location: Public website or repository (e.g., https://radioastronomy.io/ai-tools)

Minimum Contents:

- Tool name and version
- Vendor/provider
- Primary use cases
- Data classification restrictions
- Training behavior (trains on data? opt-out enabled?)
- Last updated date

Example:

```markdown
# RadioAstronomy.io AI Systems Inventory

Last Updated: 2025-10-26

## Approved AI Tools

### Google Gemini 2.5 Pro
- **Vendor**: Google (via Workspace)
- **Use Cases**: Code generation, data analysis, documentation, general assistance
- **Data Restrictions**: Public-Internal and Public-External only (NOT for Protected data)
- **Training**: Opt-out enabled at Workspace level
- **Access**: All personnel

### Anthropic Claude Sonnet 4.5
- **Vendor**: Anthropic
- **Use Cases**: High-quality documentation, strategic analysis, Protected data processing (via Kasm)
- **Data Restrictions**: All tiers (Public, Protected) with appropriate controls
- **Training**: Opt-out enabled
- **Access**: CTO only

### Z.ai GLM-4.6
- **Vendor**: Z.ai
- **Use Cases**: Astronomy and data science research code review
- **Data Restrictions**: Public-External only (research code where training acceptable)
- **Training**: Trains on submitted data (disclosed per STD-004)
- **Access**: Engineer role only

### Meta Llama 3.1 8B
- **Vendor**: Meta (open-source)
- **Use Cases**: Local/air-gapped operations, Protected data processing
- **Data Restrictions**: All tiers including Protected
- **Training**: Air-gapped, no external data transmission
- **Access**: All personnel

## Prohibited Tools
- Personal AI accounts (free Claude, consumer Gemini, etc.)
- Unapproved commercial AI services
- Tools without clear data handling policies
```

### 5.2 Project-Level AI Documentation

For each project using AI tools:

Required Documentation:

- AI Usage Log: Track which tools used when and for what purpose
- Disclosure Records: Archive all AI disclosures made for the project
- Validation Records: Document human review and validation process
- Lessons Learned: Note what worked well and what challenges occurred

Template:

```markdown
# [Project Name] - AI Usage Documentation

## AI Tools Used

| Tool | Date Range | Purpose | Data Classification | Training Behavior |
|------|-----------|---------|-------------------|------------------|
| Gemini 2.5 Pro | 2025-01-15 to present | Code generation, docs | Public-Internal | Opt-out enabled |
| Local Llama | 2025-03-01 to present | Protected data analysis | Protected | Air-gapped |

## Disclosures Made

| Date | Content Type | Location | Disclosure Level |
|------|-------------|----------|-----------------|
| 2025-06-15 | Research Paper | Methods section | Detailed |
| 2025-07-01 | Code Repository | README | Basic |

## Validation Process

- All AI-generated code reviewed by [Engineer Name]
- Statistical analysis validated against [Reference]
- Domain expert review by [Expert Name]

## Lessons Learned

- AI excellent for boilerplate, less reliable for domain-specific logic
- Disclosure in README worked well; stakeholders appreciated transparency
- Need clearer guidance on inline code comment format for AI sections
```

### 5.3 Transparency Audit Trail

Requirement: Maintain records for regulatory compliance and internal audit.

Records to Keep:

- All AI disclosures (copies or links)
- Waiver requests and approvals
- Retroactive disclosure incidents and responses
- Stakeholder questions/concerns about AI use and responses
- Policy compliance reviews

Retention: 5 years minimum (or per regulatory requirements)

---

## 6. Stakeholder Communication

### 6.1 Proactive Communication

Best Practices:

- Communicate AI policies before stakeholders ask
- Provide clear, accessible AI documentation
- Offer opportunities for stakeholder questions
- Update stakeholders when AI practices change

Example Public Statement:

```markdown
## AI Tools We Use

RadioAstronomy.io uses AI tools to assist with data analysis, literature review, and documentation. All AI-assisted research is validated by human domain experts, and we disclose AI involvement in our publications.

## How We Use AI

- Research: Literature review, data analysis assistance, pattern recognition
- Development: Code generation, testing, documentation
- Operations: System monitoring, log analysis

## Our Commitments

- Transparency: We disclose AI use in all public outputs
- Validation: Human experts review all AI-generated content
- Responsibility: We take accountability for AI-assisted work
- Ethics: We follow NIST AI RMF principles and responsible AI practices

Questions? Contact us at transparency@radioastronomy.io
```

### 6.2 Stakeholder-Specific Messaging

Tailor communications to audience:

Academic Community:

- Emphasize validation methodology
- Provide detailed AI tool specifications
- Explain how AI fits in research workflow
- Offer to answer methodological questions

Funding Agencies:

- Align with agency AI policies
- Demonstrate responsible AI governance
- Show human oversight and expertise
- Document compliance with guidelines

Open-Source Community:

- Be explicit about AI-generated code
- Explain quality control process
- Welcome community review
- Respect contributors' preferences on AI use

General Public:

- Use accessible language (avoid jargon)
- Focus on benefits and safeguards
- Explain human role clearly
- Provide examples

### 6.3 Responding to Transparency Questions

When stakeholders ask about AI use:

Guidelines:

- Respond promptly and completely
- Provide specific details (tool, purpose, validation)
- Acknowledge concerns respectfully
- Offer additional information if needed
- Document question and response

Never:

- Dismiss concerns as unimportant
- Provide vague or evasive answers
- Blame stakeholders for asking
- Promise things not in organizational policy

Example Response:

```markdown
Thank you for asking about our AI use in [specific content].

We used [Tool Name] for [specific purpose]. The AI contribution was approximately [X%] of the [content type]. All AI outputs were reviewed by [role with qualification]. [Additional validation details].

Training behavior: [Tool trains/doesn't train on data].

Does this address your question? I'm happy to provide additional details about our methodology.
```

### 6.4 Managing Transparency Concerns

If stakeholders express concern about AI use:

1. Listen and understand the specific concern
2. Determine if concern relates to:
   - Disclosure adequacy (need better transparency?)
   - Validation process (need more human review?)
   - Tool choice (concerned about specific tool?)
   - Policy compliance (should we be using AI here?)
3. Address concern substantively (not defensively)
4. Document concern and resolution
5. Escalate to CTO if policy-level issue

---

## 7. Limitations and Risks

### 7.1 Known AI Limitations

Common limitations to disclose when material:

Hallucination:

- AI may generate plausible but incorrect information
- Particularly problematic for citations, facts, and technical details
- Mitigation: Human verification of all factual claims

Bias:

- AI trained on internet data may reflect societal biases
- Can manifest in language, examples, or recommendations
- Mitigation: Review for bias; diverse human review team

Context Window:

- AI has limited memory/context (conversation length limits)
- May lose track of earlier instructions or constraints
- Mitigation: Provide complete context; validate outputs independently

Domain Expertise:

- AI lacks true understanding; pattern-matches from training data
- May miss domain-specific nuances or constraints
- Mitigation: Domain expert review required

Inconsistency:

- Same prompt may generate different outputs
- Randomness in generation process
- Mitigation: Generate multiple outputs; select best; validate

### 7.2 Risk Disclosure

Disclose risks when material to stakeholder decision-making:

Data Privacy Risk:

```markdown
Risk: While we use tools with training opt-out enabled, data transmitted to cloud services carries inherent privacy considerations. We process only Public and Protected data (not Secrets or PII) through AI services per our data classification policy.
```

Intellectual Property Risk:

```markdown
Risk: AI-generated content may inadvertently resemble training data. We review all AI outputs for originality and provide appropriate attribution when sources are identified.
```

Reliability Risk:

```markdown
Risk: AI outputs may be incorrect or incomplete. All AI-assisted analysis undergoes validation by qualified domain experts before use in decision-making or publication.
```

---

## 8. Monitoring and Compliance

### 8.1 Transparency Compliance Reviews

Frequency: Quarterly

Process:

1. Review sample of published content for appropriate AI disclosure
2. Verify AI system inventory is current
3. Check stakeholder communications for transparency adequacy
4. Identify gaps or improvement opportunities
5. Document findings and corrective actions

Metrics:

- Percentage of AI-assisted content with required disclosures
- Number of stakeholder questions about AI use (trend)
- Number of retroactive disclosures required (lower is better)
- Time to respond to transparency inquiries (target: <48 hours)

### 8.2 AI Usage Monitoring

Track AI usage to ensure appropriate disclosure:

Monitoring Points:

- AI service usage logs (Gemini, Claude Max, Z.ai, local models)
- Data classification of AI-processed content
- Publications and releases involving AI
- Stakeholder communications about AI

Tools:

- Google Workspace audit logs (Gemini usage)
- Anthropic usage dashboard (Claude Max)
- Z.ai usage logs (if available)
- Graylog SIEM (local model access)
- Git commits with AI-generated code tags

### 8.3 Training and Awareness

Required Training:

- All Personnel: AI disclosure requirements (annual)
- Content Creators: Detailed disclosure formatting (onboarding + annual)
- Researchers: Academic disclosure standards (onboarding)
- Engineers: Code disclosure best practices (onboarding)

Training Content:

- When disclosure is required (thresholds)
- How to disclose (formats and examples)
- Training behavior disclosure (Z.ai special requirements)
- Where to get help (Security Lead contact)
- Consequences of non-disclosure (policy violation)

---

## 9. Regulatory Compliance

### 9.1 NIST AI RMF Alignment

This standard implements NIST AI RMF transparency and accountability principles:

| NIST Principle | Implementation in This Standard |
|----------------|-------------------------------|
| Explainable and Interpretable | Section 4.2: Required disclosure elements explain AI's role |
| Accountable and Transparent | Section 4.3: Format examples enable stakeholder understanding |
| Valid and Reliable | Section 4.2.3: Human validation requirements |
| Privacy-Enhanced | Section 7.2: Data privacy risk disclosure |

### 9.2 Colorado SB24-205 Compliance

Colorado AI Act (SB24-205) requires transparency for high-risk AI systems:

Requirements:

- Disclosure of AI use in consequential decisions
- Notice to affected parties
- Explanation of AI's role in decision process

Implementation:

- High-risk AI systems (per STD-001 assessment) receive enhanced disclosure (Section 4.1: increase disclosure level)
- Stakeholders affected by AI decisions receive notification (Section 6)
- Disclosure includes AI purpose, scope, validation, and limitations (Section 4.2)

### 9.3 Academic Publishing Standards

Many journals and conferences require AI disclosure:

Common Requirements:

- Disclose AI use in methods section
- Identify specific tools used
- Explain validation process
- Declare no conflicts of interest related to AI vendors

RadioAstronomy.io Approach:

- Exceeds minimum disclosure requirements
- Proactively discloses even when not required
- Maintains consistency across publications
- Documents compliance for each publication

---

## 10. Roles and Responsibilities

### 10.1 CTO (Document Owner)

Responsibilities:

- Maintain this standard and approve updates
- Review disclosure waivers and exceptions
- Oversee transparency compliance program
- Respond to policy-level stakeholder concerns
- Represent organizational transparency posture externally

### 10.2 Security Lead

Responsibilities:

- Conduct quarterly transparency compliance reviews
- Advise personnel on disclosure requirements
- Monitor AI usage for disclosure compliance
- Track stakeholder questions and concerns
- Report compliance metrics to CTO

### 10.3 Content Creators (All Personnel)

Responsibilities:

- Disclose AI use per this standard's requirements
- Maintain project-level AI usage documentation
- Validate AI outputs before publication/release
- Respond to stakeholder questions about own work
- Escalate disclosure questions to Security Lead

### 10.4 System Owners

Responsibilities:

- Ensure AI systems have appropriate transparency documentation
- Update AI system inventory when systems change
- Coordinate disclosure for multi-stakeholder systems
- Document transparency considerations in system design

---

## 11. References

### Internal Documents

- POL-001: AI Governance Policy
- STD-001: AI Risk Assessment & Management Standard
- STD-003: Secure AI Systems Standard
- AUP-001: AI Acceptable Use Policy

### External Standards

- NIST AI Risk Management Framework (AI RMF 1.0)
- Colorado SB24-205 (Artificial Intelligence Act)
- Montreal Declaration for Responsible AI
- IEEE 7010-2020: Transparency of Autonomous Systems

### Academic Guidance

- ACM Conference on Fairness, Accountability, and Transparency (ACM FAccT)
- Partnership on AI: Guidelines for Responsible AI
- Academic journal AI disclosure policies (varies by journal)

---

## 12. Appendices

### Appendix A: Disclosure Templates

#### Template A1: Research Paper Methods Section

```markdown
## AI-Assisted Methodology

This research employed [AI Tool Name] for [specific purpose]. 

**AI Contribution:**
- [Specific task 1]: [Brief description and percentage if known]
- [Specific task 2]: [Brief description and percentage if known]

**Human Oversight:**
- [Validation method 1]: [Who validated and how]
- [Validation method 2]: [Who validated and how]

**Limitations:**
- [Known limitation 1]: [Mitigation approach]
- [Known limitation 2]: [Mitigation approach]

**Training Behavior:** [Tool trains/doesn't train on data]

All final conclusions and interpretations are the work of the human research team.
```

#### Template A2: Code Repository README

```markdown
# [Project Name]

## AI Disclosure

This project includes AI-assisted development:

- **Tool**: [AI tool name and version]
- **AI Contribution**: [~X% or description of AI-generated portions]
- **Human Contribution**: [What humans authored]
- **Review Process**: [How AI outputs were validated]
- **Training Behavior**: [Tool training disclosure]

AI-generated code sections are marked with inline comments:
\`\`\`
# AI-GENERATED: [Tool] (reviewed by [name])
\`\`\`

---

[Rest of README]
```

#### Template A3: Technical Documentation Header

```markdown
# [Document Title]

**AI Disclosure:** This document was created with assistance from [AI Tool]. Approximately [X%] AI-generated content. Technical accuracy validated by [role]. Training [behavior].

---

[Document content]
```

#### Template A4: Blog Post Footer

```markdown
---

*AI Disclosure: This post was written with assistance from [AI Tool]. The author provided the outline and key ideas; AI helped expand and refine the text. All content reviewed and approved by the author.*
```

#### Template A5: Presentation Slide (Final Slide)

```markdown
# Acknowledgments & Disclosures

This presentation was prepared with assistance from [AI Tool Name].

AI Contribution: Slide organization, graphics suggestions  
Human Contribution: Research, analysis, conclusions, final design  
Validation: Content reviewed by [role]

Questions? [contact info]
```

### Appendix B: Disclosure Decision Flowchart

```markdown
START: Did you use AI?

├─ NO → No disclosure required
│
└─ YES → Continue

├─ What was the AI contribution level?
│  ├─ Minimal (<10%: spell-check, grammar) → No disclosure required (optional to mention)
│  ├─ Moderate (10-40%: suggestions, assistance) → BASIC DISCLOSURE
│  ├─ Substantial (40-80%: significant generation) → DETAILED DISCLOSURE
│  └─ AI-Primary (>80%: mostly AI-generated) → COMPREHENSIVE DISCLOSURE
│
├─ Could limitations materially affect conclusions?
│  └─ YES → Increase disclosure level by one tier
│
├─ Is this high-stakes content (publication, funding, public-facing)?
│  └─ YES → Increase disclosure level by one tier
│
├─ Would stakeholders reasonably expect to know?
│  └─ YES → Ensure appropriate disclosure
│
└─ RESULT: Apply disclosure requirements per Section 4.1-4.3

SPECIAL CASES:

├─ Used Z.ai GLM-4.6?
│  └─ YES → MUST disclose training behavior (Section 4.2.4)
│
├─ Protected or sensitive data?
│  └─ YES → Disclose data classification tier (Public-Internal, Protected, etc.)
│
├─ External collaboration?
│  └─ YES → Align disclosures with partner (Section 4.4.1)
│
└─ Retrospectively discovered AI use?
   └─ YES → Follow retroactive disclosure process (Section 4.4.2)
```

### Appendix C: Common Disclosure Mistakes and Corrections

| Mistake | Why It's a Problem | Correction |
|---------|-------------------|------------|
| "AI helped with this" (vague) | Doesn't identify tool or scope | "Gemini 2.5 Pro generated initial draft; human author restructured and validated" |
| Disclosing after stakeholder inquiry | Reactive rather than proactive | Disclose at time of publication |
| Over-disclosure (AI spell-checked doc) | Creates disclosure fatigue | Reserve disclosure for material AI contributions (>10%) |
| Under-disclosure (AI wrote 50% of code, not disclosed) | Transparency violation | Disclose substantial AI contributions in README |
| "AI was used but outputs are validated" (defensive tone) | Sounds like justification | "AI assisted; validated by [expert]" (neutral, factual) |
| Tool name wrong (e.g., "ChatGPT" when used Gemini) | Factual error | Verify and correct tool identification |
| No mention of training behavior for Z.ai | Missing critical transparency element | Add: "Z.ai trains on submitted code; used for Public-External research code only (not infrastructure)" |
| Disclosure in obscure location | Hard for stakeholders to find | Place in standard location (methods, README, header) |

### Appendix D: Stakeholder Communication Examples

#### Example D1: Response to Academic Reviewer

```markdown
Dear Reviewer,

Thank you for your question regarding AI use in our manuscript [Title].

We used Google Gemini 2.5 Pro for initial literature review and pattern identification in our dataset. Specific contributions:

- Literature Review: AI identified 50+ potentially relevant papers based on keyword search. Human researchers reviewed all papers, validated relevance, and conducted detailed analysis. Final citation selection and interpretation performed by human researchers.

- Data Analysis: AI suggested statistical approaches for time-series analysis. All suggested methods were validated against standard references (Box & Jenkins, 2015). Statistical analysis independently verified using established packages (scipy.stats).

- Pattern Recognition: AI flagged candidate periodicities in observation data. All patterns validated against physical models and independently confirmed through traditional Fourier analysis.

All AI-assisted analysis underwent review by domain experts with radio astronomy specialization. We have updated the methods section to include this disclosure per reviewer recommendation.

Please let me know if you need any additional detail on our AI methodology.

Best regards,
[Author]
```

#### Example D2: Response to Funding Agency

```markdown
[Funding Agency]
[Grant Application ID]

AI Transparency Statement for Grant Application

This research proposal includes planned use of AI tools in accordance with our institutional AI Governance Policy and applicable federal guidelines.

Planned AI Use:

1. Data Processing: Local Llama 3.1 8B model for preprocessing of observational data
   - Rationale: Air-gapped local deployment protects proprietary instrument data
   - Validation: All preprocessing steps independently verified against standard pipelines

2. Literature Analysis: Gemini 2.5 Pro for initial literature review
   - Rationale: Accelerates identification of relevant prior work in large corpus
   - Validation: Human researchers review all citations; final synthesis performed by PI

3. Documentation: Claude Sonnet 4.5 for technical documentation generation
   - Rationale: Ensures consistent, comprehensive documentation
   - Validation: Technical accuracy verified by domain experts

Human Oversight:
All AI outputs will undergo rigorous validation by researchers with relevant expertise. Final scientific conclusions and interpretations will be the work of the human research team. AI serves to augment, not replace, human expertise.

Compliance:
Our AI use complies with [Funding Agency] guidelines for responsible AI use in research. Detailed methodology and disclosure will be included in resulting publications.

Please contact [PI] with any questions regarding our AI methodology.
```

#### Example D3: Open-Source Community Announcement

```markdown
# AI Transparency Announcement

Hello [Project Name] community,

We want to transparently share that upcoming contributions from RadioAstronomy.io team members will include AI-assisted code.

What This Means:
- Approximately 30-40% of our contribution code will be initially generated using Gemini 2.5 Pro
- All AI-generated code will be reviewed by our engineers before submission
- AI-generated sections will be marked with comments in the code
- We follow our organizational AI transparency policy: [link]

Why We're Using AI:
- Accelerates development of routine functionality
- Allows team to focus on complex algorithmic work
- Enables better documentation through AI-assisted drafting

What Doesn't Change:
- All contributions still undergo community peer review
- Code quality standards remain the same
- AI-generated code must pass all tests and linting
- Maintainer approval required as always

Your Feedback:
We're committed to transparent and responsible AI use. If you have questions or concerns about our AI-assisted contributions, please reach out to [maintainer].

Thanks,
[Team/Maintainer Name]
```

### Appendix E: Training Materials

#### Quick Reference Guide for Personnel

When in doubt about AI disclosure:

1. Did AI contribute meaningfully? (>10%) → Disclose it
2. Would a colleague want to know? → Disclose it
3. Is this going external? → Definitely disclose it
4. Used Z.ai? → MUST disclose training behavior
5. Still unsure? → Ask Security Lead (better to over-disclose than under-disclose)

Basic Disclosure Format:

```markdown
AI-Assisted Content:
- Tool: [name]
- Purpose: [what it did]
- Review: [who validated]
```

Where to disclose:

- Research: Methods section
- Code: README + code comments
- Docs: Header or footer
- Internal: Document metadata

Common Questions:

- "Do I disclose spell-check?" → No (unless >10% contribution)
- "Do I disclose code completion?" → Yes if substantial (see thresholds)
- "Do I name the specific model?" → Yes, be specific
- "Can I just say 'AI helped'?" → No, be specific about tool and purpose

Resources:

- Full Standard: STD-004
- Templates: Appendix A
- Questions: <security@radioastronomy.io>

### Appendix F: Change Log

| Version | Date | Section | Change Summary |
|---------|------|---------|----------------|
| 1.0 | 2025-01-15 | All | Initial standard creation based on NIST AI RMF and Colorado SB24-205 |
| 1.1 | 2025-10-26 | 4.2.1 | Updated tool examples: removed OpenAI/ChatGPT/GPT-4 references; added Z.ai/GLM-4.6, updated to match approved tool set (Gemini, Claude Max, Z.ai, local models) |
| 1.1 | 2025-10-26 | 4.2.4 | NEW SECTION: Added training behavior disclosure requirements (Z.ai trains on data, Gemini/Claude have training opt-out, local models air-gapped) |
| 1.1 | 2025-10-26 | 4.3 | Updated all disclosure format examples to use approved tools only |
| 1.1 | 2025-10-26 | 8.2 | Updated monitoring tool list: "Generative AI services (Gemini, Claude Max, Z.ai GLM-4.6, local models)" |
| 1.1 | 2025-10-26 | Throughout | Aligned data classification references with 4-tier system (Public-Internal, Public-External, Protected, Secrets) per STD-003 v1.1 |
| 1.1 | 2025-10-26 | Appendix A | Updated all templates to reflect approved tools and training behavior disclosure |

---

## Document Approval

Document Owner: CTO  
Effective Date: 2025-10-26

Acknowledgment Required: All personnel must acknowledge this standard within 30 days of effective date.

Acknowledgment Statement:
"I have read and understood the AI Transparency & Disclosure Standard v1.1. I agree to disclose AI involvement in my work per the requirements of this standard and will seek clarification from the Security Lead if I have questions about disclosure requirements."

---

End of Document
