# Appendix: AI Governance Framework Crosswalk

## Purpose

This appendix provides a detailed cross-reference mapping between four foundational AI governance frameworks:

- NIST AI Risk Management Framework (AI RMF) - Voluntary risk management framework
- ISO/IEC 42001 - Auditable AI management system standard  
- CIS Controls v8.1 - Foundational cybersecurity safeguards
- Colorado Senate Bill 24-205 (SB-24-205) - Enforceable AI regulation (effective February 1, 2026)

The crosswalk demonstrates how these frameworks converge on common principles and can be implemented as a unified governance program rather than four separate compliance efforts.

## Disclaimer

This crosswalk represents extensive research and has been validated through human-in-the-loop review processes. However, the authors are not credentialed security professionals, legal counsel, or certified auditors. This document is provided as an educational resource and operational reference for organizations building AI governance programs.

The AI governance landscape is rapidly evolving. Colorado SB-24-205 regulations are subject to ongoing interpretation and potential amendment. Framework standards including NIST AI RMF and ISO 42001 continue to mature through implementation feedback and future revisions. CIS Controls undergo periodic updates reflecting emerging threat landscapes.

This appendix does not constitute legal advice, compliance certification, or security consulting. Organizations should:

- Consult qualified legal counsel for Colorado SB-24-205 compliance strategies
- Engage certified auditors for ISO 42001 implementation and assessment
- Work with security professionals for CIS Controls deployment
- Validate all crosswalk mappings against current framework versions

Use this crosswalk as a starting point for integrated governance planning, not as a definitive compliance blueprint. Your organization's specific risk profile, operational context, and regulatory obligations may require adaptations to these mappings.

## How to Use This Crosswalk

Each section is organized around the seven NIST AI RMF trustworthiness characteristics. For each characteristic, you'll find:

- Analysis: What the characteristic means in operational terms
- Mapping Tables: Specific controls, requirements, and safeguards from each framework
- Implementation Notes: How the frameworks reinforce or depend on each other

This crosswalk is designed for:

- Policy developers building integrated AI governance programs
- Compliance teams mapping regulatory requirements to existing controls
- Risk managers identifying control gaps across frameworks
- Auditors validating multi-framework compliance approaches

## Framework Quick Reference

### NIST AI Risk Management Framework

Type: Voluntary guidance  
Focus: Principles-based risk management culture  
Core Structure:

- 7 Trustworthiness Characteristics (Valid & Reliable, Safe, Secure & Resilient, Accountable & Transparent, Explainable & Interpretable, Privacy-Enhanced, Fair)
- 4 Core Functions (Govern, Map, Measure, Manage)

### ISO/IEC 42001

Type: Certifiable international standard  
Focus: AI Management System (AIMS) implementation  
Core Structure: Plan-Do-Check-Act management system with 10 clauses covering policy, planning, operation, evaluation, and improvement

### CIS Controls v8.1

Type: Prioritized cybersecurity safeguards  
Focus: Foundational security hygiene  
Core Structure: 18 Controls covering asset management, data protection, access control, vulnerability management, and incident response

### Colorado SB-24-205

Type: Enforceable state regulation  
Focus: Preventing algorithmic discrimination in high-risk AI systems  
Core Structure:

- Duties of care for developers and deployers
- Impact assessment requirements
- Consumer rights (notification, explanation, correction, appeal)
- Rebuttable presumption for framework-based risk management

Key Legal Provision: Organizations implementing risk management programs based on NIST AI RMF or ISO 42001 receive a rebuttable presumption of reasonable care under the statute.

---

## Crosswalk Mappings

### 1. Valid and Reliable Systems

What This Means: AI systems must perform accurately and consistently within their specified operational domain. Validity refers to correctness and fitness-for-purpose. Reliability refers to consistent performance over time without failure.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Valid and Reliable trustworthiness characteristic; Map and Measure functions for performance evaluation | Core characteristic |
| ISO 42001 | Regular review of AI system performance against expected outcomes<br>Continuous validation of behavior post-deployment<br>Formal testing, validation, and verification procedures | Clause 8.4<br>Clause 8.10<br>Clause 10.9 |
| Colorado SB-24-205 | Developer: Document how system was evaluated for performance and known limitations<br>Deployer: Impact assessment must include performance metrics and known limitations | § 6-1-1702(2)<br>§ 6-1-1703(3)(b)(V) |
| CIS Controls v8.1 | Continuous vulnerability management ensures underlying systems function reliably<br>Application software security prevents defects affecting system behavior | Control 7<br>Control 18 |

