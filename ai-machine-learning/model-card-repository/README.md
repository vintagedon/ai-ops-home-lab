<!--
---
title: "Model Cards - AI System Documentation Library"
description: "Comprehensive library of 130+ AI model cards documenting capabilities, risks, and controls across major vendors"
owner: "VintageDon - https://github.com/vintagedon"
orcid: "https://orcid.org/0009-0008-7695-4093"
ai_contributor: "Claude (Anthropic)"
lastReviewed: "2025-10-26"
version: "1.0"
status: "Published"
tags:
- type: directory-guide
- domain: model-documentation
- framework: nist-ai-rmf
- artifact-type: model-cards
related_documents:
- "[NIST AI RMF Cookbook](../README.md)"
- "[Policy Templates](../policy-templates/README.md)"
- "[Risk Scenarios](../risk-scenarios/README.md)"
type: directory-guide
---
-->

---

# 🎴 Model Cards

Comprehensive library documenting AI systems across major vendors with structured metadata, capability assessments, risk profiles, and control mappings aligned to NIST AI RMF and multiple compliance frameworks.

---

## 📖 1. Overview

### What This Directory Contains

This directory houses 130+ model cards in YAML format, providing standardized documentation for AI language models, multimodal systems, reasoning engines, and specialized AI capabilities from leading vendors. Each card serves as a single source of truth for model characteristics, deployment considerations, risk assessments, and compliance mappings.

### Purpose & Scope

Primary Purpose: Maintain a centralized, machine-readable knowledge base of AI model characteristics to support:

- Risk assessment and management decisions
- Vendor evaluation and model selection
- Compliance documentation and audits
- Model lifecycle tracking and governance
- Cross-framework control mapping

Scope Coverage:

- Vendors: Anthropic, Google, Meta, OpenAI, Mistral, Alibaba, Cohere, Microsoft, and 20+ additional providers
- Model Types: Large language models (LLMs), multimodal systems, reasoning models, vision models, audio/voice systems, specialized OCR/document processing
- Capabilities: Text generation, image understanding, code generation, mathematical reasoning, multilingual support, real-time processing
- Deployment Contexts: API services, open-weight models, edge deployments, enterprise-specific implementations

### Target Audience

Primary Users:

- AI governance teams performing risk assessments
- Security architects evaluating model deployments
- Compliance officers documenting AI systems
- Engineering teams selecting appropriate models
- Risk managers mapping controls to threats

Prerequisites:

- Understanding of AI model capabilities and limitations
- Familiarity with NIST AI RMF framework structure
- Knowledge of organizational risk tolerance and compliance requirements

---

## 📂 2. Files & Structure

### Directory Overview

