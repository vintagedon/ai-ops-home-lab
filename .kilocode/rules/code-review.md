# Code Review with Todo Tree

<!-- 
Purpose: Define systematic code review process using Kilo Code Debug mode and Todo Tree
Audience: Kilo Code (Debug mode), AI agents, human reviewers
Integration: Kilo Code Debug mode, VSCode Todo Tree Enhanced extension
Update Frequency: When review patterns evolve or new tag categories emerge
-->

## When This Applies

- **Kilo Code Debug Mode**: When switched to Debug mode for code review
- **Pre-merge Reviews**: Before merging feature branches to main
- **Security Audits**: Systematic security review of code changes
- **Performance Reviews**: Optimization opportunity identification
- **Refactoring Sessions**: Identifying technical debt and improvement areas
- **Cross-agent Coordination**: When review items need handoff between agents/humans

## The Todo Tree Review System

We use **VSCode Todo Tree Enhanced** as our code review infrastructure:

- **Scans workspace** for tagged comments
- **Tree view** organizes items by tag, file, or priority
- **Highlighting** makes review items visible in editor
- **Priority sorting** with @number notation
- **Export capability** for handoff and documentation
- **Configurable tags** for different review categories

**Why Todo Tree?**
- **Persistent** - Review items survive sessions, aren't lost in chat
- **Trackable** - See all review items across entire codebase
- **Prioritizable** - @number sorting for importance
- **Exportable** - Generate review summaries for handoff
- **Visual** - Highlights in editor prevent items being missed

## Standard Review Tags

All review tags follow the pattern: `// TAG: Description @priority`

### Core Review Tags

**REVIEW:** General review items requiring attention
```javascript
// REVIEW: Verify error handling covers all edge cases @1
// REVIEW: Consider extracting this logic to separate function @3
```

**QUESTION:** Clarification needed before proceeding
```python
# QUESTION: Should this be async or is sync acceptable here? @2
# QUESTION: What's the expected behavior for null input? @1
```

**SECURITY:** Security concerns or vulnerabilities
```javascript
// SECURITY: Input validation needed before database query @1
// SECURITY: Consider rate limiting for this endpoint @2
```

**PERFORMANCE:** Optimization opportunities
```python
# PERFORMANCE: This loop could be vectorized for large datasets @2
# PERFORMANCE: Consider caching this frequently-accessed data @3
```

**TECHNICAL-DEBT:** Known issues to address later
```javascript
// TECHNICAL-DEBT: Replace deprecated API call in v3.0 @4
// TECHNICAL-DEBT: Refactor to use new authentication pattern @5
```

**COORDINATION:** Cross-agent or cross-team coordination needed
```python
# COORDINATION: Needs vault update before merging @1
# COORDINATION: Requires API contract discussion with backend team @2
```

### Standard Development Tags (Keep Existing)

**TODO:** Standard development todos
```javascript
// TODO: Implement pagination for large result sets
// TODO: Add unit tests for error cases
```

**FIXME:** Known bugs or issues to fix
```python
# FIXME: Race condition in concurrent access
# FIXME: Memory leak in long-running processes
```

**BUG:** Identified bugs requiring immediate attention
```javascript
// BUG: Returns incorrect value for negative numbers
// BUG: Crashes on empty input
```

### Special Review Tags

**BREAKING:** Breaking changes requiring documentation
```javascript
// BREAKING: API signature changed, update all callers @1
```

**DOCS:** Documentation needed or missing
```python
# DOCS: Add docstring explaining algorithm complexity @3
# DOCS: Update README with new configuration options @2
```

**TEST:** Testing needs
```javascript
// TEST: Add integration test for payment flow @2
// TEST: Mock external API for unit tests @3
```

---

## Priority System with @number

**@1** - **Critical** - Must address before merge
```javascript
// SECURITY: SQL injection vulnerability @1
// BUG: Data corruption in edge case @1
```

