# Appendix G: References & External Resources

Organization: RadioAstronomy.io  
Effective Date: 2025-10-24  
Version: 1.0  
Parent Document: AI Governance Policy

---

## Purpose

This appendix provides authoritative references for frameworks, standards, legal statutes, and community resources cited throughout RadioAstronomy.io's AI governance documentation. All URLs verified as of the effective date. Organizations should verify links remain current and consult the latest versions of cited materials.

---

## 1. Primary AI Governance Frameworks

### NIST AI Risk Management Framework (AI RMF)

Official Documentation:

- AI RMF 1.0 (PDF): <https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf>
- AI RMF Playbook: <https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook>
- AI RMF Resource Center: <https://airc.nist.gov/Home>

Description: Voluntary framework for managing risks associated with artificial intelligence systems. Organized around seven trustworthiness characteristics (Valid & Reliable, Safe, Secure & Resilient, Accountable & Transparent, Explainable & Interpretable, Privacy-Enhanced, Fair with Harmful Biases Managed) and four core functions (Govern, Map, Measure, Manage). Published January 2023 by the National Institute of Standards and Technology.

Why Referenced: Primary framework for RadioAstronomy.io AI governance program. Provides rebuttable presumption under Colorado SB-24-205. Voluntary nature allows flexible implementation while maintaining structured approach.

---

### ISO/IEC 42001:2023 - AI Management Systems

Official Documentation:

- ISO 42001 Standard (purchase): <https://www.iso.org/standard/81230.html>
- ISO AI Standards Overview: <https://www.iso.org/artificial-intelligence>

Description: International standard specifying requirements for establishing, implementing, maintaining, and continually improving an AI Management System (AIMS). Follows Plan-Do-Check-Act management system model. Certifiable standard suitable for formal audit and compliance demonstration.

Why Referenced: Provides operational structure for implementing NIST AI RMF principles. Crosswalked to NIST AI RMF in Appendix A. Organizations implementing ISO 42001 receive rebuttable presumption under Colorado SB-24-205.

---

## 2. Cybersecurity Frameworks and Controls

### CIS Controls v8.1

Official Documentation:

- CIS Controls v8.1: <https://www.cisecurity.org/controls/v8>
- Implementation Groups Guide: <https://www.cisecurity.org/controls/cis-controls-implementation-groups>
- CIS Controls Navigator: <https://www.cisecurity.org/controls/cis-controls-navigator>

Description: Prioritized set of 18 cybersecurity controls organized into three Implementation Groups (IG1, IG2, IG3) based on organizational size and risk tolerance. IG1 consists of 56 foundational safeguards applicable to all organizations. Developed and maintained by the Center for Internet Security (CIS) with community input.

Why Referenced: RadioAstronomy.io mandates all 56 IG1 safeguards as minimum security baseline. Robust cybersecurity is prerequisite for trustworthy AI systems. CIS Controls provide concrete, actionable technical safeguards that complement AI-specific governance.

---

### CIS Risk Assessment Method (CIS-RAM)

Official Documentation:

- CIS-RAM Overview: <https://www.cisecurity.org/insights/white-papers/cis-ram-risk-assessment-method>
- CIS-RAM Workbook: <https://www.cisecurity.org/controls/cis-ram>

Description: Structured risk assessment methodology published by CIS. Quantifies risk using Impact × Expectancy formula, evaluates safeguard effectiveness across four dimensions (implementation, operation, reliability, verification), produces residual risk calculations. Aligned with ISO 31000 risk management principles.

Why Referenced: RadioAstronomy.io uses CIS-RAM for IG1 as operational risk assessment process. Integrates with NIST AI RMF Map function and CIS Controls to create complete workflow from risk identification to control implementation.

---

### CIS Benchmarks

Official Documentation:

- CIS Benchmarks Library: <https://www.cisecurity.org/cis-benchmarks>
- Benchmark Download Portal: <https://www.cisecurity.org/cis-benchmarks/cis-benchmarks-download>

Description: Secure configuration guidelines for specific technologies, operating systems, databases, network devices, and cloud platforms. Developed through consensus-driven process with community review. Available for free download with CIS account.