```markdown
model-cards/
├── 📄 README.md                                           # This file
├── 📄 README-pending.md                                   # Pending work items
│
├── 🏢 Anthropic Models (12 cards)
│   ├── anthropic-claude-3-haiku-model-card.yaml
│   ├── anthropic-claude-3-opus-model-card.yaml
│   ├── anthropic-claude-3-sonnet-model-card.yaml
│   ├── anthropic-claude-4-opus-model-card.yaml
│   ├── anthropic-claude-41-haiku-model-card.yaml
│   ├── anthropic-claude-41-sonnet-model-card.yaml
│   ├── anthropic-claude-42-haiku-model-card.yaml
│   ├── anthropic-claude-42-opus-model-card.yaml
│   ├── anthropic-claude-42-sonnet-model-card.yaml
│   └── anthropic-claude-sonnet-45-model-card.yaml
│
├── 🏢 Google Models (18 cards)
│   ├── google-deepmind-gemma-2-9b-model-card.yaml
│   ├── google-gemini-10-nano-model-card.yaml
│   ├── google-gemini-10-pro-model-card.yaml
│   ├── google-gemini-10-ultra-model-card.yaml
│   ├── google-gemini-15-flash-model-card.yaml
│   ├── google-gemini-15-pro-model-card.yaml
│   ├── google-gemini-2-9b-open-weight-multilingual-model-2024-model-card.yaml
│   ├── google-gemini-25-flash-model-card.yaml
│   ├── google-gemini-25-pro-model-card.yaml
│   ├── google-gemma-2-27b-open-weight-reasoning-2025-model-card.yaml
│   └── google-vertex-ai-v1-model-card.yaml
│
├── 🏢 Meta Models (8 cards)
│   ├── meta-ai-galactica-120b-model-card.yaml
│   ├── meta-llama-3-70b-instruct-model-card.yaml
│   ├── meta-llama-3-8b-instruct-model-card.yaml
│   ├── meta-llama-31-405b-model-card.yaml
│   ├── meta-llama-31-70b-model-card.yaml
│   ├── meta-llama-31-8b-model-card.yaml
│   ├── meta-llama-4-maverick-17b-128e-instruct-model-card.yaml
│   └── meta-llama-4-scout-17b-16e.yaml
│
├── 🏢 OpenAI Models (10 cards)
│   ├── openai-gpt-35-turbo-final-instruct-release-model-card.yaml
│   ├── openai-gpt-4-turbo-2024-revision-model-card.yaml
│   ├── openai-gpt-4-turbo-model-card.yaml
│   ├── openai-gpt-4o-model-card.yaml
│   ├── openai-gpt-5-business-saas-model-card.yaml
│   ├── openai-gpt-5-model-card.yaml
│   ├── openai-gpt-oss-120b-model-card.yaml
│   ├── openai-gpt-oss-200b-model-card.yaml
│   ├── openai-o1-reasoning-model-2025-model-card.yaml
│   ├── openai-o3-mini-reasoning-model-card.yaml
│   └── openai-sora-v2-model-card.yaml
│
├── 🏢 Mistral AI Models (9 cards)
│   ├── mistral-7b-03-model-card.yaml
│   ├── mistral-large-2-model-card.yaml
│   ├── mistral-large-v2-closed-model-2025-model-card.yaml
│   ├── mistral-large-v2-model-card.yaml
│   ├── mistral-mixtral-8x22b-model-card.yaml
│   ├── mistral-nemo-model-card.yaml
│   ├── mistral-small-11-model-card.yaml
│   ├── mistral-small-2025-api-model-model-card.yaml
│   └── mixtral-8x7b-moe-model-card.yaml
│
├── 🏢 Alibaba/Qwen Models (7 cards)
│   ├── alibaba-qwen-2-72b-open-multilingual-2024-model-card.yaml
│   ├── alibaba-qwen-2-7b-lightweight-multilingual-2024-model-card.yaml
│   ├── alibaba-qwen-3-235b-a22b-model-card.yaml
│   ├── alibaba-qwen-3-30b-a3b-gguf-model-card.yaml
│   ├── alibaba-qwen-3-32b-model-card.yaml
│   ├── alibaba-qwen-3-vl-8b-instruct-model-card.yaml
│   └── qwen-2-72b-model-card.yaml
│
├── 🏢 Microsoft Models (5 cards)
│   ├── microsoft-phi-3-medium-14b-model-card.yaml
│   ├── microsoft-phi-3-mini-38b-model-card.yaml
│   ├── microsoft-phi-4-multimodal-instruct-model-card.yaml
│   ├── microsoft-phi-4-reasoning-model-card.yaml
│   └── microsoft-vibe-voice-model-card.yaml
│
├── 🏢 01.AI Models (25 cards - Yi Family)
│   ├── a1-yi-15-34b-model-card.yaml
│   ├── a1-yi-15-6b-model-card.yaml
│   ├── a1-yi-15-9b-model-card.yaml
│   ├── a1-yi-15-model-card.yaml
│   ├── a1-yi-edge-3b-model-card.yaml
│   ├── a1-yi-edge-6b-model-card.yaml
│   ├── a1-yi-edge-9b-model-card.yaml
│   ├── a1-yi-edge-vision-120b-model-card.yaml
│   ├── a1-yi-edge-vision-13b-model-card.yaml
│   ├── a1-yi-edge-vision-20b-model-card.yaml
│   ├── a1-yi-edge-vision-34b-model-card.yaml
│   ├── a1-yi-edge-vision-70b-model-card.yaml
│   ├── a1-yi-edge-vision-7b-model-card.yaml
│   ├── a1-yi-edge-vision-ultra-model-card.yaml
│   ├── a1-yi-large-34b-model-card.yaml
│   ├── a1-yi-large-model-card.yaml
│   ├── a1-yi-lightning-34b-model-card.yaml
│   ├── a1-yi-lightning-70b-model-card.yaml
│   ├── a1-yi-lightning-9b-model-card.yaml
│   ├── a1-yi-lightning-vision-13b-model-card.yaml
│   ├── a1-yi-lightning-vision-34b-model-card.yaml
│   ├── a1-yi-lightning-vision-70b-model-card.yaml
│   ├── a1-yi-vision-13b-model-card.yaml
│   └── a1-yi-vision-7b-model-card.yaml
│
└── 🏢 Additional Vendors (35+ cards)
    ├── allen-institute-for-ai-olmo-17b-model-card.yaml
    ├── allen-institute-for-ai-olmo-2-13b-model-card.yaml
    ├── allen-institute-for-ai-olmo-7b-model-card.yaml
    ├── allen-institute-for-ai-tulu-2-dpo-model-card.yaml
    ├── baichuan-2-13b-model-card.yaml
    ├── baichuan-2-53b-model-card.yaml
    ├── black-forest-labs-flux-1-dev-model-card.yaml
    ├── boson-ai-higgs-audio-v2-model-card.yaml
    ├── canopy-labs-orpheus-3b-01-ft-model-card.yaml
    ├── canopy-labs-orpheus-model-card.yaml
    ├── chat-glm-4-plus-model-card.yaml
    ├── cohere-command-r+-2025-edition-model-card.yaml
    ├── cohere-coral-enterprise-reasoning-model-2025-model-card.yaml
    ├── databricks-drbx-model-card.yaml
    ├── deep-seek-v2-model-card.yaml
    ├── deep-seek-v25-model-card.yaml
    ├── deepseek-r1-model-card.yaml
    ├── eleutherai-pythia-12b-model-card.yaml
    ├── falcon-180b-uae-tii-model-card.yaml
    ├── falcon-2-11b-tii-model-card.yaml
    ├── falcon-3-7b-instruct-model-card.yaml
    ├── falcon-40b-uae-tii-model-card.yaml
    ├── hexgrad-kokoro-v1-model-card.yaml
    ├── hugging-face-h4-zephyr-7b-beta-model-card.yaml
    ├── katanemo-arch-router-15b-model-card.yaml
    ├── kormo-team-kaist-kormo-10b-sft-model-card.yaml
    ├── krea-krea-realtime-video.yaml
    ├── minicpm-3-model-card.yaml
    ├── minicpm-llama-3-v-model-card.yaml
    ├── moonshot-ai-kimi-k2-instruct-0905-model-card.yaml
    ├── mpt-30b-model-card.yaml
    ├── mpt-7b-instruct-model-card.yaml
    ├── nanonets-nanonets-ocr2-3b-model-card.yaml
    ├── nari-labs-dia-model-card.yaml
    ├── neuphonic-neutts-air-model-card.yaml
    ├── nous-hermes-2-mixtral-8x7b-model-card.yaml
    ├── openhermes-model-card.yaml
    ├── paddlepaddle-paddleocr-vl-model-card.yaml
    ├── resemble-ai-chatterbox-model-cards.yaml
    ├── sesame-csm-1b-model-card.yaml
    ├── shanghai-ai-internlm-2-20b-model-card.yaml
    ├── shenzhen-yuanverse-ai-xverse-1380-model-card.yaml
    ├── stabilityai-stablelm-2-zephyr-model-card.yaml
    ├── tencent-hynyuan-world-mirror-model-card.yaml
    ├── xa1-grok2-model-card.yaml
    └── xai-grok-1-model-card.yaml
```