**@2** - **High** - Should address soon, preferably before merge
```python
# REVIEW: Logic error in calculation @2
# PERFORMANCE: O(n²) algorithm, optimize to O(n log n) @2
```

**@3** - **Medium** - Address in near term, can merge if necessary
```javascript
// QUESTION: Clarify expected behavior for edge case @3
// TECHNICAL-DEBT: Simplify this nested logic @3
```

**@4** - **Low** - Nice to have, can defer
```python
# DOCS: Add usage examples to docstring @4
# PERFORMANCE: Minor optimization possible @4
```

**@5** - **Backlog** - Track but not immediate priority
```javascript
// TECHNICAL-DEBT: Consider extracting to library @5
// REVIEW: Evaluate alternative approach @5
```

**No priority** - Informational, no action required
```python
# NOTE: This algorithm based on Smith et al. 2023 paper
```

---

## Kilo Code Debug Mode Integration

### Debug Mode Special Instructions

When Kilo Code is in **Debug mode**, it should:

1. **Load this rule** as primary behavioral guide
2. **Systematically review** staged changes or target files
3. **Insert tagged comments** following tag standards above
4. **Assign priorities** based on severity/importance
5. **Aggregate findings** for summary report
6. **Export review** when complete

### Debug Mode Review Workflow

**Step 1: Scope Definition**
```
User: "Review the authentication module for security issues"
Kilo Code: [Switches to Debug mode, loads code-review.md rule]
```

**Step 2: Systematic Analysis**
Kilo Code reviews each file/function:
- Input validation
- Error handling
- Security patterns
- Performance implications
- Code clarity and maintainability
- Test coverage

**Step 3: Insert Review Tags**
```javascript
// SECURITY: Validate JWT signature before trusting claims @1
// SECURITY: Add rate limiting to prevent brute force @2
// REVIEW: Extract token validation to separate function @3
// PERFORMANCE: Cache public keys for signature verification @3
// TEST: Add tests for expired token handling @2
```

**Step 4: Todo Tree Aggregation**
Todo Tree automatically:
- Scans for all tagged comments
- Groups by tag type
- Sorts by priority (@1 first)
- Shows in tree view
- Highlights in editor

**Step 5: Generate Summary**
```markdown
# Code Review Summary - Authentication Module

## Critical (@1)
- [ ] SECURITY: Validate JWT signature before trusting claims (auth.js:45)

## High Priority (@2)
- [ ] SECURITY: Add rate limiting to prevent brute force (middleware.js:78)
- [ ] TEST: Add tests for expired token handling (auth.test.js:23)

## Medium Priority (@3)
- [ ] REVIEW: Extract token validation to separate function (auth.js:67)
- [ ] PERFORMANCE: Cache public keys for signature verification (crypto.js:34)

Total Items: 5 (1 critical, 2 high, 2 medium)
```

---

## Review Categories and Checklists

### Security Review Checklist

When reviewing for security:

**Input Validation**
- [ ] All user inputs sanitized
- [ ] SQL injection prevention (parameterized queries)
- [ ] XSS prevention (output encoding)
- [ ] Path traversal prevention
- [ ] Command injection prevention

**Authentication & Authorization**
- [ ] Authentication required for protected endpoints
- [ ] Authorization checks for resource access
- [ ] Token validation (signature, expiration, claims)
- [ ] Session management secure
- [ ] Password handling follows best practices

**Data Protection**
- [ ] Sensitive data encrypted at rest
- [ ] Secure communication (HTTPS/TLS)
- [ ] Secrets not hardcoded
- [ ] PII handling compliant with regulations
- [ ] Audit logging for sensitive operations

**Rate Limiting & DoS**
- [ ] Rate limiting on API endpoints
- [ ] Resource exhaustion prevention
- [ ] Timeout configurations
- [ ] Large payload handling

**Tag Pattern:**
```javascript
// SECURITY: [specific issue] @[priority]
```

---

### Performance Review Checklist

When reviewing for performance:

**Algorithm Complexity**
- [ ] Time complexity acceptable for expected data size
- [ ] Space complexity reasonable
- [ ] No unnecessary nested loops
- [ ] Efficient data structures used

**Database Operations**
- [ ] Queries optimized (indexes, joins)
- [ ] N+1 query problems avoided
- [ ] Batch operations used where appropriate
- [ ] Connection pooling configured

**Caching**
- [ ] Frequently-accessed data cached
- [ ] Cache invalidation strategy clear
- [ ] Cache hit rate monitored

**Resource Management**
- [ ] File handles closed properly
- [ ] Network connections released
- [ ] Memory allocations reasonable
- [ ] No obvious memory leaks

**Tag Pattern:**
```python
# PERFORMANCE: [optimization opportunity] @[priority]
```

---

### Code Quality Review Checklist

When reviewing for code quality:

**Readability**
- [ ] Variable/function names descriptive
- [ ] Code structure clear and logical
- [ ] Magic numbers replaced with constants
- [ ] Complex logic commented
- [ ] Consistent formatting

**Maintainability**
- [ ] Functions focused on single responsibility
- [ ] Duplication eliminated (DRY principle)
- [ ] Dependencies minimized
- [ ] Error messages helpful
- [ ] Configuration externalized

**Error Handling**
- [ ] All error cases handled
- [ ] Errors logged appropriately
- [ ] User-facing errors informative
- [ ] No swallowed exceptions
- [ ] Graceful degradation

**Testing**
- [ ] Unit tests for new code
- [ ] Edge cases covered
- [ ] Integration tests for workflows
- [ ] Test data representative
- [ ] Mocks appropriate

**Tag Pattern:**
```javascript
// REVIEW: [quality concern] @[priority]
// QUESTION: [clarification needed] @[priority]
```

---

### Technical Debt Review

When reviewing for technical debt:

**Identification**
- [ ] Deprecated APIs used
- [ ] Outdated dependencies
- [ ] Workarounds/hacks present
- [ ] Incomplete implementations
- [ ] Commented-out code

**Documentation**
- [ ] Reason for debt documented
- [ ] Ideal solution described
- [ ] Migration path outlined
- [ ] Timeline estimated
- [ ] Impact assessed

**Tag Pattern:**
```python
# TECHNICAL-DEBT: [issue] - [ideal solution] @[priority]
```

**Example:**
```python
# TECHNICAL-DEBT: Using deprecated auth library - migrate to OAuth2 @3
# Migration plan in docs/oauth-migration.md, target Q2 2025
```

---

## Review Process Workflows

### Pre-Merge Review (Standard)

**Trigger:** Feature branch ready for merge

**Process:**
1. **Checkout feature branch**
2. **Switch Kilo Code to Debug mode**
3. **Run review:** "Review all changed files"
4. **Kilo Code inserts tags** following this rule
5. **Todo Tree aggregates** all items
6. **Address critical (@1) items** before merge
7. **Create issues** for lower priority items
8. **Export review summary** to PR description
9. **Merge when critical items resolved**

**Todo Tree Export:**
```markdown
# Pre-Merge Review - Feature/User-Auth

## Files Reviewed
- src/auth/login.js
- src/auth/token.js
- src/middleware/auth.js
- tests/auth/login.test.js

## Critical Issues (@1)
None found

## High Priority (@2)
- SECURITY: Add rate limiting to login endpoint (login.js:34)
- TEST: Add integration test for token refresh (login.test.js:67)

## Medium Priority (@3)
- REVIEW: Extract token validation logic (token.js:45)
- PERFORMANCE: Cache user permissions (auth.js:89)

## Recommendation
✅ APPROVED for merge after addressing @2 items
Created issues #456, #457 for @3 items to track post-merge
```

---

### Security Audit (Deep)

**Trigger:** Scheduled security review or security incident