Implementation Note: CIS Controls provide the technical foundation ensuring the environment itself is reliable. ISO 42001 operationalizes NIST principles into measurable validation processes. Colorado law makes these evaluations legally discoverable documentation requirements.

---

### 2. Safe Systems

What This Means: AI systems must prevent harm to human life, health, property, and environment. Safety involves anticipating negative real-world consequences, graceful failure modes, and appropriate human oversight mechanisms.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Safe trustworthiness characteristic; Manage function for risk mitigation | Core characteristic |
| ISO 42001 | Implement safeguards for unintended consequences from model outputs<br>Integrate human oversight and intervention capabilities<br>Create mitigation plans for foreseeable high-impact or safety-related failures | Clause 8.3<br>Clause 8.12<br>Clause 8.13 |
| Colorado SB-24-205 | Developer: Disclose known harmful or inappropriate uses of system<br>Deployer: Duty of care to protect consumers from known or reasonably foreseeable risks | § 6-1-1702(2)(a)<br>§ 6-1-1703(1) |
| CIS Controls v8.1 | Access control management prevents unauthorized system modifications<br>Secure configuration reduces attack surface that could compromise safety | Control 6<br>Control 4 |

Implementation Note: Safety cannot be achieved without security. An attacker who compromises system configuration can override safety controls, making CIS Controls prerequisites for safety claims.

---

### 3. Secure and Resilient Systems

What This Means: AI systems must protect confidentiality, integrity, and availability of data, models, and infrastructure. Resilience is the ability to withstand and recover from adverse events, including AI-specific threats like data poisoning, model evasion, and adversarial examples.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Secure and Resilient trustworthiness characteristic | Core characteristic |
| ISO 42001 | Address AI-specific cybersecurity risks through threat modeling and vulnerability assessments<br>Restrict access to sensitive models and datasets based on need<br>Develop incident response plans for AI-driven disruptions or misuse<br>Manage third-party AI risks | Clause 13.1<br>Clause 13.1<br>Clause 13.2<br>Clause 10.10 |
| Colorado SB-24-205 | Implicit in "duty of care" - failure to secure systems against reasonably foreseeable attacks that cause algorithmic discrimination constitutes breach | § 6-1-1702(1)<br>§ 6-1-1703(1) |
| CIS Controls v8.1 | Data protection for training and operational data<br>Secure configuration of AI infrastructure<br>Continuous vulnerability management<br>Malware defenses<br>Network infrastructure hardening<br>Incident response management | Control 3<br>Control 4<br>Control 7<br>Control 10<br>Control 12<br>Control 17 |

Implementation Note: This is where CIS Controls map most comprehensively. The majority of the 18 CIS Controls directly support security and resilience. A robust implementation of CIS Controls is the technical foundation for any security claims in ISO 42001 or Colorado compliance documentation.

---

### 4. Accountable and Transparent Systems

What This Means: Clear lines of authority and responsibility must exist for AI systems and their outcomes (accountability). Sufficient information about the system must be available to enable understanding and oversight (transparency). Together they answer: "Who is responsible?" and "What happened?"

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Accountable and Transparent trustworthiness characteristic; Govern function establishes accountability structures | Core characteristic |
| ISO 42001 | Clearly assign roles and responsibilities<br>Establish and maintain documented information for AIMS<br>Maintain traceability for AI decision-making processes<br>Maintain records of testing, validation, and auditing | Clause 5.3<br>Clause 7.5<br>Clause 8.5<br>Clause 11.9 |
| Colorado SB-24-205 | Developer: Provide extensive documentation to deployers<br>Deployer: Conduct and maintain impact assessments<br>Deployer: Provide consumer notifications before consequential decisions<br>Deployer: Provide explanations for adverse outcomes<br>Both: Publish public website statements on high-risk AI use and risk management practices | § 6-1-1702<br>§ 6-1-1703(3)<br>§ 6-1-1703(4)(a)<br>§ 6-1-1703(4)(b)<br>§ 6-1-1702(4)<br>§ 6-1-1703(5) |
| CIS Controls v8.1 | Audit log management - collect, review, and retain audit logs<br>Ensure log integrity and retention for forensic analysis | Control 8<br>Safeguards 8.02, 8.09, 8.10 |