### Model Card Categories

Major Language Model Families:

- Anthropic Claude Series (12 cards) - Claude 3/4 family including Haiku (efficient), Sonnet (balanced), Opus (capable) variants across generations
- Google Gemini/Gemma (18 cards) - Multimodal Gemini Pro/Flash/Ultra models, open-weight Gemma reasoning models, Vertex AI platform
- Meta Llama (8 cards) - Llama 3/3.1/4 family from 8B to 405B parameters, including specialized Maverick/Scout variants
- OpenAI GPT Series (10 cards) - GPT-3.5 through GPT-5, o1/o3 reasoning models, Sora video generation, open-source GPT variants

Specialized & Enterprise Models:

- Mistral AI (9 cards) - Efficient 7B models through large 22B/70B variants, mixture-of-experts architectures
- Alibaba Qwen (7 cards) - Multilingual models optimized for Asian languages, lightweight to 235B parameter systems
- Microsoft Phi (5 cards) - Compact reasoning-focused models (3-4 series), multimodal capabilities, voice synthesis
- 01.AI Yi Family (25 cards) - Comprehensive edge-to-datacenter range (3B-120B), vision-enabled variants, lightning-fast inference models

Emerging & Specialized Systems:

- Audio/Voice Models - Boson AI Higgs, Microsoft Vibe Voice, Neuphonic NeuTTS, Resemble AI Chatterbox
- Vision & Multimodal - Black Forest Labs Flux, Krea Realtime Video, Tencent Hunyuan World Mirror
- Document Processing - Nanonets OCR2, PaddlePaddle OCR-VL
- Research & Open Models - Allen AI OLMo, DeepSeek, Databricks DBRX, EleutherAI Pythia, Stability AI StableLM
- Regional Leaders - Baichuan (China), Falcon (UAE), ChatGLM (Zhipu AI), InternLM (Shanghai AI Lab)