**Process:**
1. **Define audit scope** (component, time period, or full codebase)
2. **Switch Kilo Code to Debug mode**
3. **Systematic review** using security checklist
4. **Insert SECURITY tags** with detailed descriptions
5. **Priority based on severity:**
   - @1: Critical vulnerabilities (data breach, RCE, etc.)
   - @2: High severity (auth bypass, injection, etc.)
   - @3: Medium severity (info disclosure, DoS, etc.)
   - @4: Low severity (minor issues, hardening opportunities)
6. **Export security audit report**
7. **Create security issues** (possibly confidential)
8. **Address by priority**

**Export Template:**
```markdown
# Security Audit Report - [Component/Date]

## Executive Summary
[High-level findings]

## Critical Vulnerabilities (@1)
[List with CVSS scores if applicable]

## High Severity (@2)
[List with impact assessment]

## Medium Severity (@3)
[List with recommendations]

## Recommendations
[Systematic improvements]

## Timeline
[Remediation schedule]
```

---

### Performance Review (Targeted)

**Trigger:** Performance issues identified, optimization needed

**Process:**
1. **Identify performance problem** (slow endpoint, high memory, etc.)
2. **Switch Kilo Code to Debug mode**
3. **Review target code** using performance checklist
4. **Insert PERFORMANCE tags** with complexity analysis
5. **Measure current performance** (baseline metrics)
6. **Propose optimizations** in tag descriptions
7. **Implement highest-priority items** first
8. **Measure improvement** after each optimization

**Tag Example:**
```python
# PERFORMANCE: O(n²) nested loop, optimize to O(n log n) @2
# Current: ~2500ms for 1000 items
# Proposed: Use hash map for lookups instead of nested search
# Expected: ~50ms for 1000 items
```

---

### Cross-Agent Coordination Review

**Trigger:** Changes affecting multiple agents/projects