Why Referenced: RadioAstronomy.io applies CIS Benchmarks as baseline hardening standards for infrastructure. Provides prescriptive technical guidance for implementing CIS Controls and securing AI system infrastructure.

---

### NIST Cybersecurity Framework (CSF)

Official Documentation:

- CSF 2.0: <https://www.nist.gov/cyberframework>
- CSF Implementation Resources: <https://www.nist.gov/cyberframework/getting-started>

Description: Voluntary framework for managing cybersecurity risk organized around six core functions: Identify, Protect, Detect, Respond, Recover, and Govern. Widely adopted across industries and integrated into many compliance programs.

Why Referenced: Complementary to NIST AI RMF. Organizations familiar with NIST CSF will recognize similar structure and approach in AI RMF. Both frameworks emphasize risk-based decision making and organizational governance.

---

## 3. Legal and Regulatory

### Colorado Artificial Intelligence Act (SB-24-205)

Official Documentation:

- Bill Text: <https://leg.colorado.gov/bills/sb24-205>
- Colorado General Assembly Bill Tracking: <https://leg.colorado.gov/>
- Attorney General Rulemaking: <https://coag.gov/> (check for AI-related rules)

Description: Colorado Senate Bill 24-205, also known as the Colorado Artificial Intelligence Act (CAIA). Effective February 1, 2026. Establishes duties of care for developers and deployers of high-risk AI systems, requires impact assessments, prohibits algorithmic discrimination, provides consumer rights (notification, explanation, appeal), and creates rebuttable presumption for framework-based risk management (NIST AI RMF or ISO 42001).

Key Definitions:

- High-risk AI system: Makes or substantially factors into consequential decisions
- Consequential decision: Legal, material, or similarly significant effects on access to education, employment, financial services, government services, healthcare, housing, insurance, legal services, or criminal justice
- Algorithmic discrimination: Unlawful differential treatment based on protected characteristics

Why Referenced: The only enforceable AI-specific law currently on U.S. books. Provides concrete compliance anchor for AI governance programs. Statutory definitions adopted throughout RadioAstronomy.io governance documentation.

---

### EU Artificial Intelligence Act

Official Documentation:

- EU AI Act (Official Journal): <https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R1689>
- EU AI Office: <https://digital-strategy.ec.europa.eu/en/policies/ai-office>

Description: Comprehensive AI regulation adopted by European Union in 2024. Risk-based approach with prohibited practices, high-risk systems requiring conformity assessment, transparency requirements, and governance obligations. Applies to organizations placing AI systems on EU market or whose outputs are used in EU.

Why Referenced: Reference point for international AI regulation. Not directly applicable to RadioAstronomy.io (U.S. organization, non-commercial research) but demonstrates global regulatory direction. Useful for organizations with international operations.

---

## 4. Standards Bodies and Organizations

### National Institute of Standards and Technology (NIST)

Website: <https://www.nist.gov/>  
AI Resources: <https://www.nist.gov/artificial-intelligence>

Description: U.S. federal agency within Department of Commerce. Develops technology standards, measurements, and testing. Houses U.S. AI Safety Institute (AISI, now transitioning to CAISI). Publisher of AI RMF, Cybersecurity Framework, and extensive technical documentation.

Key Resources:

- NIST Glossary: <https://csrc.nist.gov/glossary>
- AI Risk Management Framework Resources: <https://airc.nist.gov/>
- Cybersecurity Publications: <https://csrc.nist.gov/publications>

---

### Center for Internet Security (CIS)

Website: <https://www.cisecurity.org/>

Description: Nonprofit organization creating free cybersecurity resources and best practices. Best known for CIS Controls and CIS Benchmarks. Community-driven development process with broad industry participation.

Key Resources:

- CIS Controls: <https://www.cisecurity.org/controls>
- CIS Benchmarks: <https://www.cisecurity.org/cis-benchmarks>
- CIS RAM: <https://www.cisecurity.org/controls/cis-ram>
- CIS Community Defense Model: <https://www.cisecurity.org/insights/blog/cis-community-defense-model>

---

### International Organization for Standardization (ISO) / International Electrotechnical Commission (IEC)

Website: <https://www.iso.org/> and <https://www.iec.ch/>