### File Naming Convention

Pattern: `{vendor}-{model-family}-{variant}-model-card.yaml`

Examples:

- `anthropic-claude-sonnet-45-model-card.yaml`
- `google-gemini-25-pro-model-card.yaml`
- `meta-llama-31-405b-model-card.yaml`
- `openai-o3-mini-reasoning-model-card.yaml`

### YAML Structure

Each model card follows a standardized schema including:

- Metadata: Vendor, model name, version, release date, status
- Capabilities: Core competencies, supported modalities, language coverage
- Technical Specs: Parameter count, context window, training data characteristics
- Risk Assessment: Identified risks with severity ratings and mitigation controls
- Compliance Mapping: NIST AI RMF functions, CIS Controls, ISO standards
- Deployment Context: API access, self-hosted options, enterprise support
- Limitations: Known weaknesses, unsupported use cases, ethical considerations

---

## 🎯 3. Framework Alignment

### NIST AI RMF Coverage

This model card library directly supports all five AI RMF functions:

| Function | Coverage | Library Contribution |
|----------|----------|---------------------|
| Govern | ✅ Primary | Provides model inventory foundation for governance processes, enables vendor risk comparison, supports model selection policies |
| Map | ✅ Primary | Documents AI system context, capabilities, and intended uses; maps stakeholder expectations and regulatory requirements |
| Measure | ✅ Primary | Establishes measurable characteristics (accuracy, bias metrics, performance benchmarks) for ongoing assessment |
| Manage | ✅ Primary | Risk profiles enable prioritized risk treatment, control mappings support risk response planning |
| Monitor | ⚠️ Partial | Baseline documentation supports change detection and performance monitoring over model lifecycle |

### Multi-Framework Compliance Support

ISO/IEC 42001 (AI Management System):

- Clause 6.1.2: AI system inventory and characteristics documentation
- Clause 7.4: Documentation requirements for AI systems
- Clause 8.2: Impact assessment inputs

NIST SP 800-53 (Security Controls):

- SA-15: Development Process, Standards, and Tools (model selection criteria)
- CM-8: System Component Inventory (AI model tracking)
- RA-3: Risk Assessment (vendor risk profiles)

EU AI Act Alignment:

- Article 11: Technical documentation requirements for high-risk AI
- Article 13: Transparency and information provision
- Annex IV: Technical documentation template compliance

Colorado SB24-205 (AI Deployment Requirements):

- Section 6-1-1703: High-risk AI system impact assessments
- Section 6-1-1704: Risk management policy documentation
- Model cards provide required system characterization for compliance

### Control Mappings

CIS Controls v8:

- Control 1.1: Establish and Maintain Detailed Enterprise Asset Inventory (AI models as assets)
- Control 2.1: Establish and Maintain a Software Inventory (model licensing and versions)
- Control 4.1: Establish and Maintain a Secure Configuration Process (model deployment standards)
- Control 16.1: Establish and Maintain a Secure Application Development Process (model selection criteria)

Risk Management Integration:

- Each model card includes risk ratings aligned with organizational risk appetite
- Control mappings link to policies in `../policies-proxmox-cluster/`
- Risk scenarios in `../risk-scenarios/` reference specific model risks

---

## 📚 4. Related Resources

### Within This Repository

Parent Directory:

- [📁 NIST AI RMF Cookbook](../README.md) - Main repository navigation and overview

Related Artifact Directories:

- [📁 Policy Templates](../policy-templates/README.md) - Governance templates that reference model card inventory
- [📁 Policies - Proxmox Cluster](../policies-proxmox-cluster/README.md) - Organization-specific policies dogfooding these model cards
- [📁 Risk Scenarios](../risk-scenarios/README.md) - Risk library with model-specific threat scenarios
- [📁 Standards](../standards/README.md) - Technical standards for model deployment and assessment

Model Card Templates:

- [📁 Model Card Templates](../model-cards-templates/README.md) - Blank templates for creating new model cards

Implementation Examples:

- [📁 Proxmox Cluster Model Cards](../policies-proxmox-cluster/model-cards/README.md) - Deployed model documentation showing template usage

### Using Model Cards

For Risk Assessment:

