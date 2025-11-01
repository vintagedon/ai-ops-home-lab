# Appendix E: Change History & Version Control

Organization: RadioAstronomy.io  
Effective Date: 2025-10-24  
Version: 1.0  
Parent Document: AI Governance Policy

---

## 1. Purpose

This appendix documents RadioAstronomy.io's version control methodology for AI governance documentation. All governance materials are maintained in a public GitHub repository using industry-standard version control practices. This approach provides:

- Transparency: Complete history of policy evolution visible to all stakeholders
- Accountability: Every change attributed to a specific person and rationale
- Auditability: Immutable record suitable for regulatory review and compliance evidence
- Collaboration: Standard workflows for proposing, reviewing, and approving changes
- Traceability: Link between policy versions, decisions, and operational outcomes

---

## 2. Version Control Infrastructure

### 2.1 Repository Structure

Primary Repository: <https://github.com/radioastronomy-io/ai-governance>

```markdown
ai-governance/
├── README.md                    # Repository overview and navigation
├── CHANGELOG.md                 # Version-by-version change history
├── LICENSE                      # Open source license
├── policies/
│   ├── 01-ai-governance-policy.md
│   ├── 02-ai-risk-assessment-standard.md
│   ├── 03-secure-ai-systems-standard.md
│   └── 04-ai-transparency-disclosure-standard.md
├── appendices/
│   ├── appendix-a-framework-crosswalk.md
│   ├── appendix-b-glossary-definitions.md
│   ├── appendix-d-review-board-charter.md
│   └── appendix-e-version-control.md
├── templates/
│   └── [Generic versions with placeholders]
├── decisions/
│   └── [Architecture Decision Records]
└── operational/
    ├── ai-tool-register.md
    ├── risk-register.md
    └── [Other operational artifacts]
```

### 2.2 Version Control System

Platform: Git with GitHub hosting

Why Git: Industry standard for version control, provides complete change history, enables collaborative workflows, supports branching and merging for complex changes, integrates with automation tooling.

Public Repository: All governance documentation is publicly visible. This design choice reflects our commitment to transparency and provides reputational accountability. Sensitive operational details (passwords, API keys, personal information) are never committed to the repository.

---

## 3. Semantic Versioning

### 3.1 Version Number Format

All governance documents use semantic versioning: MAJOR.MINOR.PATCH

Example: Version 1.2.3

- MAJOR = 1 (breaking changes, structural rewrites)
- MINOR = 2 (new features, significant enhancements)
- PATCH = 3 (bug fixes, typos, clarifications)

### 3.2 Version Increment Rules

MAJOR version increments when:

- Structural changes to governance framework
- New guiding principles or fundamental approach changes
- Significant scope expansion or contraction
- Changes requiring complete re-acknowledgment by personnel
- Backward-incompatible changes to operational procedures

MINOR version increments when:

- Control enhancements or new safeguards added
- Clarifications to existing requirements
- Process improvements or workflow optimization
- New operational procedures that don't break existing workflows
- Forward-compatible changes

PATCH version increments when:

- Typo corrections and formatting improvements
- Link updates or reference corrections
- Metadata updates (contact information, review dates)
- Documentation improvements without policy changes
- Minor wording clarifications that don't change meaning

### 3.3 Synchronized Versioning

All four core governance documents (Policy + 3 Standards) share the same MAJOR version number. This ensures framework coherence and simplifies compliance tracking.

Example: Version 1.0 release includes:

- AI Governance Policy v1.0.0
- AI Risk Assessment Standard v1.0.0
- Secure AI Systems Standard v1.0.0
- AI Transparency & Disclosure Standard v1.0.0

MINOR and PATCH versions may diverge as individual documents receive targeted updates, but MAJOR versions stay synchronized.

---

## 4. Change Management Workflow

### 4.1 Proposing Changes

Who Can Propose: Anyone - Board members, personnel, external stakeholders, community contributors

How to Propose:

1. Informal suggestions: Email, Slack, verbal discussion for minor clarifications
2. Formal proposals: GitHub issue for substantive changes requiring Board review
3. Direct contributions: Pull request for typos, formatting, or clear improvements

### 4.2 Review and Approval Process

Minor Changes (PATCH):

1. Security Lead reviews and approves
2. Changes committed directly to main branch
3. Reported to Review Board at next quarterly meeting
4. Notification sent to personnel via standard channels

Significant Changes (MINOR):

