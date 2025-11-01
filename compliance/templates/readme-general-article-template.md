<!--
---
title: "[Article Title]"
description: "Brief, actionable description of what this article covers and its primary purpose"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "[Full AI Model Name/Version]"
date: "YYYY-MM-DD"
version: "X.Y"
status: "[Draft/In-Review/Published/Archived]"
tags:
- type: kb-article
- domain: [infrastructure/kubernetes/security/ai-ops/etc]
- tech: [rke2/postgresql/prometheus/ollama/etc]
- phase: [phase-0/phase-1/phase-2/phase-3/phase-4]
related_documents:
- "[Related Article 1](path/to/article.md)"
- "[Related Article 2](path/to/article.md)"
---
-->

# 📄 [Article Title]

This article provides [brief overview of what this article covers and accomplishes]. It serves as [primary function - reference guide/how-to/conceptual overview/etc] for [target users] working with [specific technology/process/concept].

# 🎯 1. Introduction

This section establishes the context and purpose for this article within the Proxmox Astronomy Lab knowledge base.

## 1.1 Purpose

This subsection clearly articulates what this article accomplishes and what value it delivers to readers.

[2-3 sentences explaining the article's purpose, the problem it addresses, and the value it provides. Focus on outcomes and what readers will learn or be able to do after reading.]

## 1.2 Scope

This subsection defines the precise boundaries of what this article covers and explicitly states what falls outside its coverage area.

| In Scope | Out of Scope |
|--------------|------------------|
| [Specific topics covered] | [Specific topics NOT covered] |
| [Additional in-scope items] | [Related topics covered elsewhere] |

[1-2 sentences explaining why this scope definition is important and where readers can find related information.]

## 1.3 Target Audience

This subsection identifies who should read this article and their expected background.

Primary Audience: [Primary readers and their roles]  
Required Background: [Expected technical skills and knowledge needed to understand this article]

# 📝 2. Article Content

This section contains the main content of the article. The structure and subsections depend on the article type and purpose.

## 2.1 [First Major Topic]

[Content for first major topic section]

## 2.2 [Second Major Topic]

[Content for second major topic section]

## 2.3 [Third Major Topic]

[Content for third major topic section]

## 2.4 [Additional Topics as Needed]

[Continue adding subsections as needed for article content]

# 🔗 3. Related Resources

This section provides connections to related articles, documentation, and external resources that complement or extend this article's content.

## 3.1 Internal Resources

| Resource Type | Title | Relationship | Link |
|-------------------|-----------|------------------|----------|
| [KB Article/SOP/Guide] | [Title] | [How it relates] | [Internal link] |
| [Another resource] | [Title] | [Relationship] | [Link] |

## 3.2 External Resources

- [External Resource Name](https://example.com) - [Brief description of relevance]
- [Another Resource](https://example.com) - [Why this is useful]

# 📜 4. Documentation Metadata

This section provides information about article creation, revision history, and authorship transparency.

## 4.1 Change Log

| Version | Date | Changes | Author | Pipeline | Review Status |
|------------|---------|-------------|------------|--------------|-------------------|
| X.Y | YYYY-MM-DD | [Description of changes] | [Author] | [Model + Method] | [Status] |

---

## 📋 General Article Template Usage Guidelines

### Purpose & Function

The general article template provides a lightweight content wrapper for knowledge base articles that don't require the full operational documentation structure. It focuses on delivering information efficiently without the overhead of operational procedures, compliance frameworks, or infrastructure baselines.

Use this template for:

- Conceptual overviews and explanations
- Reference guides and quick references
- Technology comparisons and analyses
- Best practices and recommendations
- Troubleshooting guides and FAQs
- Tutorial content and walkthroughs
- Architecture explanations (non-formal)

Don't use this template for:

- Standard Operating Procedures (use SOP template)
- Formal policies (use policy template)
- Directory organization (use interior README template)
- Infrastructure guides requiring RACI/compliance (use SOP template)

### Critical: Fixed Section Numbering

General articles use 4-section structure (Sections 1-4) with minimal framing:

- Section 1: Introduction (Purpose, Scope, Target Audience)
- Section 2: Article Content (flexible subsections based on content needs)
- Section 3: Related Resources (Internal and External)
- Section 4: Documentation Metadata (Change Log, Authorship, AI Operations Disclosure)

Section 2 is completely flexible - adapt subsection structure to content needs (2.1, 2.2, 2.3, etc.)

All general articles terminate at Section 4.3 - this is the standard termination point.

### Document Length Targets

- Standard Article: 300-600 lines depending on content depth
- Quick Reference: 150-300 lines for concise information
- Comprehensive Guide: 500-800 lines for thorough coverage
- Conceptual Overview: 200-400 lines for explanation-focused content

### Content Principles

- Focus on Content: Minimal framing, maximum information delivery
- Clear Structure: Logical flow appropriate to content type
- Actionable Information: Readers should gain practical knowledge or understanding
- Appropriate Depth: Match detail level to target audience needs
- Link Connections: Connect to related articles and resources

### Section-Specific Guidance

#### Section 1: Introduction

- Keep brief: Get to the content quickly
- 1.1 Purpose: What will readers learn or be able to do?
- 1.2 Scope: Use table format, be clear about boundaries
- 1.3 Target Audience: Specify roles and required background
- No Section 1.4 Overview: Unnecessary for article format
- No Section 1.5 Baseline: Not infrastructure documentation

#### Section 2: Article Content

- Completely flexible structure: Adapt to content needs
- Logical organization: Structure subsections for readability
- Use appropriate formatting: Code blocks, tables, lists as needed
- Clear headings: Descriptive subsection titles
- Examples when helpful: Concrete illustrations aid understanding

Common Section 2 patterns:

For How-To/Tutorial Articles:

- 2.1 Prerequisites
- 2.2 Step-by-Step Instructions
- 2.3 Verification
- 2.4 Troubleshooting

For Conceptual Articles:

- 2.1 Core Concepts
- 2.2 How It Works
- 2.3 Use Cases
- 2.4 Best Practices

For Reference Articles:

- 2.1 Overview
- 2.2 Command Reference
- 2.3 Configuration Options
- 2.4 Examples

For Comparison Articles:

- 2.1 Option A Overview
- 2.2 Option B Overview
- 2.3 Comparison Matrix
- 2.4 Recommendations

#### Section 3: Related Resources

- 3.1 Internal Resources: Table linking to related KB articles, SOPs, guides
- 3.2 External Resources: Bulleted list of external documentation, standards, references
- Be selective: Link what's actually useful, not everything tangentially related

#### Section 4: Documentation Metadata

- 4.1 Change Log: Include pipeline column for AI model/method tracking
- 4.2 Authorship Details: Standard RAVGV methodology disclosure
- 4.3 AI Operations Disclosure: Simplified language focused on article creation
- No approval matrix: Articles don't require formal approval
- No authorization section: Informal knowledge base content

### What's NOT in This Template

No operational overhead:

- ❌ No RACI matrices (not operational procedures)
- ❌ No Section 1.5 Baseline Infrastructure (not infrastructure documentation)
- ❌ No Dependencies & Relationships section (not formal documentation)
- ❌ No Security & Compliance section (not infrastructure/operational docs)
- ❌ No Backup & Recovery section (not applicable to articles)
- ❌ No Approval & Review section (informal content)

This keeps articles lightweight and focused on content delivery.

### Quality Indicators

- ✅ Article accomplishes stated purpose clearly
- ✅ Scope is well-defined and maintained throughout
- ✅ Content is organized logically for the article type
- ✅ Target audience can understand and use the information
- ✅ Related resources provide useful connections
- ✅ Length is appropriate for content depth
- ✅ Section numbering follows 1-4 structure
- ✅ Document terminates at Section 4.3

### Article Types and Section 2 Structure Examples

#### How-To Guide

```markdown
## 2.1 Prerequisites
[What's needed before starting]

## 2.2 Step-by-Step Instructions
[Detailed procedure]

## 2.3 Verification
[How to confirm success]

## 2.4 Troubleshooting
[Common issues and solutions]
```

#### Conceptual Overview

```markdown
## 2.1 Introduction to [Concept]
[Basic explanation]

## 2.2 Core Principles
[Fundamental concepts]

## 2.3 How It Works
[Mechanism explanation]

## 2.4 Practical Applications
[Use cases and examples]
```

#### Reference Guide

```markdown
## 2.1 Command Syntax
[Command structure]

## 2.2 Options Reference
[Available options and flags]

## 2.3 Common Usage Patterns
[Typical command examples]

## 2.4 Advanced Usage
[Complex scenarios]
```

#### Comparison Article

```markdown
## 2.1 Technology A
[Overview and characteristics]

## 2.2 Technology B
[Overview and characteristics]

## 2.3 Comparison Matrix
[Side-by-side comparison]

## 2.4 Selection Guidance
[When to use each]
```

### Formatting Best Practices

Use tables for:

- Scope definitions (In Scope / Out of Scope)
- Comparison matrices
- Command references
- Configuration options
- Related resources

Use code blocks for:

- Command examples
- Configuration snippets
- Code samples
- Output examples

Use lists for:

- Prerequisites
- Step sequences (when not complex)
- Key points
- External resources

Use headings for:

- Clear section organization
- Logical content flow
- Scannable structure

### Common Mistakes to Avoid

- ❌ Don't add operational overhead (RACI, security sections, etc.)
- ❌ Don't make Section 1 too long (get to content quickly)
- ❌ Don't force rigid Section 2 structure (adapt to content needs)
- ❌ Don't skip the scope definition (helps set expectations)
- ❌ Don't forget related resources (knowledge graph connectivity)
- ❌ Don't omit change log (track article evolution)
- ❌ Don't renumber sections (maintain 1-4 structure)

### When to Use vs. Other Templates

Use General Article Template when:

- Content is informational or educational
- No operational procedures involved
- No compliance/security requirements needed
- No RACI or responsibility tracking needed
- Focus is on knowledge transfer

Use SOP Template when:

- Documenting operational procedures
- Need RACI responsibility tracking
- Requires security/compliance sections
- Infrastructure component documentation
- Formal operational documentation

Use Interior README when:

- Organizing directory contents
- Providing navigation structure
- Establishing knowledge graph connections
- Not delivering actual content

### Repository Context

Repository: [Proxmox Astronomy Lab](https://github.com/Proxmox-Astronomy-Lab/proxmox-astronomy-lab)  
Author Profile: [VintageDon](https://github.com/vintagedon/)  
Platform: Enterprise-grade astronomical computing infrastructure  
Use Case: Lightweight knowledge base articles for concepts, references, how-tos, and explanations
