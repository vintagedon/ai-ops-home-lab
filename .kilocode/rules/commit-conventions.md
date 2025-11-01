# Commit Conventions

<!-- 
Purpose: Define commit message format and generation standards
Audience: Kilo Code (commit generation), AI agents, human developers
Integration: Kilo Code "Generate Commit Message" feature, manual commits
Update Frequency: When commit patterns evolve or tooling changes
-->

## When This Applies

- **Universal**: All git commits across all projects
- **Kilo Code Integration**: When clicking "Generate Commit Message with Kilo" in VSCode
- **Manual Commits**: Writing commit messages by hand
- **Pull Request Titles**: Formatting PR titles for consistency
- **Changelog Generation**: Automated changelog creation from commit history

## Format Standard: Hybrid Emoji-Log + Conventional Commits

We use a **hybrid format** combining visual Emoji-Log categories with machine-readable Conventional Commits structure:

```
[emoji] <type>(<scope>): <description>

[optional body]

[optional footer]
```

**Why Hybrid?**
- **Emoji** → Visual scanning, emotional context, quick comprehension
- **Conventional Commits** → Machine-readable, automated versioning/changelog, tooling compatibility
- **Best of both worlds** → Human-friendly AND automation-friendly

## Emoji Categories and Conventional Types

### 📦 NEW - New Features
**Conventional Type:** `feat`  
**SemVer Impact:** MINOR version bump  
**Use When:** Adding entirely new functionality, features, capabilities

**Examples:**
```
📦 NEW feat(auth): Add JWT token validation
📦 NEW feat(api): Add user profile endpoint
📦 NEW feat: Add dark mode theme support
```

---

### 👌 IMPROVE - Improvements and Refactoring
**Conventional Types:** `refactor`, `perf`, `style`  
**SemVer Impact:** PATCH version bump (or none if internal)  
**Use When:** Enhancing existing code without changing external behavior

**Examples:**
```
👌 IMPROVE refactor(auth): Simplify token validation logic
👌 IMPROVE perf(db): Optimize query performance with indexing
👌 IMPROVE style(components): Apply consistent formatting
```

---

### 🐛 FIX - Bug Fixes
**Conventional Type:** `fix`  
**SemVer Impact:** PATCH version bump  
**Use When:** Correcting defects, errors, or unexpected behavior

**Examples:**
```
🐛 FIX fix(api): Correct null pointer in user lookup
🐛 FIX fix(auth): Resolve race condition in token refresh
🐛 FIX fix: Handle edge case in date parsing
```

---

### 📖 DOC - Documentation
**Conventional Type:** `docs`  
**SemVer Impact:** None (documentation only)  
**Use When:** Adding or updating documentation, README files, comments

**Examples:**
```
📖 DOC docs(readme): Update installation instructions
📖 DOC docs(api): Add endpoint documentation
📖 DOC docs: Fix typo in contribution guidelines
```

---

### 🚀 RELEASE - Version Releases
**Conventional Type:** `chore` (with version tag)  
**SemVer Impact:** Explicit version declaration  
**Use When:** Tagging version releases, publishing packages

**Examples:**
```
🚀 RELEASE chore: Version 2.0.0
🚀 RELEASE chore(npm): Publish version 1.5.3
```

---

### 🤖 TEST - Testing
**Conventional Type:** `test`  
**SemVer Impact:** None (testing infrastructure)  
**Use When:** Adding or modifying tests, test infrastructure, mocks

**Examples:**
```
🤖 TEST test(auth): Add unit tests for token validation
🤖 TEST test(api): Mock external service responses
🤖 TEST test: Increase coverage for edge cases
```

---

### ‼️ BREAKING - Breaking Changes
**Conventional Type:** ANY type with `BREAKING CHANGE:` footer  
**SemVer Impact:** MAJOR version bump  
**Use When:** Changes that break backward compatibility

**Examples:**
```
‼️ BREAKING feat(api): Change authentication protocol

Update from API key to OAuth 2.0 for all endpoints.
Clients must update authentication implementation.

BREAKING CHANGE: API key authentication no longer supported
```

