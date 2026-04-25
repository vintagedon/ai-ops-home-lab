# GitHub Project Setup Methodology

**Purpose:** Programmatically create GitHub Issues with milestones, labels, task hierarchies, and sub-issue relationships using `gh` CLI and extensions.

**Last Updated:** 2025-01-01  
**Validated With:** Cluster Documentation Rewrite project

---

## Table of Contents

1. [Concepts](#concepts)
2. [Prerequisites](#prerequisites)
3. [Workflow Sequence](#workflow-sequence)
4. [Numbering Convention](#numbering-convention)
5. [Script Reference](#script-reference)
6. [Example Output](#example-output)
7. [PowerShell Gotchas](#powershell-gotchas)
8. [Extension Reference](#extension-reference)
9. [Future Considerations](#future-considerations)

---

## Concepts

### Why This Structure?

GitHub Projects Kanban view has a visual organization problem:
- **Milestones** are invisible in Kanban (just a filter option)
- **Tasks without sub-tasks** appear as a flat, undifferentiated list
- **Tasks WITH sub-tasks** show progress bars, providing visual grouping

The solution: Create parent Tasks with linked Sub-Tasks. This gives you:
- Progress bars on Task cards (0/3, 0/5, etc.)
- Visual hierarchy even when everything is in one column
- Assignable work units at the Sub-Task level

### Hierarchy

```
Milestone          = Phase container (invisible in Kanban, used for filtering)
├── Task           = Parent issue (shows progress bar from sub-tasks)
│   ├── Sub-Task   = Child issue (actual delegatable work unit)
│   ├── Sub-Task
│   └── Sub-Task
└── Task
    └── ...
```

### Work Unit Sizing

Sub-Tasks should be **session-sized**: one evening of work, completable by one person independently.

This enables:
- Delegation to team members
- Parallel work (sub-tasks don't block each other)
- Clear PR scope (one PR per sub-task)

---

## Prerequisites

```powershell
# GitHub CLI
winget install GitHub.cli
gh auth login

# Sub-issue extension (required for parent-child linking)
gh extension install yahsan2/gh-sub-issue
```

Verify installation:
```powershell
gh --version
gh sub-issue --help
```

---

## Workflow Sequence

```
1. Labels  →  2. Milestones  →  3. Tasks (Parents)  →  4. Sub-Tasks  →  5. Link Sub-Tasks
```

Each step must complete before the next begins. Issue numbers are assigned sequentially by GitHub.

**Critical:** There is no `gh milestone` command. Use `gh api` for milestone creation.

---

## Numbering Convention

Titles include structured numbering for Kanban readability:

```
{Milestone}.{Task}.{SubTask}

Examples:
- Task 2.1: Document Proxmox Nodes
- Sub-Task 2.1.3: Cluster configuration
```

This tells you at a glance:
- `2` = Milestone 2
- `2.1` = First task in Milestone 2
- `2.1.3` = Third sub-task of Task 2.1

---

## Script Reference

### Complete Working Script

```powershell
# =============================================================================
# GitHub Project Setup Script Template (PowerShell)
# =============================================================================
# Prerequisites:
#   gh auth login
#   gh extension install yahsan2/gh-sub-issue
#
# Usage: .\project-setup.ps1
# =============================================================================

$ErrorActionPreference = "Continue"

$OWNER = "your-org"
$REPO = "your-org/your-repo"

Write-Host ""
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host "Project Setup - GitHub Issues" -ForegroundColor Cyan
Write-Host "Repository: $REPO" -ForegroundColor Cyan
Write-Host "==============================================================================" -ForegroundColor Cyan

# =============================================================================
# SECTION 1: CREATE LABELS
# =============================================================================
Write-Host ""
Write-Host "Creating labels..." -ForegroundColor Yellow

$labels = @(
    @{ Name = "Task"; Color = "7057ff"; Description = "Parent work item with sub-tasks" },
    @{ Name = "Sub-Task"; Color = "c5def5"; Description = "Child work item" },
    @{ Name = "documentation"; Color = "0075ca"; Description = "Documentation work" },
    @{ Name = "HITL"; Color = "fbca04"; Description = "Human-in-the-loop review required" },
    @{ Name = "blocked"; Color = "d73a4a"; Description = "Has unresolved blockers" }
)

foreach ($label in $labels) {
    gh label create $label.Name --color $label.Color --description $label.Description --repo $REPO 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Created: $($label.Name)" -ForegroundColor Green
    } else {
        Write-Host "  Exists: $($label.Name)" -ForegroundColor DarkGray
    }
}

# =============================================================================
# SECTION 2: CREATE MILESTONES
# =============================================================================
Write-Host ""
Write-Host "Creating milestones..." -ForegroundColor Yellow

$milestones = @(
    @{
        Title = "M1: Phase Name"
        Description = "Description of this phase and what it contains."
        DueDate = "2025-01-15T00:00:00Z"
    },
    @{
        Title = "M2: Another Phase"
        Description = "Description of phase 2."
        DueDate = "2025-01-31T00:00:00Z"
    }
)

foreach ($ms in $milestones) {
    $result = gh api "repos/$REPO/milestones" --method POST `
        -f title="$($ms.Title)" `
        -f description="$($ms.Description)" `
        -f due_on="$($ms.DueDate)" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Created: $($ms.Title)" -ForegroundColor Green
    } else {
        Write-Host "  Exists or error: $($ms.Title)" -ForegroundColor DarkGray
    }
}

# =============================================================================
# SECTION 3: CREATE TASKS (Parent Issues)
# =============================================================================
Write-Host ""
Write-Host "Creating tasks..." -ForegroundColor Yellow

# Store issue numbers as they're created
$issueNumbers = @{}

# Example task creation
$body = @"
## Objective
Brief description of what this task accomplishes.

## Sub-Tasks
- 1.1.1 First sub-task description
- 1.1.2 Second sub-task description

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
"@

$result = gh issue create --repo $REPO `
    --title "Task 1.1: Task Name" `
    --label "Task" --label "documentation" `
    --milestone "M1: Phase Name" `
    --body $body 2>&1

if ($result -match "/issues/(\d+)") {
    $issueNumbers["1.1"] = $Matches[1]
    Write-Host "  Created: Task 1.1 (#$($Matches[1]))" -ForegroundColor Green
}

# =============================================================================
# SECTION 4: CREATE SUB-TASKS
# =============================================================================
Write-Host ""
Write-Host "Creating sub-tasks..." -ForegroundColor Yellow

$subTasks = @(
    @{ Parent = "1.1"; Id = "1.1.1"; Title = "Sub-Task 1.1.1: First sub-task"; Milestone = "M1: Phase Name" },
    @{ Parent = "1.1"; Id = "1.1.2"; Title = "Sub-Task 1.1.2: Second sub-task"; Milestone = "M1: Phase Name" }
)

$subTaskNumbers = @{}

foreach ($st in $subTasks) {
    $body = "Parent: Task $($st.Parent)"
    $result = gh issue create --repo $REPO `
        --title $st.Title `
        --label "Sub-Task" --label "documentation" `
        --milestone $st.Milestone `
        --body $body 2>&1
    
    if ($result -match "/issues/(\d+)") {
        $subTaskNumbers[$st.Id] = $Matches[1]
        Write-Host "  Created: $($st.Id) (#$($Matches[1]))" -ForegroundColor Green
    } else {
        Write-Host "  Failed: $($st.Title)" -ForegroundColor Red
    }
}

# =============================================================================
# SECTION 5: LINK SUB-TASKS TO PARENTS
# =============================================================================
Write-Host ""
Write-Host "Linking sub-tasks to parent tasks..." -ForegroundColor Yellow

$linkages = @(
    @{ Parent = "1.1"; Children = @("1.1.1", "1.1.2") }
)

$successCount = 0
$failCount = 0

foreach ($link in $linkages) {
    $parentNum = $issueNumbers[$link.Parent]
    if (-not $parentNum) {
        Write-Host "  Parent $($link.Parent) not found, skipping" -ForegroundColor Red
        continue
    }
    
    Write-Host "  Linking to Task $($link.Parent) (#$parentNum):" -ForegroundColor Cyan
    
    foreach ($childId in $link.Children) {
        $childNum = $subTaskNumbers[$childId]
        if (-not $childNum) {
            Write-Host "    $childId - not found" -ForegroundColor Red
            $failCount++
            continue
        }
        
        $result = gh sub-issue add $parentNum $childNum --repo $REPO 2>&1
        
        if ($result -match "duplicate" -or $result -match "already" -or $result -match "one parent") {
            Write-Host "    $childId (#$childNum) - already linked" -ForegroundColor DarkGray
            $successCount++
        } elseif ($result -match "Linking issues" -or $LASTEXITCODE -eq 0) {
            Write-Host "    $childId (#$childNum) - linked" -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "    $childId (#$childNum) - FAILED" -ForegroundColor Red
            $failCount++
        }
    }
}

# =============================================================================
# SUMMARY
# =============================================================================
Write-Host ""
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Summary:" -ForegroundColor Yellow
Write-Host "  Milestones: $($milestones.Count)"
Write-Host "  Tasks: $($issueNumbers.Count)"
Write-Host "  Sub-Tasks: $($subTaskNumbers.Count)"
Write-Host "  Links successful: $successCount"
Write-Host "  Links failed: $failCount"
Write-Host ""
```

---

## Example Output

Truncated log showing each script behavior:

```
==============================================================================
Cluster Documentation Rewrite - GitHub Project Setup
Repository: radioastronomyio/proxmox-astronomy-lab
==============================================================================

Creating labels...
  Created: Task                          # New label created
  Exists: documentation                  # Label already existed (skipped)

Creating milestones...
  Created: M1: Standards & Structure     # Milestone created via gh api

Creating tasks...
  Created: Task 1.1 (#6)                 # Parent issue created, number captured
  Created: Task 2.1 (#8)

Task issue numbers:
  1.1: #6                                # Mapping stored for linking phase
  2.1: #8

Creating sub-tasks...
  Created: 1.1.1 (#20)                   # Sub-task created
  Created: 1.1.2 (#21)

Linking sub-tasks to parent tasks...
  Linking to Task 1.1 (#6):
    1.1.1 (#20) - linked                 # Successfully linked
    1.1.2 (#21) - linked

==============================================================================
Setup Complete!
==============================================================================

Summary:
  Milestones: 6
  Tasks: 14
  Sub-Tasks: 32
  Links successful: 32
  Links failed: 0
```

---

## PowerShell Gotchas

| Bash | PowerShell |
|------|------------|
| `cmd \|\| exit 1` | `if ($LASTEXITCODE -ne 0) { exit 1 }` |
| `2>/dev/null` | `2>$null` |
| `<<EOF ... EOF` | `@" ... "@` (here-string) |
| Line continuation `\` | Backtick `` ` `` |
| `[ordered]@{ 1 = "a" }` | Use `@( @{...}, @{...} )` array instead |

**Critical:** Do NOT use `[ordered]@{}` with integer keys for iteration. PowerShell handles this poorly. Use arrays of hashtables instead.

**stderr handling:** PowerShell treats ANY stderr output as an error (shows red). The `gh` CLI and extensions write status messages to stderr even on success. Check `$LASTEXITCODE` or parse output, don't rely on color.

---

## Extension Reference

```powershell
# Link existing issue as sub-issue
gh sub-issue add <parent> <child> --repo owner/repo

# Create new sub-issue directly (alternative to creating then linking)
gh sub-issue create --parent 123 --title "New sub-task" --repo owner/repo

# List sub-issues of a parent
gh sub-issue list 123 --repo owner/repo

# Remove sub-issue relationship (doesn't delete the issue)
gh sub-issue remove 123 456 --repo owner/repo
```

---

## Future Considerations

**Noted but not yet implemented:**

- **Team onboarding:** Documentation for contributors on branching, committing, PRs
- **Documentation workspace:** Google Drive shared folder with templates
- **Agent integration:** Bots/agents checking out work, tagging commits, linking PRs
- **PR workflow:** One PR per sub-task, review/lint/merge cycle

The structure supports these future capabilities:
- Sub-tasks are assignable delegation units
- Numbering convention enables audit trail
- PR → Issue → Milestone traceability is built-in

---

## Typical Project Structure

```
Milestone 2: Physical Infrastructure
├── Task 2.1: Document Proxmox Nodes       (#8)   [0/3 progress bar]
│   ├── Sub-Task 2.1.1: Hardware specs     (#24)
│   ├── Sub-Task 2.1.2: Storage config     (#25)
│   └── Sub-Task 2.1.3: Cluster config     (#26)
├── Task 2.2: Document Network             (#9)   [0/3 progress bar]
│   ├── Sub-Task 2.2.1: VLAN architecture  (#27)
│   ├── Sub-Task 2.2.2: Firewall config    (#28)
│   └── Sub-Task 2.2.3: DNS/DHCP           (#29)
```

**Labels:**
- `Task` — Parent issues
- `Sub-Task` — Child issues
- `HITL` — Human review required
- `blocked` — Has dependencies
- `documentation` — Documentation work

---

*Generated from Cluster Documentation Rewrite project setup, 2025-01-01*