Implementation Note: Without robust audit logging (CIS Control 8), accountability claims are unverifiable. Logs provide the raw, immutable data necessary to reconstruct events, investigate incidents, and demonstrate compliance. ISO 42001 and Colorado requirements assume log integrity that only proper CIS implementation can provide.

---

### 5. Explainable and Interpretable Systems

What This Means: Explainability provides insight into internal mechanisms—how the AI reached a decision. Interpretability provides human-understandable meaning for outputs in specific contexts—why the decision is relevant. The goal is making AI-driven decisions comprehensible to humans who must oversee, use, or be subject to them.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Explainable and Interpretable trustworthiness characteristic | Core characteristic |
| ISO 42001 | Define explainability and interpretability standards for AI models, particularly for high-risk use cases<br>Establish framework for transparency in AI system decisions, including ability to explain results to non-technical stakeholders | Clause 8.10<br>Clause 11.1 |
| Colorado SB-24-205 | Deployer: Provide consumer with "statement disclosing the principal reason or reasons for the consequential decision" following adverse outcomes | § 6-1-1703(4)(b)(I) |
| CIS Controls v8.1 | Audit log management ensures integrity of data underpinning any explanation - logs verify that explanations match actual system inputs and outputs | Control 8 |

Implementation Note: CIS Control 8 doesn't mandate model explainability but ensures that any explanation provided can be trusted. Audit logs provide an independent record of what data entered the system and what decision was produced, preventing post-hoc rationalization.

---

### 6. Privacy-Enhanced Systems

What This Means: AI systems must safeguard human autonomy, identity, and dignity by protecting personal data throughout the AI lifecycle. This involves data minimization, purpose limitation, consent management, and privacy-enhancing technologies. Privacy-enhanced systems are designed from the outset to respect personal information.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Privacy-Enhanced trustworthiness characteristic | Core characteristic |
| ISO 42001 | Explicitly embed privacy principles in AI policies or charters<br>Document data sources, consent, and provenance<br>Establish data retention and deletion policy<br>Implement data lifecycle management | Clause 12.1<br>Clause 8.9<br>Clause 8.9<br>Clause 8.9 |
| Colorado SB-24-205 | Definition of algorithmic discrimination includes sensitive personal data types (genetic information, reproductive health)<br>Consumer right to correct incorrect personal data used in consequential decisions | § 6-1-1701(1)<br>§ 6-1-1703(4)(b)(II) |
| CIS Controls v8.1 | Establish and maintain data management process<br>Establish and maintain data inventory<br>Configure data access control lists<br>Securely dispose of data<br>Encrypt sensitive data at rest<br>Encrypt sensitive data in transit | Control 3<br>Safeguard 3.01<br>Safeguard 3.02<br>Safeguard 3.03<br>Safeguard 3.05<br>Safeguard 3.11<br>Safeguard 3.10 |

Implementation Note: CIS Control 3 provides the tactical implementation checklist for privacy engineering. Without data inventory (3.02), organizations cannot demonstrate compliance with data minimization. Without encryption (3.10, 3.11) and access controls (3.03), privacy claims are unsupportable.

---

### 7. Fair Systems – with Harmful Bias Managed

What This Means: AI systems must manage harmful bias and prevent unlawful discrimination. Fairness is operationalized as the active identification, measurement, and mitigation of "algorithmic discrimination" as defined by Colorado SB-24-205. This is the most legally significant characteristic, as it forms the central focus of the Colorado statute.

#### Framework Mappings

| Framework | Specific Requirements | Reference |
|-----------|----------------------|-----------|
| NIST AI RMF | Fair – with Harmful Bias Managed trustworthiness characteristic; Map function identifies bias risks in context | Core characteristic |
| ISO 42001 | Assess and mitigate potential biases in datasets used to train AI systems<br>Establish mechanisms to reduce discriminatory or unfair outcomes in automated decision-making processes | Clause 8.9<br>Clause 11.4 |
| Colorado SB-24-205 | Core "duty of care" explicitly defined as duty to protect consumers from "algorithmic discrimination"<br>Impact assessment must analyze risks of algorithmic discrimination<br>Consumer rights to appeal adverse decisions | § 6-1-1702(1)<br>§ 6-1-1703(1)<br>§ 6-1-1703(3)<br>§ 6-1-1703(4)(b)(III) |
| CIS Controls v8.1 | Data protection ensures integrity of training data for fairness testing<br>Audit log management provides auditable trail of data access during bias assessments | Safeguard 3.03<br>Safeguard 8.02 |