**Alternative Format (append `!` after type/scope):**
```
‼️ BREAKING feat(api)!: Change authentication protocol
```

---

## Additional Conventional Types (No Emoji)

For commits that don't fit emoji categories, use conventional types without emoji:

**build** - Build system, dependencies, tooling
```
build(deps): Upgrade React to version 18
build(docker): Update base image to Node 20
```

**ci** - Continuous integration, pipelines, automation
```
ci(github): Add automated security scanning
ci(deploy): Configure production deployment workflow
```

**chore** - Maintenance tasks, repository housekeeping
```
chore(git): Update .gitignore patterns
chore: Remove deprecated configuration files
```

**ops** - Operational changes (infrastructure, deployment, monitoring)
```
ops(k8s): Scale production deployment to 5 replicas
ops(monitoring): Add alerting for API latency
```

---

## Scope Usage Guidelines

**Scope** provides additional context about what part of the codebase is affected.

### When to Use Scope

**Multi-component projects** - RECOMMENDED
```
feat(api): Add health check endpoint
fix(ui): Correct button alignment
docs(sdk): Update integration examples
```

**Monorepos** - REQUIRED
```
feat(auth-service): Add OAuth provider
fix(payment-service): Handle timeout errors
```

**Single-component projects** - OPTIONAL
```
feat: Add user preferences
fix: Resolve memory leak
```

### Scope Naming Conventions

- **Lowercase**: `feat(api):` not `feat(API):`
- **Hyphenated**: `feat(auth-service):` not `feat(auth_service):`
- **Component/module names**: Match actual code structure
- **Consistent**: Use same scope names across commits

### Common Scopes by Project Type

**Web Application:**
- `(ui)`, `(api)`, `(auth)`, `(db)`, `(config)`

**Library/SDK:**
- `(core)`, `(utils)`, `(types)`, `(examples)`

**Infrastructure/DevOps:**
- `(k8s)`, `(terraform)`, `(ansible)`, `(docker)`

**Documentation Projects:**
- `(readme)`, `(api-docs)`, `(guides)`, `(examples)`

---

## Description Requirements

The description is the single most important part of the commit message.

### Rules

1. **Use imperative mood** - "Add feature" not "Added feature" or "Adding feature"
2. **Start lowercase** - `feat(api): add endpoint` not `feat(api): Add endpoint`
3. **No period at end** - `fix: resolve bug` not `fix: resolve bug.`
4. **Be specific** - Say WHAT changed, not just WHERE
5. **Maximum ~50-72 characters** - Concise but descriptive

### Good vs Bad Examples

**❌ BAD:**
```
📦 NEW feat: Updates
🐛 FIX fix: Fixed bug
👌 IMPROVE refactor: Changes
```

**✅ GOOD:**
```
📦 NEW feat(auth): Add session timeout configuration
🐛 FIX fix(api): Resolve race condition in concurrent requests
👌 IMPROVE refactor(db): Extract query builder into separate module
```

---

## Optional Body

Use the body for additional context when the description alone is insufficient.

### When to Include Body

- **Complex changes** - Explain the "why" and "how"
- **Design decisions** - Document reasoning
- **Breaking changes** - Detail migration path
- **Multiple related changes** - List specific modifications
- **Context for reviewers** - Help understand implications

### Body Format

- **Blank line** after description (required)
- **Wrap at 72 characters** for readability
- **Use bullet points** for lists
- **Explain motivation** before implementation details

### Example with Body

```
🐛 FIX fix(api): Resolve timeout in large data exports

Export requests with >10k records were timing out due to
synchronous processing. Changed to async job queue pattern.

- Move export logic to background worker
- Add job status endpoint for progress tracking
- Implement retry logic for failed exports
- Add timeout configuration (default: 5 minutes)

Resolves issue #234
```

---

## Optional Footer

Footers provide metadata and references.

### Common Footer Types

**Breaking Changes:**
```
BREAKING CHANGE: API v1 endpoints removed, use v2
```

