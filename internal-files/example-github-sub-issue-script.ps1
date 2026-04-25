# =============================================================================
# Cluster Documentation Rewrite - GitHub Project Setup (PowerShell)
# =============================================================================
# Repository: radioastronomyio/proxmox-astronomy-lab
# Project: Cluster Documentation Rewrite
#
# Prerequisites:
#   gh auth login
#   gh extension install yahsan2/gh-sub-issue
#
# Usage: .\cluster-docs-rewrite-setup.ps1
#
# Author: VintageDon - https://github.com/vintagedon
# License: MIT
# =============================================================================

$ErrorActionPreference = "Continue"

$OWNER = "radioastronomyio"
$REPO = "radioastronomyio/proxmox-astronomy-lab"

Write-Host ""
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host "Cluster Documentation Rewrite - GitHub Project Setup" -ForegroundColor Cyan
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
        Title = "M1: Standards & Structure"
        Description = "Establish documentation standards, folder structure, and migration manifest. Define HITL workflow for AI-assisted documentation."
        DueDate = "2025-01-15T00:00:00Z"
    },
    @{
        Title = "M2: Physical Infrastructure"
        Description = "Document Proxmox nodes (hardware, storage, cluster config) and network infrastructure (VLANs, firewall, DNS/DHCP)."
        DueDate = "2025-01-31T00:00:00Z"
    },
    @{
        Title = "M3: VMs & Services"
        Description = "Design asset sheet templates for VMs and services. Document all VMs and running services with standardized format."
        DueDate = "2025-02-15T00:00:00Z"
    },
    @{
        Title = "M4: Compliance & Integration"
        Description = "Collapse CIS structure to L1 reference. Document MCP servers and monitoring integration."
        DueDate = "2025-02-28T00:00:00Z"
    },
    @{
        Title = "M5: Polish & READMEs"
        Description = "Generate Interior READMEs for all directories. Tag standardization audit. HITL markdown linting and content review."
        DueDate = "2025-03-15T00:00:00Z"
    },
    @{
        Title = "M6: Finalization"
        Description = "Write root README. Navigation verification. Archive old repo. Final HITL sign-off."
        DueDate = "2025-03-31T00:00:00Z"
    }
)

foreach ($ms in $milestones) {
    $result = gh api "repos/$REPO/milestones" --method POST -f title="$($ms.Title)" -f description="$($ms.Description)" -f due_on="$($ms.DueDate)" 2>&1
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

# --- M1 Tasks ---
$body = @"
## Objective
Design flattened folder structure (max depth 3) and create migration manifest mapping old content to new locations.

## Sub-Tasks
- 1.1.1 Design folder hierarchy
- 1.1.2 Create migration manifest (old → new mapping)

## Acceptance Criteria
- [ ] Folder hierarchy documented
- [ ] Migration manifest complete with disposition for each item
- [ ] Human review of structure decisions
"@

$result = gh issue create --repo $REPO --title "Task 1.1: Folder Structure & Migration Manifest" --label "Task" --label "documentation" --milestone "M1: Standards & Structure" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["1.1"] = $Matches[1]; Write-Host "  Created: Task 1.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Document the Responsible AI workflow with Human-in-the-Loop review checkpoints used for this documentation rewrite.

## Sub-Tasks
- 1.2.1 Workflow description and diagram
- 1.2.2 Quality gates and HITL checkpoint definitions

## Acceptance Criteria
- [ ] Workflow documented
- [ ] HITL checkpoints defined
- [ ] Serves as model for future AI-assisted projects
"@

$result = gh issue create --repo $REPO --title "Task 1.2: Document HITL Workflow" --label "Task" --label "documentation" --label "HITL" --milestone "M1: Standards & Structure" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["1.2"] = $Matches[1]; Write-Host "  Created: Task 1.2 (#$($Matches[1]))" -ForegroundColor Green }

# --- M2 Tasks ---
$body = @"
## Objective
Convert legacy Proxmox node documentation to General KB Article format.