1. Security Lead drafts proposed changes
2. Impact assessment: workflow disruption, resource requirements, training needs
3. Review Board discusses at quarterly meeting or special session
4. Approval by consensus or majority vote (CTO breaks ties)
5. 30-day transition period for implementation
6. Training materials updated
7. Notification with clear effective date

Major Changes (MAJOR):

1. Security Lead drafts proposed changes
2. Comprehensive impact assessment
3. Stakeholder consultation (affected roles, external advisors if needed)
4. Review Board approval (consensus preferred)
5. Executive Leadership sign-off required
6. 60-90 day transition period typical
7. Personnel re-acknowledgment required
8. Formal announcement with detailed explanation
9. Training sessions or office hours for questions

### 4.3 Git Workflow

Branch Strategy:

- `main` branch contains current approved versions
- Feature branches for substantial changes: `feature/risk-assessment-updates`
- Hotfix branches for urgent corrections: `hotfix/typo-section-3`

Commit Messages:

- Follow conventional commit format: `type(scope): description`
- Types: `feat`, `fix`, `docs`, `chore`, `refactor`
- Examples:
  - `feat(policy): Add quarterly review requirements`
  - `fix(glossary): Correct NIST AI RMF citation`
  - `docs(charter): Clarify quorum requirements`

Pull Requests:

- Title: Clear, concise description of change
- Description: Rationale, impact assessment, related issues
- Review: Security Lead approval required minimum; Board approval for MAJOR/MINOR
- Merge: Squash merge preferred to keep history clean
- Tags: Version tags applied after merge (e.g., `v1.2.0`)

### 4.4 Release Process

When MAJOR or MINOR version approved:

1. Merge all approved changes to main branch
2. Update version numbers in document headers
3. Update CHANGELOG.md with detailed release notes
4. Create git tag: `git tag -a v1.2.0 -m "Version 1.2.0 release"`
5. Push tag: `git push origin v1.2.0`
6. Generate GitHub release with release notes
7. Announce via organization channels
8. Update documentation sites/repositories

PATCH versions may be released ad-hoc without formal announcement, documented in CHANGELOG.md.

---

## 5. Change Documentation

### 5.1 CHANGELOG.md Format

The repository's CHANGELOG.md file maintains human-readable version history:

```markdown
# Changelog

All notable changes to RadioAstronomy.io AI Governance framework documented here.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

## [1.2.0] - 2025-12-15

### Added
- Quarterly access review requirements for agent accounts
- DLP monitoring procedures for high-risk data exports

### Changed
- Updated risk assessment workflow to include threat modeling
- Clarified Review Board quorum requirements in Charter

### Fixed
- Corrected NIST AI RMF citations in Glossary
- Fixed broken links to external framework references

## [1.1.0] - 2025-09-20
[Previous release notes...]

## [1.0.0] - 2025-10-24
Initial release of complete AI governance framework.
```

### 5.2 Rationale Documentation

For All Changes:

- Git commit messages explain WHAT changed
- Pull request descriptions explain WHY it changed

For Significant Changes (MINOR/MAJOR):

- Architecture Decision Records (ADRs) in `/decisions` directory
- Format: Context, Decision, Consequences, Alternatives Considered
- Indexed in README for easy discovery
- Linked from relevant policy sections

For Incident-Driven Changes:

- Lessons Learned documents reference specific incidents
- Root cause analysis informs control enhancements
- Link between incident → lesson → policy change documented

For Regulatory Changes:

- Note which law/regulation triggered change
- Cite specific statutory requirements being addressed
- Document interpretation approach if ambiguous

### 5.3 Architecture Decision Records (ADRs)

Significant governance decisions documented using ADR format:

```markdown
# ADR-001: Adopt NIST AI RMF as Primary Framework

Status: Accepted  
Date: 2025-10-15  
Deciders: Review Board

## Context
Need foundational AI governance framework. Multiple options available: NIST AI RMF, ISO 42001, EU AI Act, custom approach.

## Decision
Adopt NIST AI RMF 1.0 as primary framework, with CIS-RAM for risk assessment methodology and CIS Controls v8.1 for technical baseline.

## Consequences
Positive:
- Voluntary framework reduces compliance burden while providing structure
- Colorado SB-24-205 rebuttable presumption for NIST adoption
- Well-documented with extensive implementation guidance
- Community resources and examples available

Negative:
- Voluntary nature means less prescriptive than ISO 42001
- Requires interpretation for SMB context
- May need supplementation for future regulations

## Alternatives Considered
1. ISO 42001: More prescriptive but expensive certification process
2. EU AI Act: Not applicable to U.S. organization
3. Custom framework: Too resource-intensive for SMB
```