**Issue References (GitHub/GitLab):**
```
Fixes #123
Closes #456
Refs #789
```

**Multiple Issues:**
```
Fixes #123, #456, #789
```

**Pull Request Links:**
```
Refs PR-42
```

**Co-authors:**
```
Co-authored-by: Name <email@example.com>
```

**Other Metadata:**
```
Reviewed-by: Jane Doe <jane@example.com>
Signed-off-by: John Smith <john@example.com>
```

### Example with Multiple Footers

```
‼️ BREAKING feat(api)!: Migrate to REST API v2

Complete rewrite of API using OpenAPI 3.0 specification.
All v1 endpoints deprecated and will be removed in 3 months.

Migration guide: docs/migration-v1-to-v2.md

BREAKING CHANGE: v1 endpoints return 410 Gone
Refs #156, #178, #203
Co-authored-by: Jane Developer <jane@example.com>
```

---

## Generating Commits with Kilo Code

### Standard Workflow

1. **Stage changes** in VSCode Source Control
2. **Click** "Generate Commit Message with Kilo" button
3. **Kilo Code analyzes:**
   - File changes (diff)
   - Resolved TODO/FIXME comments
   - Patterns in code modifications
4. **Generates commit message** following this rule
5. **Review and edit** if needed
6. **Commit** with ✓ Commit button

### What Kilo Code Should Consider

**When Analyzing Changes:**
- **Type of change** - Is this feat, fix, refactor, docs, etc.?
- **Affected scope** - Which component/module changed?
- **Significance** - Is this breaking? Does it need body explanation?
- **Issue resolution** - Were any TODOs/issues resolved?
- **Multiple concerns** - Should this be split into multiple commits?

**Commit Message Generation:**
- **Select appropriate emoji** based on change type
- **Choose conventional type** matching the change
- **Identify scope** from file paths and module structure
- **Write imperative description** summarizing the change
- **Add body** if change is complex or non-obvious
- **Include footers** for issue references or breaking changes

### Example: Kilo Code Analysis

**Staged Changes:**
```diff
+ src/auth/token-validator.js    (new file)
+ src/auth/index.js               (import added)
M src/api/middleware.js           (use token validator)
M tests/auth/token.test.js        (new test cases)
```

**Kilo Code Generates:**
```
📦 NEW feat(auth): Add JWT token validation middleware

Implement token expiration checking and signature validation.
Middleware automatically validates tokens on protected routes.

- Add TokenValidator class with configurable options
- Integrate with existing auth middleware chain
- Add comprehensive unit tests for edge cases

Closes #145
```

---

## Special Cases and Patterns

### Multiple Files, Single Concern

**Good** - One commit for related changes:
```
📦 NEW feat(auth): Add password reset flow

- Add password reset request endpoint
- Add email template for reset links
- Add password update endpoint
- Add tests for complete flow
```

### Multiple Concerns in Staged Changes

**Bad** - Don't commit unrelated changes together:
```
❌ 📦 NEW feat: Add login and fix typos and update readme
```

**Good** - Split into separate commits:
```
✅ 📦 NEW feat(auth): Add login endpoint
✅ 📖 DOC docs(readme): Fix typos in installation section
```

### Merge Commits

Use default merge message or:
```
chore(merge): Merge branch 'feature/user-auth' into main
```

### Reverting Commits

```
revert: Revert "feat(api): Add experimental endpoint"

This reverts commit abc123def456.
Reason: Causes performance degradation in production.
```

### Work in Progress (WIP)

For feature branches only, not main:
```
wip: Implement user authentication (incomplete)
```

**Note:** Squash WIP commits before merging to main.

---

## Commit Message Checklist

Before committing, verify:

- [ ] Emoji matches the change type
- [ ] Conventional type is correct
- [ ] Scope identifies affected component (if applicable)
- [ ] Description is imperative, lowercase, no period
- [ ] Description is specific and meaningful
- [ ] Body explains "why" for complex changes (if needed)
- [ ] Breaking changes have BREAKING CHANGE footer
- [ ] Issue references included (if applicable)
- [ ] Commit is focused on single concern
- [ ] No WIP commits on main branch

