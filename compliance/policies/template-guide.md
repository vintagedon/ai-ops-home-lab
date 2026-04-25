# AI Model Registry

[GUIDANCE: This registry is your operational source of truth for approved AI models. It should connect your Role-Based AI Stack (who uses what) to your framework compliance mappings (why this is safe).]

## Purpose

[GUIDANCE: Explain what this registry DOES operationally—not just what it documents. How do people use it day-to-day?]

**Framework Alignment:** All approved models have been assessed against:
- [Your chosen frameworks - minimum 2-3 for crosswalk validation]

[GUIDANCE: List the frameworks you're using for governance. At minimum include one risk framework (NIST AI RMF, ISO 42001) and one technical control baseline (CIS, NIST CSF). Add regulatory requirements if applicable.]

## Approved Models (Active Use)

[GUIDANCE: This section contains models that have passed your validation process. Each entry should answer: WHO uses it, WHAT FOR, with WHAT data, and HOW does it satisfy your governance requirements.]

### [Model Name]

**Model Identifier:** [vendor-model-version]
**Role:** [Organizational role description]
**Access Method:** [How users access - API, web interface, CLI, etc.]

**Use Cases:**
- [Specific operational use case 1]
- [Specific operational use case 2]

[GUIDANCE: Use cases should be specific enough to guide decisions but broad enough to avoid constant updates. Focus on data patterns and consequence levels.]

**Data Classification Boundary:** [Highest sensitivity level allowed]

[GUIDANCE: Explicitly state what data CAN'T be used with this model. This is your enforcement boundary.]

**Governance Alignment:**
- **[Framework 1]:** [How this model's deployment satisfies framework requirements]
- **[Framework 2]:** [Technical controls or principles this model implements]

[GUIDANCE: Connect deployment patterns to control satisfaction. Don't just reference frameworks—explain the operational link.]

[Continue pattern for each approved model...]

## Pending Review

[GUIDANCE: Models accessible but not yet validated. This section prevents shadow AI while maintaining agility.]

## Decision Tree

[GUIDANCE: Provide a simple decision framework that maps user context to approved model. Should be answerable without deep technical knowledge.]

**Question 1: [Classification/Sensitivity dimension]**
**Question 2: [Use case/automation dimension]**
**Question 3: [Consequence/visibility dimension]**

## Validation Methodology

[GUIDANCE: Reference your validation process. If using multi-framework crosswalk, describe how you prevent hallucination and ensure logical mappings.]