## Sub-Tasks
- 2.1.1 Hardware specifications (all nodes)
- 2.1.2 Storage configuration
- 2.1.3 Cluster configuration

## Source
proxmox-astronomy-lab-old/hardware/proxmox-nodes/
proxmox-astronomy-lab-old/infrastructure/proxmox/

## Acceptance Criteria
- [ ] All node specs documented accurately
- [ ] Storage architecture captured
- [ ] Cluster config documented
"@

$result = gh issue create --repo $REPO --title "Task 2.1: Document Proxmox Nodes" --label "Task" --label "documentation" --milestone "M2: Physical Infrastructure" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["2.1"] = $Matches[1]; Write-Host "  Created: Task 2.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Convert legacy network documentation to General KB Article format.

## Sub-Tasks
- 2.2.1 VLAN architecture
- 2.2.2 Firewall configuration
- 2.2.3 DNS/DHCP configuration

## Source
proxmox-astronomy-lab-old/hardware/networking/
proxmox-astronomy-lab-old/infrastructure/dns/
proxmox-astronomy-lab-old/infrastructure/dhcp/

## Acceptance Criteria
- [ ] VLAN topology documented
- [ ] Firewall rules captured
- [ ] DNS/DHCP config documented
"@

$result = gh issue create --repo $REPO --title "Task 2.2: Document Network" --label "Task" --label "documentation" --milestone "M2: Physical Infrastructure" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["2.2"] = $Matches[1]; Write-Host "  Created: Task 2.2 (#$($Matches[1]))" -ForegroundColor Green }

# --- M3 Tasks ---
$body = @"
## Objective
Design standardized asset sheet templates for VMs and services, based on general KB template.

## Sub-Tasks
- 3.1.1 VM asset sheet template
- 3.1.2 Services asset sheet template

## Acceptance Criteria
- [ ] Templates support structured data extraction
- [ ] Consistent with existing documentation standards
- [ ] Ready for bulk VM/service documentation
"@

$result = gh issue create --repo $REPO --title "Task 3.1: Design Asset Sheet Templates" --label "Task" --label "documentation" --milestone "M3: VMs & Services" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["3.1"] = $Matches[1]; Write-Host "  Created: Task 3.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Document all VMs using the standardized asset sheet template.

## Sub-Tasks
- 3.2.1 Infrastructure VMs (DNS, DHCP, file servers)
- 3.2.2 Application VMs (databases, services)
- 3.2.3 Kubernetes worker VMs

## Source
proxmox-astronomy-lab-old/virtual-machines/
proxmox-astronomy-lab-old/applications-and-services/

## Acceptance Criteria
- [ ] All VMs documented with consistent format
- [ ] Specs, volumes, security agents captured
- [ ] L2 CIS template baseline documented
"@

$result = gh issue create --repo $REPO --title "Task 3.2: Document VMs" --label "Task" --label "documentation" --milestone "M3: VMs & Services" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["3.2"] = $Matches[1]; Write-Host "  Created: Task 3.2 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Document all services using the standardized asset sheet template.

## Sub-Tasks
- 3.3.1 Database services (PostgreSQL, MongoDB, Redis)
- 3.3.2 Infrastructure services (Gitea, Portainer, monitoring)
- 3.3.3 AI/ML services (Ollama, n8n, RAG stack)

## Acceptance Criteria
- [ ] All services documented with consistent format
- [ ] Configuration details captured
- [ ] Integration points documented
"@

$result = gh issue create --repo $REPO --title "Task 3.3: Document Services" --label "Task" --label "documentation" --milestone "M3: VMs & Services" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["3.3"] = $Matches[1]; Write-Host "  Created: Task 3.3 (#$($Matches[1]))" -ForegroundColor Green }

# --- M4 Tasks ---
$body = @"
## Objective
Consolidate 18-directory CIS control structure into lightweight L1 reference.

## Sub-Tasks
- 4.1.1 Identify CIS L1 controls in scope
- 4.1.2 Write consolidated reference document

## Context
- Old structure was CISv8 L2+ with full evidence collection
- New baseline is CISv8 L1
- Full compliance implementation is a FUTURE project