---

## Project-Specific Conventions

### For astronomy-cluster Projects

**Preferred scopes:**
- `(vault)` - Obsidian vault structure/content
- `(docs)` - Documentation
- `(infra)` - Infrastructure code
- `(ansible)` - Ansible playbooks
- `(templates)` - Project templates
- `(memory-bank)` - Memory bank files

**Example commits:**
```
📦 NEW feat(templates): Add memory bank template structure
📖 DOC docs(vault): Update agent coordination protocols
👌 IMPROVE refactor(ansible): Simplify VM provisioning playbook
```

### For NIST AI RMF Cookbook

**Preferred scopes:**
- `(govern)` - GOVERN function mappings
- `(map)` - MAP function mappings
- `(measure)` - MEASURE function mappings
- `(manage)` - MANAGE function mappings
- `(compliance)` - Compliance tracking
- `(docs)` - Documentation

**Example commits:**
```
📦 NEW feat(govern): Add GV-1.1 control implementation
📖 DOC docs(readme): Update compliance matrix
🐛 FIX fix(map): Correct control reference in MAP-2.3
```

---

## Troubleshooting

### "Kilo Code generated the wrong type"

- **Review the staged changes** - Is the type actually correct?
- **Edit the message** - Kilo Code provides starting point, not final message
- **Check this rule** - Ensure examples match your expectation

### "Scope is inconsistent across commits"

- **Define project scopes** in project documentation
- **Document in memory-bank/tech.md** for reference
- **Establish pattern** early in project lifecycle

### "Body seems unnecessary"

- **Body is optional** - Only include when adding value
- **Complex changes need context** - Don't skip body for non-obvious changes
- **Think about reviewers** - Would they benefit from explanation?

### "Should I split this commit?"

**Yes, if:**
- Changes address multiple unrelated concerns
- Mix of feat, fix, docs, etc. in one commit
- Part of changes are experimental/WIP

**No, if:**
- All changes support single feature/fix
- Changes are dependent on each other
- Split would break atomic commit principle

---

## Resources

- **Emoji-Log Specification:** https://github.com/ahmadawais/Emoji-Log
- **Conventional Commits:** https://www.conventionalcommits.org/
- **Semantic Versioning:** https://semver.org/
- **VSCode Emoji-Log Extension:** https://marketplace.visualstudio.com/items?itemName=ahmadawais.emoji-log-vscode

---

## Examples Gallery

### Perfect Commits

```
📦 NEW feat(api): Add rate limiting middleware
👌 IMPROVE perf(db): Add indexes for user queries
🐛 FIX fix(auth): Handle expired token edge case
📖 DOC docs(api): Add OpenAPI specification
🚀 RELEASE chore: Version 1.2.0
🤖 TEST test(api): Add integration tests for auth flow
```

### Commits with Body

```
📦 NEW feat(payments): Integrate Stripe payment processing

Add complete Stripe integration for subscription payments.
Supports monthly and annual billing cycles with automatic
renewal and webhook handling for payment events.

- Add Stripe SDK and configuration
- Implement payment intent creation
- Add webhook endpoint for payment events
- Add subscription management endpoints
- Comprehensive error handling and retry logic

Closes #234, #245
```

### Breaking Change

```
‼️ BREAKING feat(api)!: Replace REST with GraphQL API

Complete API rewrite using GraphQL for improved flexibility
and performance. REST endpoints deprecated and will be removed
in version 3.0.0 (3 months from now).

Migration guide: docs/graphql-migration.md
GraphQL playground: https://api.example.com/graphql

BREAKING CHANGE: All REST endpoints return 410 Gone with
migration instructions. Clients must upgrade to GraphQL.

Refs #500
```

---

**Philosophy:** Commit messages are communication. They tell the story of your codebase. Invest the time to write them well, and your future self (and teammates, and AI agents) will thank you.