ADRs stored in `/decisions` directory, numbered sequentially, linked from relevant policy sections.

---

## 6. Version Comparison and Audit

### 6.1 Comparing Versions

Using Git:

```bash
# Compare current version to previous release
git diff v1.1.0 v1.2.0

# Compare specific file between versions
git diff v1.1.0 v1.2.0 -- policies/01-ai-governance-policy.md

# View all changes between dates
git log --since="2025-09-01" --until="2025-12-01" --oneline
```

Using GitHub:

- Navigate to repository → Releases → Compare versions
- View side-by-side diff of all changed files
- Read release notes summarizing changes

For Auditors:

- Provide git tag for specific version under review
- Generate PDF export of that tagged version
- Provide CHANGELOG.md entries for time period
- Share ADRs for major decisions during audit period

### 6.2 Audit Trail

Every change in git history includes:

- What: Exact text added/modified/removed (git diff)
- Who: Author of change (git commit author)
- When: Timestamp of change (git commit date)
- Why: Commit message and PR description
- Approval: PR reviews and approvals in GitHub

This provides complete, immutable audit trail suitable for regulatory review, compliance certification, or incident investigation.

### 6.3 Retention

Git Repository: Retained indefinitely with complete history

Tagged Releases: All major versions permanently retained as git tags

PDF Exports: Generated for each MAJOR version and stored in compliance archive

Meeting Minutes: Cross-referenced to policy versions discussed/approved

---

## 7. Operational Procedures

### 7.1 Personnel Access

Read Access: Public repository - anyone can view

Write Access:

- Security Lead: Direct commit access for PATCH changes
- Review Board Members: Can approve pull requests
- CTO: Administrative access for repository management

External Contributors:

- Fork repository and submit pull requests
- Security Lead reviews and merges if appropriate
- Contributor credited in commit history

### 7.2 Emergency Changes

In security incidents or urgent regulatory deadlines:

1. CTO or Security Lead makes immediate change
2. Commit message clearly marked as emergency
3. Rationale documented in commit message
4. Review Board notified within 24 hours
5. Ratified at next Board meeting or special session
6. If not ratified, change reverted

### 7.3 Backup and Disaster Recovery

Primary: GitHub provides git repository hosting and backup

Secondary: Repository cloned to internal infrastructure (proj-fs02) nightly

Tertiary: Major version PDF exports stored in Microsoft 365 SharePoint (Purview-protected)

Recovery Time Objective (RTO): 4 hours - can restore from any backup source

---

## 8. Community Contributions

### 8.1 External Feedback

RadioAstronomy.io welcomes community feedback on governance framework:

How to Contribute:

- Report issues via GitHub Issues
- Suggest improvements via pull requests
- Share implementation experiences in Discussions
- Reference in your own governance programs (attribution appreciated but not required)

Review Process:

- Security Lead triages issues and PRs
- Material suggestions discussed at Review Board meetings
- Community contributors credited in release notes
- Significant contributions acknowledged in README

### 8.2 Template Usage

Generic templates (with placeholders) available in `/templates` directory:

- Organizations may freely copy and adapt
- No attribution required (though appreciated)
- Submit improvements back as pull requests
- Share your implementation stories to help others

---

## 9. Related Documents

Core Governance Framework:

- AI Governance Policy (Section 6: Policy Maintenance and Evolution)
- All standards and appendices maintained under version control

Repository Files:

- README.md (navigation and getting started)
- CHANGELOG.md (version-by-version history)
- /decisions (Architecture Decision Records)
- /templates (generic versions for community use)

External References:

- Semantic Versioning: <https://semver.org/>
- Conventional Commits: <https://www.conventionalcommits.org/>
- Keep a Changelog: <https://keepachangelog.com/>

---

Document Control:

- Source: <https://github.com/radioastronomy-io/ai-governance/appendices/appendix-e-version-control.md>
- Contact: <ops@radioastronomy.io>
- Next Review: 2026-01-26
- Version History: See GitHub repository CHANGELOG.md

Template Availability:

This operational appendix documents RadioAstronomy.io's specific git workflow and version control practices. Organizations adopting the governance framework may use different version control approaches - the important principles are transparency, accountability, and complete change history, regardless of specific tooling.