## Acceptance Criteria
- [ ] L1 controls identified and listed
- [ ] Single consolidated reference document
- [ ] Old 18-directory structure archived
"@

$result = gh issue create --repo $REPO --title "Task 4.1: Collapse CIS to L1 Reference" --label "Task" --label "documentation" --milestone "M4: Compliance & Integration" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["4.1"] = $Matches[1]; Write-Host "  Created: Task 4.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Document MCP server configurations and monitoring integration.

## Sub-Tasks
- 4.2.1 MCP server configurations
- 4.2.2 Monitoring stack (Prometheus, Grafana, Loki)

## Source
proxmox-astronomy-lab-old/mcp-servers/
proxmox-astronomy-lab-old/monitoring-observability/

## Acceptance Criteria
- [ ] All MCP servers documented
- [ ] Monitoring integration captured
- [ ] Alerting configuration documented
"@

$result = gh issue create --repo $REPO --title "Task 4.2: Document MCP & Monitoring" --label "Task" --label "documentation" --milestone "M4: Compliance & Integration" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["4.2"] = $Matches[1]; Write-Host "  Created: Task 4.2 (#$($Matches[1]))" -ForegroundColor Green }

# --- M5 Tasks ---
$body = @"
## Objective
Generate Interior README files for all populated directories.

## Sub-Tasks
- 5.1.1 Infrastructure directory READMEs
- 5.1.2 VM/Services directory READMEs

## Acceptance Criteria
- [ ] Every directory has README.md
- [ ] File inventory tables complete
- [ ] Child README links working
"@

$result = gh issue create --repo $REPO --title "Task 5.1: Generate Interior READMEs" --label "Task" --label "documentation" --milestone "M5: Polish & READMEs" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["5.1"] = $Matches[1]; Write-Host "  Created: Task 5.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Audit and standardize tags across all documents.

## Sub-Tasks
- 5.2.1 Tag audit pass
- 5.2.2 Fix inconsistencies

## Acceptance Criteria
- [ ] All documents have required tags (type, domain, status)
- [ ] No undefined tag values
- [ ] Tag vocabulary updated if needed
"@

$result = gh issue create --repo $REPO --title "Task 5.2: Tag Standardization" --label "Task" --label "documentation" --milestone "M5: Polish & READMEs" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["5.2"] = $Matches[1]; Write-Host "  Created: Task 5.2 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Human-in-the-Loop review with markdown linting and content validation.

## Sub-Tasks
- 5.3.1 Markdown linting (VSCode markdownlint)
- 5.3.2 Content accuracy review

## HITL Checkpoint
This is a mandatory human review gate.

## Acceptance Criteria
- [ ] All linting errors resolved
- [ ] Content accuracy validated
- [ ] Sign-off on quality
"@

$result = gh issue create --repo $REPO --title "Task 5.3: HITL Review" --label "Task" --label "documentation" --label "HITL" --milestone "M5: Polish & READMEs" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["5.3"] = $Matches[1]; Write-Host "  Created: Task 5.3 (#$($Matches[1]))" -ForegroundColor Green }

# --- M6 Tasks ---
$body = @"
## Objective
Create repository root README as primary entry point.

## Sub-Tasks
- 6.1.1 Draft root README
- 6.1.2 Navigation verification

## Acceptance Criteria
- [ ] Clear project description
- [ ] Repository structure overview
- [ ] All internal links valid
"@

$result = gh issue create --repo $REPO --title "Task 6.1: Root README" --label "Task" --label "documentation" --milestone "M6: Finalization" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["6.1"] = $Matches[1]; Write-Host "  Created: Task 6.1 (#$($Matches[1]))" -ForegroundColor Green }

$body = @"
## Objective
Archive old repo and complete final sign-off.

## Sub-Tasks
- 6.2.1 Archive old repo
- 6.2.2 Final HITL sign-off

## Acceptance Criteria
- [ ] Old content archived or removed
- [ ] Final review complete
- [ ] Project marked complete
"@