Description: Global standards bodies developing international standards across all industries. ISO/IEC Joint Technical Committee 1 (JTC 1) Subcommittee 42 (SC 42) focuses on artificial intelligence standards.

Key AI Standards:

- ISO/IEC 42001:2023 - AI Management Systems
- ISO/IEC 23894:2023 - AI Risk Management
- ISO/IEC 22989:2022 - AI Concepts and Terminology
- ISO/IEC TR 24028:2020 - Trustworthiness of AI Systems

Cybersecurity Standards:

- ISO/IEC 27001:2022 - Information Security Management
- ISO/IEC 27002:2022 - Information Security Controls
- ISO/IEC 27017:2015 - Cloud Security
- ISO/IEC 27701:2019 - Privacy Information Management

---

### AI Standards and Innovation (CAISI)

Website: (In transition, check <https://www.nist.gov/artificial-intelligence> for updates)

Description: Federal organization replacing the Biden-era U.S. AI Safety Institute (AISI). Focused on advancing U.S. AI infrastructure and innovation while delegating regulatory authority to states. Policy direction emphasizes deregulation at federal level with state-level implementation.

Why Referenced: Successor to AISI, reflects current U.S. AI policy direction. Organizations should monitor CAISI guidance for evolving federal perspective on AI safety and standards.

---

## 5. Risk Management Standards

### ISO 31000:2018 - Risk Management Guidelines

Official Documentation:

- ISO 31000 Standard (purchase): <https://www.iso.org/standard/65694.html>
- ISO 31000 Resources: <https://www.iso.org/iso-31000-risk-management.html>

Description: International standard providing principles and guidelines for effective risk management. Not specific to AI or cybersecurity - applies across all organizational contexts. Emphasizes integration with organizational governance, structured approach, and continuous improvement.

Why Referenced: CIS-RAM methodology aligns with ISO 31000 principles. Provides credibility and international recognition for risk assessment approach. Ensures AI risk management integrates with broader organizational risk practices.

---

## 6. Data Protection and Privacy

### Microsoft Purview (Data Loss Prevention)

Official Documentation:

- Purview Overview: <https://www.microsoft.com/en-us/security/business/microsoft-purview>
- DLP Documentation: <https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp>

Description: Microsoft's data governance and compliance platform. Provides data loss prevention (DLP), information protection, insider risk management, and compliance management capabilities. Integrated with Microsoft 365 ecosystem.

Why Referenced: RadioAstronomy.io uses Purview DLP policies to enforce data classification boundaries and prevent unauthorized data exfiltration. Complements infrastructure-level controls with application-aware protection.

---

## 7. AI Governance Communities and Resources

### NIST AI Risk Management Framework Community

Resources:

- AI RMF Profiles Repository: <https://github.com/usnistgov/NIST-AI-RMF-Profiles>
- NIST AI RMF Crosswalks: <https://airc.nist.gov/AI_RMF_Knowledge_Base/Crosswalks>

Description: Community-contributed AI RMF implementation resources including industry-specific profiles, crosswalks to other frameworks, and case studies. NIST hosts repository and community discussions.

---

### AI Governance Research and Best Practices

Organizations:

- Partnership on AI: <https://partnershiponai.org/>
- AI Now Institute: <https://ainowinstitute.org/>
- Future of Life Institute: <https://futureoflife.org/>
- Montreal AI Ethics Institute: <https://montrealethics.ai/>

Description: Research organizations, think tanks, and nonprofits focused on AI ethics, governance, and policy. Publish research, frameworks, and practical guidance for responsible AI development and deployment.

---

### Open Source AI Governance Projects

GitHub Repositories:

- RadioAstronomy.io AI Governance: <https://github.com/radioastronomy-io/ai-governance>
- AI Incident Database: <https://incidentdatabase.ai/>
- Model Cards Toolkit: <https://github.com/tensorflow/model-card-toolkit>

Description: Open source implementations, tools, and resources for AI governance. RadioAstronomy.io maintains public repository as reference implementation for SMB/SME organizations.

---

## 8. Technical Documentation

### Authentication and Identity

FIDO Alliance:

- Website: <https://fidoalliance.org/>
- FIDO2 Specifications: <https://fidoalliance.org/fido2/>

Description: Industry consortium developing open authentication standards including FIDO2/WebAuthn for phishing-resistant multi-factor authentication.

---

### Zero Trust Architecture

NIST Special Publication 800-207:

- Zero Trust Architecture: <https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf>

Description: NIST guidance on zero trust security architecture principles and implementation approaches. Emphasizes "never trust, always verify" with continuous authentication and authorization.

---

### Cloud Security

Cloud Security Alliance (CSA):

- Website: <https://cloudsecurityalliance.org/>
- Security Guidance: <https://cloudsecurityalliance.org/research/guidance/>

Description: Nonprofit organization promoting best practices for cloud computing security. Publishes Security Guidance, Cloud Controls Matrix, and certification programs.

---

## 9. Training and Certification

### AI and ML Education

Courses and Certifications:

- Google AI Ethics: <https://ai.google/education/>
- Microsoft AI Fundamentals: <https://learn.microsoft.com/en-us/training/paths/get-started-with-artificial-intelligence-on-azure/>
- Fast.ai Practical Deep Learning: <https://course.fast.ai/>

Professional Certifications:

- Certified Information Systems Security Professional (CISSP): <https://www.isc2.org/certifications/cissp>
- Certified in Risk and Information Systems Control (CRISC): <https://www.isaca.org/credentialing/crisc>
- Certificate of Cloud Security Knowledge (CCSK): <https://cloudsecurityalliance.org/education/ccsk/>

---

### CIS Resources

CIS SecureSuite Membership:

- Overview: <https://www.cisecurity.org/cis-securesuite>
- Provides access to CIS-CAT assessment tools, vulnerability scanning, and implementation guidance

CIS WorkBench Community:

- Platform: <https://workbench.cisecurity.org/>
- Community forums, benchmark development participation, and implementation support

---

## 10. Industry Publications and Blogs

AI Governance and Ethics:

- MIT Technology Review AI Section: <https://www.technologyreview.com/artificial-intelligence/>
- IEEE Spectrum AI: <https://spectrum.ieee.org/topic/artificial-intelligence/>
- VentureBeat AI: <https://venturebeat.com/ai/>

Cybersecurity:

- SANS Reading Room: <https://www.sans.org/white-papers/>
- Krebs on Security: <https://krebsonsecurity.com/>
- Dark Reading: <https://www.darkreading.com/>

Compliance and Risk:

- ISACA Journal: <https://www.isaca.org/resources/isaca-journal>
- CSO Online: <https://www.csoonline.com/>

---

## 11. Legal and Policy Analysis

AI Law and Regulation:

- Stanford HAI Policy Resources: <https://hai.stanford.edu/policy>
- Brookings AI Governance: <https://www.brookings.edu/topic/artificial-intelligence/>
- Future of Privacy Forum: <https://fpf.org/>

Colorado AI Act Analysis:

- Colorado Attorney General: <https://coag.gov/>
- National Law Review - AI Section: <https://www.natlawreview.com/type/article/artificial-intelligence>

---

## Related Documents

Core Governance Framework:

- AI Governance Policy
- AI Risk Assessment & Management Standard
- Secure AI Systems Standard
- AI Transparency & Disclosure Standard

Supplementary Appendices:

- Appendix A: AI Governance Framework Crosswalk
- Appendix B: Glossary & Definitions
- Appendix D: Review Board Charter
- Appendix E: Change History & Version Control

---

Document Control:

- Source: <https://github.com/radioastronomy-io/ai-governance/appendices/appendix-g-references-resources.md>
- Contact: <ops@radioastronomy.io>
- Next Review: 2026-01-26
- Version History: See GitHub repository changelog

Maintenance Note:

External URLs may change over time. RadioAstronomy.io reviews and updates this appendix during quarterly governance reviews. If you discover broken links or outdated resources, please submit an issue or pull request at the GitHub repository.

Template Availability:

This operational reference list reflects RadioAstronomy.io's specific framework choices (NIST AI RMF, CIS Controls, Colorado compliance). Organizations may have different primary frameworks or legal requirements. The template version in `/templates` includes placeholder guidance for selecting appropriate references based on jurisdiction and chosen frameworks.
