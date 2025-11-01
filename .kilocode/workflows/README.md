# Kilo Code Workflows Guide

**Purpose:** Define and document custom workflows for automating multi-step processes  
**Location:** `.kilocode/workflows/` directory in project root  
**Integration:** Kilo Code slash commands, custom rules, memory bank system  
**Status:** Template and guide - implement when ready

---

## Table of Contents

- [What Are Workflows?](#what-are-workflows)
- [Quick Start](#quick-start)
- [Available Workflow Templates](#available-workflow-templates)
- [Creating New Workflows](#creating-new-workflows)
- [Workflow Template Structure](#workflow-template-structure)
- [Integration with Custom Rules](#integration-with-custom-rules)
- [Best Practices](#best-practices)
- [Common Patterns](#common-patterns)
- [Troubleshooting](#troubleshooting)
- [Implementation Roadmap](#implementation-roadmap)

---

## What Are Workflows?

Workflows are **custom slash commands** that chain multiple Kilo Code actions together into automated sequences. Think of them as AI-powered macros that can understand context and make intelligent decisions.

### Why Workflows?

**Problem:** Repetitive multi-step processes take time and cognitive load
- Review code → Fix issues → Run tests → Commit → Push → Create PR
- Load context → Check todos → Generate briefing
- Security audit → Export report → Create issues → Notify team

**Solution:** Define workflows once, execute with single command
- `/release` - Complete release workflow (test, commit, PR)
- `/morning-standup` - Generate daily briefing
- `/security-audit` - Comprehensive security review

**Benefits:**
- **Consistency** - Same process every time, no forgotten steps
- **Efficiency** - One command instead of 10 manual steps
- **Quality** - Built-in validation and custom rule integration
- **Documentation** - Workflows document your processes
- **Scalability** - Share workflows across projects/team

### Real-World Example

**Without Workflow:**
1. Switch to Debug mode
2. Review code following code-review.md checklist
3. Check for critical issues
4. Fix any @1 priority items
5. Run tests
6. Stage changes
7. Generate commit message following commit-conventions.md
8. Commit
9. Push
10. Create PR with description

**With Workflow:**
```bash
/complete-feature
```
Done. All 10 steps automated with intelligent decision-making.

---

## Quick Start

### 1. Create Workflows Directory

```bash
mkdir -p .kilocode/workflows
```

### 2. Copy Template

Copy the [Workflow Template Structure](#workflow-template-structure) section below to `.kilocode/workflows/_TEMPLATE.yml`

### 3. Create Your First Workflow

Start with the simple Release Workflow template below. Copy to `.kilocode/workflows/release.yml`

### 4. Test Workflow

In VSCode with Kilo Code:
```
/release
```

### 5. Iterate and Expand

Add more workflows as needed. See [Available Workflow Templates](#available-workflow-templates) for ideas.

---

## Available Workflow Templates

Copy these templates to `.kilocode/workflows/` and customize for your project.

### 1. Release Workflow

**File:** `release.yml`  
**Command:** `/release`  
**Purpose:** Test, commit, and create PR for release

```yaml
name: release
description: Test, commit, and create PR for release
trigger: manual

steps:
  - name: run_tests
    mode: code
    prompt: "Run all tests and verify passing. Report test results."
    waitForCompletion: true
    abortIf: "tests_failed"
    
  - name: stage_changes
    mode: code
    prompt: "Stage all modified files using git add. Verify all intended changes are staged."
    waitForCompletion: true
    
  - name: generate_commit
    mode: code
    prompt: "Generate commit message following commit-conventions.md rule. Use 🚀 RELEASE emoji with appropriate conventional type and version number."
    waitForCompletion: true
    
  - name: commit_and_push
    mode: code
    prompt: "Commit staged changes with generated message and push to remote branch."
    waitForCompletion: true
    
  - name: create_pr
    mode: code
    prompt: "Create pull request with detailed description based on commits. Include release notes and breaking changes if any."
    waitForCompletion: true

onComplete:
  - action: notify
    message: "Release workflow completed. PR created successfully."
```

---

### 2. Complete Feature Workflow

**File:** `complete-feature.yml`  
**Command:** `/complete-feature`  
**Purpose:** Complete feature branch with review, validation, and PR

```yaml
name: complete-feature
description: Complete feature branch with review, commit, and PR
trigger: manual

preconditions:
  - check: "git_branch_not_main"
    message: "Feature workflow should not run on main branch"

steps:
  - name: code_review
    mode: debug
    prompt: "Systematic code review following code-review.md. Insert review tags for any issues found. Use standard review tags (REVIEW, SECURITY, PERFORMANCE, QUESTION, TECHNICAL-DEBT) with priority annotations."
    waitForCompletion: true
    
  - name: check_critical
    mode: ask
    prompt: "Check for any @1 or @2 priority review items. Report if any blocking issues exist. List specific items with file:line references."
    waitForCompletion: true
    abortIf: "critical_items_found"
    
  - name: run_tests
    mode: code
    prompt: "Run all tests affected by changes. Verify passing."
    waitForCompletion: true
    abortIf: "tests_failed"
    
  - name: generate_commit
    mode: code
    prompt: "Generate commit message following commit-conventions.md for all staged changes. Use appropriate emoji and conventional type based on change nature."
    waitForCompletion: true
    
  - name: commit_push_pr
    mode: code
    prompt: "Commit changes, push to remote, and create PR with comprehensive description including review summary and test results."
    waitForCompletion: true

onComplete:
  - action: notify
    message: "Feature complete. PR created with review summary."
    
onError:
  - action: notify
    message: "Feature completion blocked at step: {step_name}. Review critical items and retry."
```

---

### 3. Security Audit Workflow

**File:** `security-audit.yml`  
**Command:** `/security-audit`  
**Purpose:** Comprehensive security review with reporting

```yaml
name: security-audit
description: Comprehensive security review of changes
trigger: manual

steps:
  - name: security_scan
    mode: debug
    prompt: "Security audit following code-review.md security checklist. Review: input validation, authentication/authorization, data protection, rate limiting, secrets management. Tag all findings with SECURITY tag and appropriate priority."
    waitForCompletion: true
    
  - name: export_report
    mode: code
    prompt: "Export Todo Tree security tags to staging/security-audit-{date}.md. Format as structured report with executive summary, findings by priority, and recommendations."
    waitForCompletion: true
    
  - name: check_critical
    mode: ask
    prompt: "Count critical (@1) and high (@2) priority SECURITY items. Generate statistics."
    waitForCompletion: true
    
  - name: create_issues
    mode: code
    prompt: "Create GitHub issues for all @1 and @2 SECURITY tags with detailed descriptions and remediation steps."
    waitForCompletion: true
    
  - name: notify
    mode: ask
    prompt: "Generate security audit summary for team notification. Include total findings, critical count, and recommended timeline for remediation."
    waitForCompletion: true

onComplete:
  - action: export_report
    path: "staging/security-audit-{date}.md"
  - action: notify
    message: "Security audit complete. Report exported to staging."
```

---

### 4. Memory Bank Update Workflow

**File:** `update-memory-bank.yml`  
**Command:** `/update-memory-bank`  
**Purpose:** Update project memory bank after work session

```yaml
name: update-memory-bank
description: Update project memory bank after work session
trigger: manual

steps:
  - name: analyze_changes
    mode: ask
    prompt: "Analyze recent commits and work done this session. Summarize: what was accomplished, what problems were solved, what patterns emerged."
    waitForCompletion: true
    
  - name: update_context
    mode: code
    prompt: "Update .kilocode/rules/memory-bank/context.md with: 1) Recent Accomplishments (what was just completed), 2) Current State (current phase/status), 3) Next Steps (what should happen next), 4) Active Decisions (any open questions), 5) Update 'Last Updated' date to today."
    waitForCompletion: true
    
  - name: check_architecture
    mode: architect
    prompt: "Review if any architectural patterns or design decisions changed during this session. Check if architecture.md needs updates."
    waitForCompletion: true
    
  - name: update_architecture
    mode: code
    prompt: "If architectural changes detected, update .kilocode/rules/memory-bank/architecture.md with new patterns, decisions, or constraints. Add date-stamped architectural decision records."
    waitForCompletion: true
    onlyIf: "architecture_changed"
    
  - name: staging_summary
    mode: code
    prompt: "Write work session summary to vault staging/ directory. Format: session date/duration, work completed, memory bank updates made, cross-project observations."
    waitForCompletion: true

onComplete:
  - action: notify
    message: "Memory bank updated. Session summary written to staging."
```

---

### 5. Morning Standup Workflow

**File:** `morning-standup.yml`  
**Command:** `/morning-standup`  
**Purpose:** Generate morning briefing and setup for day

```yaml
name: morning-standup
description: Generate morning briefing and setup for day
trigger: manual

steps:
  - name: load_context
    mode: ask
    prompt: "Read .kilocode/rules/memory-bank/context.md and summarize: current phase, recent accomplishments, and documented next steps."
    waitForCompletion: true
    
  - name: check_todos
    mode: ask
    prompt: "Scan workspace for critical (@1, @2) review items. Report by tag type (SECURITY, BUG, REVIEW, COORDINATION) with file:line references."
    waitForCompletion: true
    
  - name: git_status
    mode: ask
    prompt: "Check git status: uncommitted changes, current branch, commits ahead/behind remote, any merge conflicts."
    waitForCompletion: true
    
  - name: check_coordination
    mode: ask
    prompt: "Check vault staging/ directory for any coordination items requiring attention from other agents or requiring handoff."
    waitForCompletion: true
    
  - name: generate_briefing
    mode: ask
    prompt: "Generate morning briefing with sections: 1) CURRENT STATE (from memory bank), 2) CRITICAL ITEMS (from todo scan), 3) GIT STATUS (branch/changes), 4) TODAY'S PRIORITIES (from context.md next steps), 5) COORDINATION NEEDS (from staging). Format as concise markdown."
    waitForCompletion: true

onComplete:
  - action: notify
    message: "Morning briefing generated. Review priorities and critical items."
```

---

### 6. Pre-Commit Validation Workflow

**File:** `pre-commit.yml`  
**Command:** `/pre-commit`  
**Purpose:** Validate changes before committing

```yaml
name: pre-commit
description: Validate changes before committing
trigger: manual

steps:
  - name: check_staged
    mode: ask
    prompt: "Verify files are staged for commit. Report what will be committed."
    waitForCompletion: true
    abortIf: "nothing_staged"
    
  - name: lint_check
    mode: code
    prompt: "Run linters and formatters on staged files. Report any formatting issues or lint violations."
    waitForCompletion: true
    
  - name: test_affected
    mode: code
    prompt: "Identify and run tests for files affected by changes. Focus on unit tests for modified modules."
    waitForCompletion: true
    abortIf: "tests_failed"
    
  - name: review_critical
    mode: debug
    prompt: "Quick review for SECURITY and BUG patterns in staged changes. Focus on: input validation, error handling, resource management. Flag any critical issues."
    waitForCompletion: true
    abortIf: "critical_issues_found"
    
  - name: generate_commit
    mode: code
    prompt: "Generate commit message following commit-conventions.md. Analyze staged changes to determine appropriate emoji, type, scope, and description. If all checks passed, commit is ready."
    waitForCompletion: true

onComplete:
  - action: notify
    message: "Pre-commit validation passed. Ready to commit with generated message."
    
onError:
  - action: notify
    message: "Pre-commit validation failed at: {step_name}. Address issues before committing."
```

---

### 7. Cross-Agent Coordination Workflow

**File:** `coordinate.yml`  
**Command:** `/coordinate`  
**Purpose:** Coordinate change across multiple agents/projects

```yaml
name: coordinate
description: Coordinate change across multiple agents/projects
trigger: manual

steps:
  - name: identify_coordination
    mode: ask
    prompt: "Analyze current changes for cross-project impacts. Check: API contracts, shared dependencies, infrastructure changes, memory bank updates, documentation that affects other projects. Identify all COORDINATION needs."
    waitForCompletion: true
    
  - name: check_memory_banks
    mode: ask
    prompt: "Check if memory banks in related projects (.kilocode/rules/memory-bank/) need updates based on these changes. List affected projects."
    waitForCompletion: true
    
  - name: export_summary
    mode: code
    prompt: "Export coordination summary to vault staging/coordination-{date}-{project}.md. Format: 1) Changes requiring coordination, 2) Affected projects/agents, 3) Required updates, 4) Proposed timeline."
    waitForCompletion: true
    
  - name: create_coordination_issue
    mode: code
    prompt: "Create tracking issue for coordination with: title 'Coordination: [description]', labels 'coordination', 'cross-project', links to affected projects, checklist of coordination tasks, assignment to appropriate owners."
    waitForCompletion: true
    
  - name: notify_orchestrator
    mode: ask
    prompt: "Generate notification for Vault Orchestrator summarizing coordination needs and linking to staging summary."
    waitForCompletion: true

onComplete:
  - action: export_report
    path: "staging/coordination-{date}-{project}.md"
  - action: notify
    message: "Coordination summary exported to staging. Vault Orchestrator notified."
```

---

## Creating New Workflows

### Step-by-Step Process

**1. Define the Goal**
- What manual process are you automating?
- What's the complete sequence of steps?
- Where are the decision points?
- What could go wrong?

**2. Choose Workflow Name**
- Use descriptive, action-oriented names
- Use hyphens for multi-word names: `update-memory-bank`
- Command will be: `/your-workflow-name`

**3. Map Out Steps**
- List every step in sequence
- Identify which mode each step needs
- Determine dependencies between steps
- Plan for error handling

**4. Reference Custom Rules**
- Link to commit-conventions.md for commits
- Link to code-review.md for reviews
- Link to memory-bank files for context

**5. Add Validation**
- Preconditions (what must be true before starting)
- Abort conditions (when to stop mid-workflow)
- Success criteria (how to know it worked)

**6. Test and Iterate**
- Run workflow with `/your-workflow-name`
- Watch for failure points
- Refine prompts for clarity
- Add error handling as needed

---

## Workflow Template Structure

Copy this template to `.kilocode/workflows/_TEMPLATE.yml` for reference:

```yaml
# Workflow Template
# Copy this template and customize for your specific workflow
# File naming: descriptive-name.yml
# Command will be: /descriptive-name

name: workflow-name
description: Brief description of what this workflow does (1-2 sentences)
trigger: manual  # Options: manual, git-commit, file-save, schedule

# Optional: Conditions that must be true before workflow starts
preconditions:
  - check: "git_branch_not_main"
    message: "This workflow should not run on main branch"
  - check: "tests_passing"
    message: "Tests must pass before proceeding"
  - check: "files_staged"
    message: "Stage files before running this workflow"

# Workflow steps (executed in sequential order)
steps:
  # Step 1: Initial analysis or preparation
  - name: step_1_descriptive_name
    mode: ask | code | debug | architect | orchestrator
    prompt: |
      Detailed prompt for this step. Be specific about:
      - What to analyze/do
      - What format to use
      - What to reference (custom rules, memory bank, etc.)
      - What output is expected
    waitForCompletion: true | false
    abortIf: "condition_name"  # Optional: stop workflow if this condition met
    
  # Step 2: Main action
  - name: step_2_descriptive_name
    mode: ask | code | debug | architect | orchestrator
    prompt: |
      Next step prompt. Can reference results from previous steps.
      Reference custom rules when appropriate:
      - commit-conventions.md for commit generation
      - code-review.md for code reviews
      - memory-bank files for context
    waitForCompletion: true
    dependsOn: step_1_descriptive_name  # Optional: explicit dependency
    onlyIf: "condition_name"  # Optional: only run if condition met
    
  # Step 3: Validation or finalization
  - name: step_3_descriptive_name
    mode: ask | code | debug | architect | orchestrator
    prompt: |
      Final step prompt. Often includes:
      - Verification of completion
      - Cleanup actions
      - Report generation
      - Notification preparation
    waitForCompletion: true

# Optional: Actions to execute when workflow completes successfully
onComplete:
  - action: notify
    message: "Workflow completed successfully. [Specific outcome details]"
  - action: export_report
    path: "path/to/report/location/{date}.md"
  - action: update_memory_bank
    fields: ["context", "architecture"]

# Optional: Actions to execute when workflow fails
onError:
  - action: notify
    message: "Workflow failed at step: {step_name}. [Specific failure guidance]"
  - action: export_error_log
    path: "logs/workflow-error-{date}.md"
  - action: rollback
    steps: [step_1_descriptive_name, step_2_descriptive_name]
```

### Template Field Reference

**Top Level:**
- `name` - Workflow identifier (used in slash command)
- `description` - Human-readable description
- `trigger` - When workflow runs (manual, git-commit, file-save, schedule)

**Preconditions:**
- `check` - Condition name to verify
- `message` - Error message if condition fails

**Steps:**
- `name` - Step identifier (for dependencies/rollback)
- `mode` - Kilo Code mode to use (ask/code/debug/architect/orchestrator)
- `prompt` - Detailed instructions for this step
- `waitForCompletion` - Wait for step to finish before proceeding
- `abortIf` - Stop workflow if condition met
- `dependsOn` - Explicit dependency on another step
- `onlyIf` - Only run step if condition met

**onComplete/onError:**
- `action` - Action to execute (notify/export_report/rollback/etc.)
- Additional parameters specific to action type

---

## Integration with Custom Rules

Workflows become **10x more powerful** when integrated with our custom rule system.

### Referencing Custom Rules in Workflows

**Commit Generation:**
```yaml
- name: generate_commit
  mode: code
  prompt: "Generate commit message following commit-conventions.md rule. Use hybrid emoji + conventional format. Analyze staged changes to determine appropriate type, scope, and description."
```

**Code Review:**
```yaml
- name: code_review
  mode: debug
  prompt: "Systematic code review following code-review.md. Use standard review tags (REVIEW, SECURITY, PERFORMANCE, QUESTION, TECHNICAL-DEBT, COORDINATION) with @priority notation. Follow security, performance, and quality checklists."
```

**Memory Bank Updates:**
```yaml
- name: update_context
  mode: code
  prompt: "Update .kilocode/rules/memory-bank/context.md following memory bank structure. Update: Recent Accomplishments, Current State, Next Steps, Active Decisions, Last Updated date."
```

### Why This Integration Matters

**Without Rule Integration:**
```yaml
prompt: "Generate a commit message"
# Result: Inconsistent format, missing emoji, no scope, unpredictable quality
```

**With Rule Integration:**
```yaml
prompt: "Generate commit message following commit-conventions.md rule"
# Result: 📦 NEW feat(api): Add user authentication endpoint
# Consistent, follows standards, machine-readable, high quality
```

### Custom Rule Reference Patterns

**For Commits:**
- Always reference: `commit-conventions.md`
- Mention: "Use hybrid emoji + conventional format"
- Specify: "Analyze changes to determine appropriate type and scope"

**For Reviews:**
- Always reference: `code-review.md`
- Mention: "Use standard review tags with @priority"
- Specify which checklist: "security checklist" / "performance checklist"

**For Memory Bank:**
- Always reference: `.kilocode/rules/memory-bank/`
- Specify file: `context.md` / `architecture.md` / `tech.md`
- Mention structure: "Following memory bank template structure"

**For Auto-Launch:**
- Reference prompt from auto-launch config
- Example: "Analyze git changes since last commit for review tags"

---

## Best Practices

### 1. Make Workflows Atomic

**✅ Good - Single Complete Task:**
```yaml
name: release
description: Complete release workflow
# Test → Commit → Push → PR (one cohesive process)
```

**❌ Bad - Mixed Unrelated Concerns:**
```yaml
name: release-and-update-docs
description: Release workflow and documentation updates
# Mixing release process with documentation tasks
```

**Principle:** Each workflow should accomplish ONE complete task. If you find yourself using "and" in the description, consider splitting.

---

### 2. Use Appropriate Modes

**ask** - Query, analyze, report (non-invasive, read-only)
```yaml
- name: analyze_changes
  mode: ask
  prompt: "Analyze recent commits and summarize work done"
```

**code** - Write, modify, execute code (makes changes)
```yaml
- name: commit_changes
  mode: code
  prompt: "Commit staged changes with generated message"
```

**debug** - Systematic review following code-review.md
```yaml
- name: security_audit
  mode: debug
  prompt: "Security audit following code-review.md security checklist"
```

**architect** - High-level design and planning
```yaml
- name: check_architecture
  mode: architect
  prompt: "Review if architectural patterns changed this session"
```

**orchestrator** - Coordinate across multiple tasks/agents
```yaml
- name: coordinate_projects
  mode: orchestrator
  prompt: "Coordinate changes across multiple affected projects"
```

---

### 3. Include Validation Steps

**Preconditions** (check before starting):
```yaml
preconditions:
  - check: "git_branch_not_main"
    message: "Run this workflow on feature branch, not main"
  - check: "tests_passing"
    message: "Fix failing tests before proceeding"
  - check: "files_staged"
    message: "Stage files you want to commit first"
```

**Abort Conditions** (stop mid-workflow if problem detected):
```yaml
- name: run_tests
  mode: code
  prompt: "Run all tests and verify passing"
  abortIf: "tests_failed"

- name: check_critical
  mode: ask
  prompt: "Check for @1 priority issues"
  abortIf: "critical_items_found"
```

**Conditional Steps** (only run if needed):
```yaml
- name: update_architecture
  mode: code
  prompt: "Update architecture.md if patterns changed"
  onlyIf: "architecture_changed"
```

---

### 4. Make Workflows Idempotent

**Idempotent** = Safe to run multiple times without adverse effects

**✅ Good - Checks State First:**
```yaml
- name: stage_changes
  mode: code
  prompt: "Check if files are already staged. If not, stage all modified files."
```

**❌ Bad - Assumes Clean State:**
```yaml
- name: stage_changes
  mode: code
  prompt: "Stage all modified files"
  # What if some files were already staged?
```

**Pattern:** Always check current state before modifying.

---

### 5. Provide Good Feedback

**Clear Step Names:**
```yaml
✅ name: run_tests_and_verify_passing
❌ name: step_1
```

**Meaningful Messages:**
```yaml
onComplete:
  ✅ message: "Release workflow complete. PR #123 created successfully."
  ❌ message: "Done"

onError:
  ✅ message: "Workflow failed at security_audit. Review SECURITY @1 items and retry."
  ❌ message: "Error"
```

**Detailed Prompts:**
```yaml
✅ prompt: "Generate commit message following commit-conventions.md. Use hybrid emoji + conventional format. Analyze staged changes to determine appropriate type (feat/fix/docs), scope, and description."

❌ prompt: "Make commit message"
```

---

### 6. Reference Project Standards

**Always Reference Custom Rules:**
```yaml
# For commits
prompt: "Generate commit following commit-conventions.md rule"

# For reviews
prompt: "Code review following code-review.md checklist"

# For memory bank
prompt: "Update .kilocode/rules/memory-bank/context.md"
```

**Why This Matters:**
- Consistency across all workflows
- Quality standards automatically applied
- Changes to rules propagate to all workflows
- No need to duplicate standards in every workflow

---

### 7. Handle Errors Gracefully

**Specify Error Actions:**
```yaml
onError:
  - action: notify
    message: "Workflow failed at {step_name}. Check logs for details."
  - action: export_error_log
    path: "logs/workflow-error-{date}.md"
  - action: rollback
    steps: [step_1, step_2]  # Undo changes from these steps
```

**Provide Recovery Guidance:**
```yaml
onError:
  - action: notify
    message: |
      Pre-commit validation failed at {step_name}.
      
      Next steps:
      1. Review error message above
      2. Fix identified issues
      3. Stage corrected files
      4. Run /pre-commit again
```

---

## Common Patterns

Proven workflow patterns for frequent use cases.

### Pattern 1: Review → Fix → Commit

**Use Case:** Complete feature with quality checks

```yaml
steps:
  # Review phase
  - name: review
    mode: debug
    prompt: "Review for issues following code-review.md"
    
  # Fix phase
  - name: check_critical
    mode: ask
    prompt: "Report critical (@1, @2) issues"
    abortIf: "critical_issues_found"
    
  # Commit phase
  - name: generate_commit
    mode: code
    prompt: "Generate commit following commit-conventions.md"
    
  - name: commit
    mode: code
    prompt: "Commit with generated message"
```

**When to Use:** Feature completion, bug fixes, any PR-bound work

---

### Pattern 2: Analyze → Report → Export

**Use Case:** Generate reports and summaries

```yaml
steps:
  # Analyze phase
  - name: analyze
    mode: ask
    prompt: "Analyze current state [specific criteria]"
    
  # Report phase
  - name: generate_report
    mode: ask
    prompt: "Generate structured report from analysis"
    
  # Export phase
  - name: export
    mode: code
    prompt: "Export report to staging/ directory"
```

**When to Use:** Status reports, audits, briefings, summaries

---

### Pattern 3: Validate → Execute → Verify

**Use Case:** Safe execution of changes

```yaml
steps:
  # Validate phase
  - name: check_preconditions
    mode: ask
    prompt: "Verify all preconditions met"
    abortIf: "preconditions_failed"
    
  # Execute phase
  - name: execute_action
    mode: code
    prompt: "Execute main workflow action"
    
  # Verify phase
  - name: verify_completion
    mode: ask
    prompt: "Verify action completed successfully"
```

**When to Use:** Deployments, releases, critical changes

---

### Pattern 4: Scan → Tag → Track

**Use Case:** Identify and track issues

```yaml
steps:
  # Scan phase
  - name: scan
    mode: debug
    prompt: "Scan for issues following checklist"
    
  # Tag phase
  - name: tag_issues
    mode: debug
    prompt: "Insert review tags for all findings"
    
  # Track phase
  - name: export_and_create_issues
    mode: code
    prompt: "Export to staging and create tracking issues"
```

**When to Use:** Security audits, technical debt reviews, quality checks

---

### Pattern 5: Load → Process → Update

**Use Case:** Context-aware updates

```yaml
steps:
  # Load phase
  - name: load_context
    mode: ask
    prompt: "Read memory bank for current context"
    
  # Process phase
  - name: process_changes
    mode: ask
    prompt: "Process recent work and identify updates needed"
    
  # Update phase
  - name: update_memory_bank
    mode: code
    prompt: "Update memory bank files with new information"
```

**When to Use:** Memory bank updates, session summaries, state tracking

---

## Troubleshooting

### Common Issues and Solutions

#### Issue: Workflow fails at specific step

**Symptoms:**
- Workflow stops mid-execution
- Error message about specific step
- Partial completion

**Diagnosis:**
1. Check step dependencies - does step require output from previous step?
2. Verify mode is appropriate - is `code` mode needed for file changes?
3. Review prompt clarity - is prompt specific and actionable?
4. Check preconditions - are all requirements met?

**Solutions:**
```yaml
# Add explicit dependency
- name: step_2
  dependsOn: step_1
  
# Use correct mode
- mode: code  # Not 'ask' if you need to modify files
  
# Make prompt more specific
prompt: "Update .kilocode/rules/memory-bank/context.md by adding..."  # Not just "update file"

# Add precondition check
preconditions:
  - check: "required_data_exists"
```

---

#### Issue: Workflow doesn't reference custom rules

**Symptoms:**
- Generated commits don't follow commit-conventions.md format
- Reviews don't use standard tags from code-review.md
- Inconsistent quality across workflow runs

**Diagnosis:**
Prompt doesn't explicitly mention rule file name

**Solution:**
Always explicitly reference rule files:
```yaml
# Bad - no rule reference
prompt: "Generate commit message"

# Good - explicit rule reference
prompt: "Generate commit message following commit-conventions.md rule. Use hybrid emoji + conventional format."

# Bad - no rule reference
prompt: "Review code for issues"

# Good - explicit rule reference
prompt: "Code review following code-review.md. Use standard review tags with @priority notation."
```

---

#### Issue: Workflow takes too long

**Symptoms:**
- Workflow hangs or times out
- Long wait between steps
- VSCode becomes unresponsive

**Diagnosis:**
1. Too many synchronous steps with `waitForCompletion: true`
2. Prompts too broad or complex
3. Processing entire codebase unnecessarily

**Solutions:**
```yaml
# Set waitForCompletion: false for non-critical steps
- name: export_report
  waitForCompletion: false  # Don't block on export
  
# Make prompts more specific
prompt: "Scan git changes since last commit"  # Not "scan entire codebase"

# Break into smaller workflows
# Instead of one mega-workflow, create:
# - /quick-review (fast checks)
# - /full-audit (comprehensive)
```

---

#### Issue: Workflow modifies wrong files

**Symptoms:**
- Unexpected file changes
- Modified files outside intended scope
- Incorrect path in updates

**Diagnosis:**
Prompt not specific enough about file paths

**Solution:**
Use explicit absolute paths:
```yaml
# Bad - ambiguous
prompt: "Update context.md"

# Good - explicit path
prompt: "Update .kilocode/rules/memory-bank/context.md in project root"

# Bad - ambiguous
prompt: "Export report to staging"

# Good - explicit path  
prompt: "Export report to vault/staging/review-{date}.md"
```

---

#### Issue: Workflow doesn't abort when it should

**Symptoms:**
- Continues despite critical failures
- Commits code with failing tests
- Doesn't respect abort conditions

**Diagnosis:**
Abort conditions not properly defined or detected

**Solution:**
```yaml
# Define clear abort conditions
- name: run_tests
  mode: code
  prompt: "Run all tests. Report 'TESTS_FAILED' if any test fails, 'TESTS_PASSED' if all pass."
  abortIf: "tests_failed"
  
# Make condition detection explicit in prompt
- name: check_critical
  mode: ask
  prompt: "Check for @1 priority items. Report 'CRITICAL_ITEMS_FOUND' if any exist, 'NO_CRITICAL_ITEMS' if none."
  abortIf: "critical_items_found"
```

---

#### Issue: Can't find workflow command

**Symptoms:**
- `/workflow-name` not recognized
- No autocomplete for workflow
- "Command not found" error

**Diagnosis:**
1. File not in `.kilocode/workflows/` directory
2. File name doesn't match workflow name
3. YAML syntax error preventing load

**Solutions:**
```bash
# Check file location
ls .kilocode/workflows/

# Verify file name matches workflow name
# File: release.yml → Command: /release

# Validate YAML syntax
yamllint .kilocode/workflows/release.yml

# Reload VSCode window
Cmd+Shift+P → "Reload Window"
```

---

## Implementation Roadmap

Recommended order for implementing workflows in your projects.

### Phase 1: Foundation (Week 1)

**Goal:** Get comfortable with workflow basics

**Steps:**
1. Create `.kilocode/workflows/` directory
2. Copy `_TEMPLATE.yml` from this guide
3. Implement **Release Workflow** (simplest, high value)
4. Test with `/release` on feature branch
5. Iterate based on results

**Success Criteria:**
- ✅ Release workflow runs successfully
- ✅ Generates commit following commit-conventions.md
- ✅ Creates PR with description
- ✅ Team understands workflow concept

---

### Phase 2: Quality Integration (Week 2)

**Goal:** Add code review and validation

**Steps:**
1. Implement **Pre-Commit Validation Workflow**
2. Implement **Complete Feature Workflow**
3. Test with feature branches
4. Refine review prompts based on findings

**Success Criteria:**
- ✅ Pre-commit catches issues before commit
- ✅ Complete feature workflow includes review
- ✅ Review tags follow code-review.md standards
- ✅ Critical issues block merge

---

### Phase 3: Context Management (Week 3)

**Goal:** Automate memory bank maintenance

**Steps:**
1. Implement **Memory Bank Update Workflow**
2. Implement **Morning Standup Workflow**
3. Test session end updates
4. Test morning briefing accuracy

**Success Criteria:**
- ✅ Memory bank stays current automatically
- ✅ Morning standup provides useful briefing
- ✅ Context.md reflects actual project state
- ✅ Reduced manual memory bank updates

---

### Phase 4: Advanced Workflows (Week 4+)

**Goal:** Specialized workflows for specific needs

**Steps:**
1. Implement **Security Audit Workflow** (if security-critical project)
2. Implement **Cross-Agent Coordination Workflow** (if multi-agent setup)
3. Create custom workflows for your specific processes
4. Document team-specific workflow patterns

**Success Criteria:**
- ✅ All repetitive processes have workflows
- ✅ Team consistently uses workflows
- ✅ Workflows integrated with custom rules
- ✅ Quality and consistency improved

---

### Maintenance and Evolution

**Monthly:**
- Review workflow usage (which are used, which aren't)
- Collect feedback on pain points
- Refine prompts based on results
- Add new workflows for emerging patterns

**Quarterly:**
- Audit workflow consistency with custom rules
- Update workflows for rule changes
- Archive unused workflows
- Document new workflow patterns discovered

**Annually:**
- Complete workflow system review
- Major refactoring if needed
- Update this guide with lessons learned
- Share successful patterns with community

---

## Next Steps

1. **Create workflows directory:** `mkdir -p .kilocode/workflows`
2. **Copy this README:** Save to `.kilocode/workflows/README.md`
3. **Copy template:** Save workflow template to `_TEMPLATE.yml`
4. **Start with one:** Implement Release Workflow first
5. **Test and iterate:** Run with `/release`, refine, repeat
6. **Expand gradually:** Add workflows as you identify repetitive processes
7. **Document patterns:** Update this guide with your discoveries

---

## Resources

### Internal Documentation
- **Commit Conventions:** `.kilocode/rules/commit-conventions.md`
- **Code Review Guide:** `.kilocode/rules/code-review.md`
- **Memory Bank System:** `.kilocode/rules/memory-bank/`
- **Auto-Launch Config:** `.kilocode/autoLaunch` settings

### External Resources
- **Kilo Code Workflows Docs:** https://kilocode.ai/docs/features/slash-commands/workflows
- **Kilo Code Modes:** https://kilocode.ai/docs/features/modes
- **Custom Rules:** https://kilocode.ai/docs/advanced-usage/custom-rules

---

**Philosophy:** Workflows encode your processes as executable documentation. They capture tribal knowledge, enforce standards, and scale best practices across team and time. The investment in creating workflows pays exponential dividends in consistency, quality, and efficiency.

**Start small, iterate fast, automate everything repetitive.**