$result = gh issue create --repo $REPO --title "Task 6.2: Archive & Sign-off" --label "Task" --label "documentation" --label "HITL" --milestone "M6: Finalization" --body $body 2>&1
if ($result -match "/issues/(\d+)") { $issueNumbers["6.2"] = $Matches[1]; Write-Host "  Created: Task 6.2 (#$($Matches[1]))" -ForegroundColor Green }

Write-Host ""
Write-Host "Task issue numbers:" -ForegroundColor Cyan
$issueNumbers.GetEnumerator() | Sort-Object Name | ForEach-Object { Write-Host "  $($_.Name): #$($_.Value)" }

# =============================================================================
# SECTION 4: CREATE SUB-TASKS
# =============================================================================
Write-Host ""
Write-Host "Creating sub-tasks..." -ForegroundColor Yellow

$subTasks = @(
    # M1 Sub-Tasks
    @{ Parent = "1.1"; Id = "1.1.1"; Title = "Sub-Task 1.1.1: Design folder hierarchy"; Milestone = "M1: Standards & Structure" },
    @{ Parent = "1.1"; Id = "1.1.2"; Title = "Sub-Task 1.1.2: Create migration manifest"; Milestone = "M1: Standards & Structure" },
    @{ Parent = "1.2"; Id = "1.2.1"; Title = "Sub-Task 1.2.1: Workflow description and diagram"; Milestone = "M1: Standards & Structure" },
    @{ Parent = "1.2"; Id = "1.2.2"; Title = "Sub-Task 1.2.2: Quality gates and HITL checkpoints"; Milestone = "M1: Standards & Structure" },
    
    # M2 Sub-Tasks
    @{ Parent = "2.1"; Id = "2.1.1"; Title = "Sub-Task 2.1.1: Hardware specifications"; Milestone = "M2: Physical Infrastructure" },
    @{ Parent = "2.1"; Id = "2.1.2"; Title = "Sub-Task 2.1.2: Storage configuration"; Milestone = "M2: Physical Infrastructure" },
    @{ Parent = "2.1"; Id = "2.1.3"; Title = "Sub-Task 2.1.3: Cluster configuration"; Milestone = "M2: Physical Infrastructure" },
    @{ Parent = "2.2"; Id = "2.2.1"; Title = "Sub-Task 2.2.1: VLAN architecture"; Milestone = "M2: Physical Infrastructure" },
    @{ Parent = "2.2"; Id = "2.2.2"; Title = "Sub-Task 2.2.2: Firewall configuration"; Milestone = "M2: Physical Infrastructure" },
    @{ Parent = "2.2"; Id = "2.2.3"; Title = "Sub-Task 2.2.3: DNS/DHCP configuration"; Milestone = "M2: Physical Infrastructure" },
    
    # M3 Sub-Tasks
    @{ Parent = "3.1"; Id = "3.1.1"; Title = "Sub-Task 3.1.1: VM asset sheet template"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.1"; Id = "3.1.2"; Title = "Sub-Task 3.1.2: Services asset sheet template"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.2"; Id = "3.2.1"; Title = "Sub-Task 3.2.1: Infrastructure VMs"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.2"; Id = "3.2.2"; Title = "Sub-Task 3.2.2: Application VMs"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.2"; Id = "3.2.3"; Title = "Sub-Task 3.2.3: Kubernetes worker VMs"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.3"; Id = "3.3.1"; Title = "Sub-Task 3.3.1: Database services"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.3"; Id = "3.3.2"; Title = "Sub-Task 3.3.2: Infrastructure services"; Milestone = "M3: VMs & Services" },
    @{ Parent = "3.3"; Id = "3.3.3"; Title = "Sub-Task 3.3.3: AI/ML services"; Milestone = "M3: VMs & Services" },
    
    # M4 Sub-Tasks
    @{ Parent = "4.1"; Id = "4.1.1"; Title = "Sub-Task 4.1.1: Identify CIS L1 controls"; Milestone = "M4: Compliance & Integration" },
    @{ Parent = "4.1"; Id = "4.1.2"; Title = "Sub-Task 4.1.2: Write consolidated reference"; Milestone = "M4: Compliance & Integration" },
    @{ Parent = "4.2"; Id = "4.2.1"; Title = "Sub-Task 4.2.1: MCP server configurations"; Milestone = "M4: Compliance & Integration" },
    @{ Parent = "4.2"; Id = "4.2.2"; Title = "Sub-Task 4.2.2: Monitoring stack documentation"; Milestone = "M4: Compliance & Integration" },
    
    # M5 Sub-Tasks
    @{ Parent = "5.1"; Id = "5.1.1"; Title = "Sub-Task 5.1.1: Infrastructure directory READMEs"; Milestone = "M5: Polish & READMEs" },
    @{ Parent = "5.1"; Id = "5.1.2"; Title = "Sub-Task 5.1.2: VM/Services directory READMEs"; Milestone = "M5: Polish & READMEs" },
    @{ Parent = "5.2"; Id = "5.2.1"; Title = "Sub-Task 5.2.1: Tag audit pass"; Milestone = "M5: Polish & READMEs" },
    @{ Parent = "5.2"; Id = "5.2.2"; Title = "Sub-Task 5.2.2: Fix tag inconsistencies"; Milestone = "M5: Polish & READMEs" },
    @{ Parent = "5.3"; Id = "5.3.1"; Title = "Sub-Task 5.3.1: Markdown linting"; Milestone = "M5: Polish & READMEs" },
    @{ Parent = "5.3"; Id = "5.3.2"; Title = "Sub-Task 5.3.2: Content accuracy review"; Milestone = "M5: Polish & READMEs" },
    
    # M6 Sub-Tasks
    @{ Parent = "6.1"; Id = "6.1.1"; Title = "Sub-Task 6.1.1: Draft root README"; Milestone = "M6: Finalization" },
    @{ Parent = "6.1"; Id = "6.1.2"; Title = "Sub-Task 6.1.2: Navigation verification"; Milestone = "M6: Finalization" },
    @{ Parent = "6.2"; Id = "6.2.1"; Title = "Sub-Task 6.2.1: Archive old repo"; Milestone = "M6: Finalization" },
    @{ Parent = "6.2"; Id = "6.2.2"; Title = "Sub-Task 6.2.2: Final HITL sign-off"; Milestone = "M6: Finalization" }
)