1. Review model card risk section for known vulnerabilities
2. Cross-reference with risk scenarios in `../risk-scenarios/`
3. Apply controls from `../policies-proxmox-cluster/standards/`
4. Document decisions in model registry

For Vendor Selection:

1. Compare capability requirements against model cards
2. Evaluate risk profiles and control requirements
3. Assess licensing, deployment options, and support
4. Reference compliance mappings for regulatory fit

For Governance:

1. Maintain model inventory using card metadata
2. Track model versions and updates
3. Monitor deprecated or high-risk models
4. Generate compliance reports from card data

### External Resources

NIST AI Resources:

- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) - Official framework documentation
- [NIST AI RMF Playbook](https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook) - Implementation guidance
- [Model Cards for Model Reporting](https://arxiv.org/abs/1810.03993) - Original model card research paper

Vendor Documentation:

- [Anthropic Model Documentation](https://docs.anthropic.com/en/docs/models-overview) - Claude model specifications
- [Google AI Model Garden](https://cloud.google.com/model-garden) - Gemini and Gemma documentation
- [Meta Llama Resources](https://llama.meta.com/) - Llama model information and access
- [OpenAI Model Documentation](https://platform.openai.com/docs/models) - GPT series specifications

Compliance Frameworks:

- [ISO/IEC 42001:2023](https://www.iso.org/standard/81230.html) - AI Management System standard
- [EU AI Act](https://artificialintelligenceact.eu/) - European AI regulation
- [NIST SP 800-53 Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) - Security control catalog

Model Evaluation Resources:

- [Hugging Face Model Hub](https://huggingface.co/models) - Open model repository with evaluation metrics
- [Stanford HELM](https://crfm.stanford.edu/helm/) - Holistic evaluation of language models
- [EleutherAI LM Evaluation Harness](https://github.com/EleutherAI/lm-evaluation-harness) - Standardized model testing

### Contributing

Adding New Model Cards:

1. Use template from `../model-cards-templates/`
2. Follow naming convention: `{vendor}-{model}-{version}-model-card.yaml`
3. Complete all required YAML fields
4. Map to NIST AI RMF functions and relevant compliance frameworks
5. Submit via pull request with completed checklist

Updating Existing Cards:

- Model version updates (new releases)
- Risk assessment revisions (new vulnerabilities discovered)
- Control mapping updates (new policies implemented)
- Compliance framework additions (new regulations)

Quality Standards:

- Complete metadata (no placeholder values)
- Accurate capability descriptions (verified against vendor docs)
- Risk ratings with justification (aligned with organizational risk appetite)
- Control mappings to existing policies/standards
- Framework alignments with specific clause/control references

### Community & Support

Questions about Model Cards:

- Open an issue: [GitHub Issues](https://github.com/vintagedon/nist-ai-rmf-cookbook/issues) with label `model-cards`
- Start a discussion: [GitHub Discussions](https://github.com/vintagedon/nist-ai-rmf-cookbook/discussions)

Report Problems:

- Tag issue with: `bug`, `model-cards`
- Include: Model card filename, issue description, expected vs. actual content

Suggest Improvements:

- Tag issue with: `enhancement`, `model-cards`
- Describe: New vendors/models to add, schema improvements, additional framework mappings

Request New Model Cards:

- Tag issue with: `model-card-request`
- Include: Vendor, model name, use case, why it's valuable to the library

---

## 📋 5. Documentation Metadata

### Authorship & Collaboration

Primary Author: VintageDon ([GitHub Profile](https://github.com/vintagedon))  
ORCID: [0009-0008-7695-4093](https://orcid.org/0009-0008-7695-4093)  
Methodology: See [Documentation Methodology](../docs/methodology.md) for development approach and AI collaboration details

### Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-10-26 | Initial model card library documentation with 130+ cards | VintageDon |

### Library Statistics

- Total Model Cards: 130+
- Vendors Covered: 25+
- Model Families: 40+ distinct product lines
- Parameter Range: 3B (edge models) to 405B (datacenter models)
- Modalities: Text, vision, audio, video, multimodal
- Deployment Types: API services, open-weight models, edge deployments, enterprise platforms

### Repository Information

Repository: [nist-ai-rmf-cookbook](https://github.com/vintagedon/nist-ai-rmf-cookbook)  
License: MIT  
Framework Version: NIST AI RMF 1.0 (January 2023)  
Status: Active - Updated as new models released

---

Document Version: 1.0 | Last Updated: 2025-10-26 | Status: Published | Directory: model-cards