Implementation Note: Fairness assessments depend on data integrity. CIS Control 3 (access control lists) ensures training data cannot be tampered with after curation for fairness testing. CIS Control 8 (audit logs) provides immutable records proving assessments were conducted on correct, untainted datasets. Without these controls, fairness claims lack verifiable evidence.

---

## Cross-Framework Dependencies

The frameworks are not independent—they build upon each other in specific ways:

### CIS Controls as Prerequisite Foundation

- Cannot achieve Fairness without data integrity (CIS Control 3)
- Cannot achieve Accountability without audit logging (CIS Control 8)  
- Cannot achieve Security without vulnerability management (CIS Control 7)
- Cannot achieve Privacy without data protection (CIS Control 3)

Key Principle: Allocating resources for CIS Controls implementation is a direct investment in AI trustworthiness. These are not competing priorities—cybersecurity hygiene is the necessary condition for AI ethics.

### ISO 42001 as Operational Bridge

- Translates NIST AI RMF principles into auditable processes
- Generates documentation artifacts required by Colorado SB-24-205
- Provides structure for continuous improvement and management review
- Creates evidence base for demonstrating "reasonable care" under Colorado law

### Colorado SB-24-205 as Legal Mandate

- Transforms voluntary best practices into legal requirements
- Creates "rebuttable presumption" for framework-based risk management
- Establishes documentation as legally discoverable evidence
- Makes impact assessments mandatory rather than optional

### NIST AI RMF as Conceptual Foundation

- Provides common language across all frameworks
- Establishes trustworthiness characteristics as organizing principle
- Offers process model (Govern-Map-Measure-Manage) for lifecycle management
- Recognized by Colorado statute as basis for reasonable care

---

## The Unified AI System Dossier Concept

Documentation requirements across frameworks reveal significant overlap. Rather than creating duplicative artifacts for different audiences, organizations can create a Unified AI System Dossier for each high-risk system:

From Colorado SB-24-205: Model cards, dataset cards, purpose statements, performance metrics, limitation disclosures

From ISO 42001: Risk assessments, data governance documentation, validation results, mitigation plans, audit records

From NIST AI RMF: Context analyses (Map), measurement methodologies and results (Measure), risk treatment decisions (Manage)

From CIS Controls: Infrastructure security attestations, vulnerability scan reports, audit log configurations, data protection evidence

This unified dossier becomes a single source of truth that:

- Satisfies regulatory disclosure requests (Colorado Attorney General)
- Provides evidence for ISO 42001 audits
- Documents internal governance decisions
- Enables public transparency statements
- Demonstrates "reasonable care" under Colorado law

---

## Using This Crosswalk for Implementation

For Policy Development: Use the mappings to build integrated requirements that satisfy all four frameworks simultaneously rather than creating separate compliance programs.

For Gap Analysis: Identify where existing controls satisfy multiple framework requirements versus where new controls are needed.

For Audit Preparation: Cross-reference your control implementations to demonstrate multi-framework compliance with single evidence sets.

For Legal Defense: Use the Colorado SB-24-205 rebuttable presumption by documenting how your risk management program implements NIST AI RMF via ISO 42001 processes, backed by CIS Controls foundation.

For Resource Allocation: Prioritize investments that provide cross-framework value—particularly CIS Controls implementation which enables all higher-level trustworthiness claims.

---

## Document Information

Version: 1.0  
Effective Date: 2025-10-25  
Last Review: 2025-10-25  
Next Review: 2026-01-25

Frameworks Referenced:

- NIST AI Risk Management Framework 1.0 (January 2023)
- ISO/IEC 42001:2023 - Information technology — Artificial intelligence — Management system
- CIS Controls v8.1 (May 2023)
- Colorado Senate Bill 24-205 (Signed May 17, 2024; Effective February 1, 2026)

Maintenance: This appendix should be reviewed quarterly as frameworks evolve and additional regulatory guidance is published.