$subTaskNumbers = @{}

foreach ($st in $subTasks) {
    $body = "Parent: Task $($st.Parent)"
    $result = gh issue create --repo $REPO --title $st.Title --label "Sub-Task" --label "documentation" --milestone $st.Milestone --body $body 2>&1
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
    @{ Parent = "1.1"; Children = @("1.1.1", "1.1.2") },
    @{ Parent = "1.2"; Children = @("1.2.1", "1.2.2") },
    @{ Parent = "2.1"; Children = @("2.1.1", "2.1.2", "2.1.3") },
    @{ Parent = "2.2"; Children = @("2.2.1", "2.2.2", "2.2.3") },
    @{ Parent = "3.1"; Children = @("3.1.1", "3.1.2") },
    @{ Parent = "3.2"; Children = @("3.2.1", "3.2.2", "3.2.3") },
    @{ Parent = "3.3"; Children = @("3.3.1", "3.3.2", "3.3.3") },
    @{ Parent = "4.1"; Children = @("4.1.1", "4.1.2") },
    @{ Parent = "4.2"; Children = @("4.2.1", "4.2.2") },
    @{ Parent = "5.1"; Children = @("5.1.1", "5.1.2") },
    @{ Parent = "5.2"; Children = @("5.2.1", "5.2.2") },
    @{ Parent = "5.3"; Children = @("5.3.1", "5.3.2") },
    @{ Parent = "6.1"; Children = @("6.1.1", "6.1.2") },
    @{ Parent = "6.2"; Children = @("6.2.1", "6.2.2") }
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
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Open GitHub Projects and verify Kanban view"
Write-Host "  2. Add issues to project board if not auto-added"
Write-Host "  3. Adjust assignees as needed"
Write-Host "  4. Begin M1 work"
Write-Host ""