**Process:**
1. **Identify coordination needs** during code review
2. **Insert COORDINATION tags** with context
3. **Export coordination summary**
4. **Post to staging/** for Vault Orchestrator
5. **Wait for coordination** before proceeding
6. **Update based on feedback**

**Tag Example:**
```javascript
// COORDINATION: API contract change, needs backend team review @1
// COORDINATION: Vault memory bank needs update before merge @2
```

**Export to Staging:**
```markdown
# Coordination Needed - Feature/Multi-Agent-Auth

## Changes Requiring Coordination
1. API authentication endpoint modified (BREAKING)
   - Affects: Backend team, mobile app, web app
   - Needs: Contract review, migration plan

2. Memory bank structure changed
   - Affects: Vault Orchestrator, other project agents
   - Needs: Vault update before merge

## Proposed Timeline
- Backend review: 2 days
- Vault update: 1 day
- Migration plan: 1 day
- Merge: After coordination complete
```

---

## Todo Tree Configuration

### Recommended VSCode Settings

Add to `.vscode/settings.json` in project root:

```json
{
  "todo-tree.general.tags": [
    "REVIEW",
    "QUESTION",
    "SECURITY",
    "PERFORMANCE",
    "TECHNICAL-DEBT",
    "COORDINATION",
    "TODO",
    "FIXME",
    "BUG",
    "BREAKING",
    "DOCS",
    "TEST"
  ],
  "todo-tree.highlights.customHighlight": {
    "SECURITY": {
      "icon": "alert",
      "foreground": "#000000",
      "background": "#ff0000",
      "iconColour": "#ff0000",
      "gutterIcon": true
    },
    "REVIEW": {
      "icon": "eye",
      "foreground": "#000000",
      "background": "#ffcc00",
      "iconColour": "#ffcc00"
    },
    "QUESTION": {
      "icon": "question",
      "foreground": "#000000",
      "background": "#00ccff",
      "iconColour": "#00ccff"
    },
    "PERFORMANCE": {
      "icon": "zap",
      "foreground": "#000000",
      "background": "#ff9900",
      "iconColour": "#ff9900"
    },
    "TECHNICAL-DEBT": {
      "icon": "tools",
      "foreground": "#000000",
      "background": "#cc99ff",
      "iconColour": "#cc99ff"
    },
    "COORDINATION": {
      "icon": "organization",
      "foreground": "#000000",
      "background": "#99ff99",
      "iconColour": "#99ff99"
    }
  },
  "todo-tree.regex.regex": "(//|#|<!--|;|/\\*|^|^[ \\t]*(-|\\d+.))\\s*($TAGS)",
  "todo-tree.general.statusBar": "total"
}
```

### Color Scheme Rationale

- **SECURITY** → Red (danger, critical attention)
- **REVIEW** → Yellow (caution, needs attention)
- **QUESTION** → Blue (inquiry, needs clarification)
- **PERFORMANCE** → Orange (optimization opportunity)
- **TECHNICAL-DEBT** → Purple (future work)
- **COORDINATION** → Green (collaboration needed)

---

## Export and Handoff Patterns

### Exporting Review Summary

**From Todo Tree:**
1. Right-click tree root
2. Select "Export Tree"
3. Choose export format (text or JSON)
4. Save to appropriate location

**For Staging Handoff:**
```bash
# Export to staging for Vault Orchestrator
todo-tree export > /path/to/vault/staging/code-review-YYYY-MM-DD.md
```

**For PR Description:**
```bash
# Export and copy to clipboard
todo-tree export | pbcopy  # macOS
todo-tree export | xclip   # Linux
```

### Review Summary Template

```markdown
# Code Review Summary - [Feature/Component]

**Reviewer:** [Kilo Code Debug Mode / Human Name]  
**Date:** YYYY-MM-DD  
**Scope:** [Files/components reviewed]

## Overview
[Brief description of changes reviewed]

## Critical Issues (@1)
- [ ] [Tag] [Issue] ([file:line])
- [ ] [Tag] [Issue] ([file:line])

## High Priority (@2)
- [ ] [Tag] [Issue] ([file:line])
- [ ] [Tag] [Issue] ([file:line])

## Medium Priority (@3)
- [ ] [Tag] [Issue] ([file:line])

## Low Priority (@4)
- [ ] [Tag] [Issue] ([file:line])

## Statistics
- Total review items: X
- Critical: X
- High: X
- Medium: X
- Low: X

## Recommendation
[APPROVED / NEEDS WORK / BLOCKED]

## Next Steps
1. [Action item]
2. [Action item]

## Notes
[Additional context, patterns observed, etc.]
```

---

## Tag Lifecycle Management

### Creating Review Items

**During Review:**
```javascript
// SECURITY: Validate user input before database query @1
```

### Addressing Review Items

**When Resolved:**
```javascript
// SECURITY: Validate user input before database query @1
// RESOLVED: Added parameterized query and input sanitization
```

**Or Simply Remove:**
```javascript
// Remove the tag entirely when issue is fixed
```

### Deferring Review Items

**Create Issue, Update Tag:**
```javascript
// SECURITY: Add rate limiting to API endpoints @2
// DEFERRED: Created issue #456, scheduled for Sprint 23
```

### False Positives

**Mark as Not Applicable:**
```javascript
// REVIEW: Extract this logic to separate function @3
// N/A: Logic is coupled by design, extraction would increase complexity
```

---

## Special Patterns

### Multi-line Review Comments

For complex review items:

```javascript
// SECURITY: Comprehensive authentication review needed @1
//   1. Validate token signature
//   2. Check token expiration
//   3. Verify user permissions
//   4. Log authentication attempts
//   5. Implement rate limiting
```

### Review Context

Provide context for future reviewers:

```python
# REVIEW: Algorithm complexity needs verification @2
# Context: Customer reported slowdown with 10k+ records
# Current: O(n²) nested loop
# Proposed: Hash map lookup O(n)
# See: performance-analysis.md for benchmark data
```

### Review Discussions

Track discussion in comments:

```javascript
// QUESTION: Should this be sync or async? @2
// Discussion (2024-10-26):
//   - Alice: Async preferred for scalability
//   - Bob: Sync acceptable, traffic is low
//   - Decision: Start with sync, monitor, upgrade if needed
```

---

## Integration with Other Tools

### Git Hooks

Create pre-commit hook to warn about unresolved critical reviews:

```bash
#!/bin/bash
# .git/hooks/pre-commit

CRITICAL=$(grep -r "// SECURITY.*@1\|# SECURITY.*@1" src/)

if [ -n "$CRITICAL" ]; then
  echo "⚠️  WARNING: Critical security review items found:"
  echo "$CRITICAL"
  echo ""
  read -p "Continue with commit? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi
```

### CI/CD Integration

Fail build if critical items present:

```yaml
# .github/workflows/code-review-check.yml
name: Code Review Check
on: [pull_request]
jobs:
  check-review-items:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Check for critical review items
        run: |
          if grep -r "@1" src/; then
            echo "::error::Critical review items (@1) must be resolved"
            exit 1
          fi
```

### Automated Issue Creation

Script to create GitHub issues from review tags:

```bash
#!/bin/bash
# create-issues-from-reviews.sh

grep -rn "// TODO:" src/ | while read -r line; do
  file=$(echo $line | cut -d: -f1)
  line_num=$(echo $line | cut -d: -f2)
  content=$(echo $line | cut -d: -f3-)
  
  gh issue create \
    --title "TODO: $content" \
    --body "Found in $file:$line_num" \
    --label "todo"
done
```

---

## Troubleshooting

### "Todo Tree not finding my tags"

- **Check regex** in settings - does it match your comment style?
- **Verify tag is in tags list** - `todo-tree.general.tags`
- **Reload window** - Sometimes needed after config change
- **Check file is not excluded** - Globs in `excludeGlobs` setting

### "Kilo Code Debug mode not inserting tags"

- **Verify rule is loaded** - Check Kilo Code mode is "Debug"
- **Check custom instructions** - Debug mode should reference this rule
- **Review scope** - Is file in scope of review request?
- **Manual insertion** - Can always add tags manually

### "Priority sorting not working"

- **Use @number format** - Must be `@1`, `@2`, etc., not `@high`
- **Check Todo Tree version** - Enhanced version supports @number sorting
- **Verify configuration** - Check `todo-tree.general.sortTagsOnlyViewAlphabetically` is false

### "Export missing items"

- **Refresh tree** - Click refresh button before export
- **Check filters** - Remove any active filters
- **Verify scope** - Ensure workspace includes all relevant files

---

## Best Practices

**1. Review in Debug Mode**
- Always switch to Debug mode for systematic reviews
- Load this rule before starting review
- Follow checklists appropriate to review type

**2. Prioritize Ruthlessly**
- @1 = blocking issues, must fix before merge
- @2 = important, should fix soon
- @3+ = track but can defer

**3. Be Specific**
- Don't just say "fix this" - explain WHAT and WHY
- Include context for future reviewers
- Reference documentation when helpful

**4. Track Resolution**
- Mark tags as RESOLVED when fixed
- Remove tags that are no longer relevant
- Create issues for deferred items

**5. Export Regularly**
- Export before merging
- Export for handoff between agents
- Export for documentation

**6. Use Consistently**
- Same tags across all projects
- Same priority scale
- Same review checklists

**7. Clean Up**
- Remove resolved tags
- Archive completed reviews
- Don't let tags accumulate

---

## Resources

- **Todo Tree Enhanced:** https://marketplace.visualstudio.com/items?itemName=CJL.todo-tree-enhanced
- **Kilo Code Documentation:** https://kilocode.ai/docs
- **Code Review Best Practices:** Internal documentation

---

**Philosophy:** Code review is collaborative improvement. Tags make review items visible, trackable, and actionable. Debug mode + Todo Tree + systematic checklists = consistent, thorough, documented reviews that scale across agents and humans.
