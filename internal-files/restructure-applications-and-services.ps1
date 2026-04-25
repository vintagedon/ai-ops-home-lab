<#
.SYNOPSIS
    Restructures applications-and-services/ to flat Diataxis-aligned service directories.

.DESCRIPTION
    Deletes the old three-tier taxonomy (ai-service-providers, cloud-service-providers,
    on-prem-services) and replaces with flat service directories. Each service gets a
    README.md with proper frontmatter. Cloud/identity providers become KB articles.
    Preserves existing docker-compose.yml and .env.example files.

.NOTES
    Repository  : proxmox-astronomy-lab
    Author      : VintageDon (https://github.com/vintagedon)
    Created     : 2026-03-22
#>

$RepoRoot = "D:\development-repositories\proxmox-astronomy-lab\proxmox-astronomy-lab"
$AppSvcRoot = "$RepoRoot\applications-and-services"
$Today = "2026-03-22"

# =============================================================================
# Step 1: Preserve existing files before restructure
# =============================================================================

Write-Host "=== Step 1: Preserving existing files ===" -ForegroundColor Cyan

$preserveFiles = @()
Get-ChildItem -Path $AppSvcRoot -Recurse -File | Where-Object {
    $_.Name -in @("docker-compose.yml", ".env.example", "docker-compose.yaml")
} | ForEach-Object {
    $relativePath = $_.FullName.Replace($AppSvcRoot, "").TrimStart("\")
    $preserveFiles += @{
        Source = $_.FullName
        RelPath = $relativePath
        Content = Get-Content $_.FullName -Raw
        ServiceHint = ($relativePath -split "\\")[($relativePath -split "\\").Count - 2]
    }
    Write-Host "  Preserved: $relativePath" -ForegroundColor DarkGray
}

# =============================================================================
# Step 2: Remove old structure
# =============================================================================

Write-Host "`n=== Step 2: Removing old taxonomy ===" -ForegroundColor Cyan

$oldDirs = @(
    "$AppSvcRoot\ai-service-providers",
    "$AppSvcRoot\cloud-service-providers",
    "$AppSvcRoot\on-prem-services"
)

foreach ($dir in $oldDirs) {
    if (Test-Path $dir) {
        Remove-Item $dir -Recurse -Force
        Write-Host "  Removed: $($dir.Replace($RepoRoot, ''))" -ForegroundColor Yellow
    }
}

$oldPending = "$AppSvcRoot\README-pending.md"
if (Test-Path $oldPending) {
    Remove-Item $oldPending -Force
    Write-Host "  Removed: README-pending.md" -ForegroundColor Yellow
}

# =============================================================================
# Step 3: Define service inventory
# =============================================================================

$services = @(
    @{
        Name = "PostgreSQL"; Dir = "postgresql"
        Desc = "Relational database engine for research data and application workloads"
        Status = "Active"; Domains = @("databases"); Techs = @("postgresql", "pgvector")
        Instances = @("pgsql01 - Research data [pgvector, DESI, 8 vCPU/32G]", "pgsql02 - Application workloads [Gitea, local apps, 4 vCPU/16G]")
    },
    @{
        Name = "Neo4j"; Dir = "neo4j"
        Desc = "Graph database for relationship-heavy astronomical data"
        Status = "Active"; Domains = @("databases"); Techs = @("neo4j")
        Instances = @("neo4j01 - Graph database [6 vCPU/24G]")
    },
    @{
        Name = "DragonflyDB"; Dir = "dragonflydb"
        Desc = "Redis-compatible in-memory data store"
        Status = "Active"; Domains = @("databases"); Techs = @("dragonflydb")
        Instances = @()
    },
    @{
        Name = "Prometheus"; Dir = "prometheus"
        Desc = "Metrics collection and time-series database"
        Status = "Active"; Domains = @("monitoring"); Techs = @("prometheus")
        Instances = @("radio-mon01 - Centralized metrics [node05]")
    },
    @{
        Name = "Grafana"; Dir = "grafana"
        Desc = "Visualization and dashboarding for metrics and logs"
        Status = "Active"; Domains = @("monitoring"); Techs = @("grafana")
        Instances = @("radio-mon01 - Centralized dashboards [node05]")
    },
    @{
        Name = "Loki"; Dir = "loki"
        Desc = "Log aggregation and querying"
        Status = "Active"; Domains = @("monitoring"); Techs = @("loki")
        Instances = @("radio-mon01 - Centralized logging [node05]")
    },
    @{
        Name = "Alertmanager"; Dir = "alertmanager"
        Desc = "Alert routing, grouping, and notification"
        Status = "Active"; Domains = @("monitoring"); Techs = @("alertmanager")
        Instances = @("radio-mon01 - Alert routing [node05]")
    },
    @{
        Name = "Wazuh"; Dir = "wazuh"
        Desc = "SIEM, EDR, and security compliance monitoring"
        Status = "Active"; Domains = @("security"); Techs = @("wazuh")
        Instances = @()
    },
    @{
        Name = "Active Directory"; Dir = "active-directory"
        Desc = "Windows AD domain services, secondary to Google Workspace"
        Status = "Active"; Domains = @("identity", "security"); Techs = @("active-directory")
        Instances = @("radio-dc01 - Primary DC", "radio-dc02 - Secondary DC")
    },
    @{
        Name = "Docker"; Dir = "docker"
        Desc = "Container runtime hosting multiple services"
        Status = "Active"; Domains = @("infrastructure"); Techs = @("docker")
        Instances = @("docker01 - Primary container host", "docker02 - Secondary container host")
    },
    @{
        Name = "Proxmox"; Dir = "proxmox"
        Desc = "Hypervisor platform managing cluster virtualization"
        Status = "Active"; Domains = @("infrastructure"); Techs = @("proxmox")
        Instances = @("6 active nodes [node01-node06]")
    },
    @{
        Name = "Nginx Proxy Manager"; Dir = "nginx-proxy-manager"
        Desc = "Reverse proxy and SSL termination"
        Status = "Active"; Domains = @("networking"); Techs = @("nginx-proxy-manager")
        Instances = @()
    },
    @{
        Name = "Netbird"; Dir = "netbird"
        Desc = "Zero-trust network access for remote connectivity"
        Status = "Active"; Domains = @("networking", "security"); Techs = @("netbird")
        Instances = @()
    },
    @{
        Name = "Ollama"; Dir = "ollama"
        Desc = "Local LLM inference server on ML01"
        Status = "Active"; Domains = @("ai-ml", "agents"); Techs = @("ollama")
        Instances = @("ML01 - Bare metal [5950X/128G/A4000]")
    },
    @{
        Name = "Open WebUI"; Dir = "openwebui"
        Desc = "Web interface for Ollama and local LLM interaction"
        Status = "Active"; Domains = @("ai-ml"); Techs = @("openwebui")
        Instances = @()
    },
    @{
        Name = "Kasm Workspaces"; Dir = "kasm-workspaces"
        Desc = "Browser-based VDI and containerized desktop access"
        Status = "Active"; Domains = @("applications"); Techs = @("kasm-workspaces")
        Instances = @()
    },
    @{
        Name = "pgAdmin 4"; Dir = "pgadmin4"
        Desc = "Web-based PostgreSQL administration interface"
        Status = "Active"; Domains = @("databases"); Techs = @("pgadmin4")
        Instances = @()
    },
    @{
        Name = "Gitea"; Dir = "gitea"
        Desc = "Self-hosted Git server, planned for repo01 on node04"
        Status = "Planned"; Domains = @("applications", "automation"); Techs = @("gitea")
        Instances = @("repo01 - Planned [node04]")
    },
    @{
        Name = "Semaphore"; Dir = "semaphore"
        Desc = "Ansible UI and task runner, planned for auto01 on node04"
        Status = "Planned"; Domains = @("automation"); Techs = @("semaphore", "ansible")
        Instances = @("auto01 - Planned [node04]")
    },
    @{
        Name = "n8n"; Dir = "n8n"
        Desc = "Workflow automation platform, planned for auto01 on node04"
        Status = "Planned"; Domains = @("automation"); Techs = @("n8n")
        Instances = @("auto01 - Planned [node04]")
    },
    @{
        Name = "Windmill"; Dir = "windmill"
        Desc = "Developer-focused workflow and script automation, planned for auto01"
        Status = "Planned"; Domains = @("automation"); Techs = @("windmill")
        Instances = @("auto01 - Planned [node04]")
    },
    @{
        Name = "MongoDB"; Dir = "mongodb"
        Desc = "Document database"
        Status = "Unknown"; Domains = @("databases"); Techs = @("mongodb")
        Instances = @()
    },
    @{
        Name = "MSSQL"; Dir = "mssql"
        Desc = "Microsoft SQL Server"
        Status = "Unknown"; Domains = @("databases"); Techs = @("mssql")
        Instances = @()
    },
    @{
        Name = "RabbitMQ"; Dir = "rabbitmq"
        Desc = "Message broker"
        Status = "Unknown"; Domains = @("applications"); Techs = @("rabbitmq")
        Instances = @()
    },
    @{
        Name = "Redis Commander"; Dir = "redis-commander"
        Desc = "Web-based Redis management UI"
        Status = "Unknown"; Domains = @("databases"); Techs = @("redis-commander")
        Instances = @()
    },
    @{
        Name = "LLM Studio"; Dir = "llmstudio"
        Desc = "Local LLM experimentation interface"
        Status = "Unknown"; Domains = @("ai-ml"); Techs = @("llmstudio")
        Instances = @()
    },
    @{
        Name = "NetBox"; Dir = "netbox"
        Desc = "IP address management and data center infrastructure management"
        Status = "Active"; Domains = @("networking", "infrastructure"); Techs = @("netbox")
        Instances = @()
    }
)

$cloudProviders = @(
    @{ Name = "Google Workspace Enterprise"; File = "google-workspace-enterprise.md"; Desc = "Primary IdP, SSO, DLP, Chrome Enterprise, Gemini integration"; Domains = @("identity") },
    @{ Name = "Microsoft Azure"; File = "microsoft-azure.md"; Desc = "Security backbone - Business Premium, Intune Suite, Static Web Apps, CosmoDB, SharePoint"; Domains = @("identity", "security") },
    @{ Name = "AWS"; File = "aws.md"; Desc = "Greenfield expansion, IAM Identity Center with SSO from Google"; Domains = @("identity") },
    @{ Name = "Atlassian"; File = "atlassian.md"; Desc = "Jira and Confluence Standard via OSS sponsorship"; Domains = @("applications") }
)

# =============================================================================
# Step 4: Create service directories and READMEs
# =============================================================================

Write-Host "`n=== Step 3: Creating service directories ===" -ForegroundColor Cyan

foreach ($svc in $services) {
    $svcPath = "$AppSvcRoot\$($svc.Dir)"

    if (-not (Test-Path $svcPath)) {
        New-Item -ItemType Directory -Path $svcPath -Force | Out-Null
    }

    $domainStr = ($svc.Domains -join ", ")
    $techStr = ($svc.Techs -join ", ")

    $fmStatus = switch ($svc.Status) {
        "Active"  { "Active" }
        "Planned" { "Stub" }
        "Unknown" { "Stub" }
        default   { "Stub" }
    }

    $instanceSection = ""
    if ($svc.Instances.Count -gt 0) {
        $instanceLines = @()
        foreach ($inst in $svc.Instances) {
            $parts = $inst -split " - ", 2
            $instanceLines += "| ``$($parts[0])`` | $($parts[1]) |"
        }
        $instanceSection = @"

### Instances

| Instance | Description |
|----------|-------------|
$($instanceLines -join "`n")
"@
    }

    $reviewFlag = ""
    if ($svc.Status -eq "Unknown") {
        $reviewFlag = @"

<!-- REVIEW REQUIRED: Status unknown - confirm whether this service is still deployed. Delete directory if decommissioned. -->
"@
    }

    $readmeContent = @"
<!--
---
title: "$($svc.Name)"
description: "$($svc.Desc)"
author: "VintageDon"
date: "$Today"
version: "1.0"
status: "$fmStatus"
tags:
  - type: directory-readme
  - domain: [$domainStr]
  - tech: [$techStr]
related_documents:
  - "[Applications and Services](../README.md)"
---
-->

# $($svc.Name)
$reviewFlag
$($svc.Desc).

<!-- STUB: Populate with service overview, configuration philosophy, architecture decisions, and links to instance asset sheets and runbooks. -->

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| ``README.md`` | This file |
$instanceSection
---

## 2. Structure

``````
$($svc.Dir)/
+-- README.md
``````

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Applications and Services](../README.md) | Parent directory |
"@

    Set-Content -Path "$svcPath\README.md" -Value $readmeContent -Encoding UTF8
    $color = switch ($svc.Status) { "Active" { "Green" } "Planned" { "DarkYellow" } "Unknown" { "Red" } }
    Write-Host "  Created: $($svc.Dir)/README.md ($($svc.Status))" -ForegroundColor $color
}

# =============================================================================
# Step 5: Create identity-and-cloud directory with KB articles
# =============================================================================

Write-Host "`n=== Step 4: Creating identity-and-cloud KB articles ===" -ForegroundColor Cyan

$cloudPath = "$AppSvcRoot\identity-and-cloud"
if (-not (Test-Path $cloudPath)) {
    New-Item -ItemType Directory -Path $cloudPath -Force | Out-Null
}

foreach ($cp in $cloudProviders) {
    $domainStr = ($cp.Domains -join ", ")

    $kbContent = @"
<!--
---
title: "$($cp.Name)"
description: "$($cp.Desc)"
author: "VintageDon"
date: "$Today"
version: "1.0"
status: "Stub"
tags:
  - type: kb-article
  - domain: [$domainStr]
related_documents:
  - "[Identity and Cloud](README.md)"
  - "[Applications and Services](../README.md)"
---
-->

# $($cp.Name)

$($cp.Desc).

<!-- STUB: Document what services we use, how they integrate with our identity architecture, and key configuration decisions. -->

---

## 1. Purpose

<!-- What role this provider plays in our infrastructure -->

---

## 2. Services Used

<!-- Table of specific services/features and their function -->

---

## N. References

| Resource | Description |
|----------|-------------|
| [Link](url) | What it provides |

---

## N+1. Document Info

| | |
|---|---|
| Author | VintageDon |
| Created | $Today |
| Updated | $Today |
| Version | 1.0 |
"@

    Set-Content -Path "$cloudPath\$($cp.File)" -Value $kbContent -Encoding UTF8
    Write-Host "  Created: identity-and-cloud/$($cp.File)" -ForegroundColor DarkYellow
}

# Cloud directory README
$cloudReadme = @"
<!--
---
title: "Identity and Cloud Providers"
description: "KB articles documenting cloud platform and identity provider integrations"
author: "VintageDon"
date: "$Today"
version: "1.0"
status: "Stub"
tags:
  - type: directory-readme
  - domain: [identity]
related_documents:
  - "[Applications and Services](../README.md)"
---
-->

# Identity and Cloud Providers

KB articles documenting the cloud platforms and identity providers integrated with the Proxmox Astronomy Lab. These are platform decisions documented as articles, not services with instances.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| ``README.md`` | This file |
| ``google-workspace-enterprise.md`` | Primary IdP - SSO, DLP, Chrome Enterprise, Gemini |
| ``microsoft-azure.md`` | Security backbone - Business Premium, Intune Suite, Static Web Apps |
| ``aws.md`` | Greenfield - IAM Identity Center with SSO from Google |
| ``atlassian.md`` | Jira/Confluence Standard via OSS sponsorship |

---

## 2. Structure

``````
identity-and-cloud/
+-- README.md
+-- google-workspace-enterprise.md
+-- microsoft-azure.md
+-- aws.md
+-- atlassian.md
``````

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Applications and Services](../README.md) | Parent directory |
"@

Set-Content -Path "$cloudPath\README.md" -Value $cloudReadme -Encoding UTF8
Write-Host "  Created: identity-and-cloud/README.md" -ForegroundColor Green

# =============================================================================
# Step 6: Restore preserved files
# =============================================================================

Write-Host "`n=== Step 5: Restoring preserved files ===" -ForegroundColor Cyan

foreach ($pf in $preserveFiles) {
    $targetDir = $pf.ServiceHint
    $targetPath = "$AppSvcRoot\$targetDir"
    if (Test-Path $targetPath) {
        $fileName = Split-Path $pf.Source -Leaf
        $targetFile = "$targetPath\$fileName"
        Set-Content -Path $targetFile -Value $pf.Content -Encoding UTF8
        Write-Host "  Restored: $targetDir\$fileName" -ForegroundColor DarkGray
    }
}

# =============================================================================
# Step 7: Create master README
# =============================================================================

Write-Host "`n=== Step 6: Creating master README ===" -ForegroundColor Cyan

$activeServices = $services | Where-Object { $_.Status -eq "Active" }
$plannedServices = $services | Where-Object { $_.Status -eq "Planned" }
$unknownServices = $services | Where-Object { $_.Status -eq "Unknown" }

$activeTable = ($activeServices | ForEach-Object {
    "| [$($_.Name)]($($_.Dir)/README.md) | $($_.Desc) | $($_.Domains -join ', ') |"
}) -join "`n"

$plannedTable = ($plannedServices | ForEach-Object {
    "| [$($_.Name)]($($_.Dir)/README.md) | $($_.Desc) | $($_.Domains -join ', ') |"
}) -join "`n"

$unknownTable = ($unknownServices | ForEach-Object {
    "| [$($_.Name)]($($_.Dir)/README.md) | $($_.Desc) | $($_.Domains -join ', ') |"
}) -join "`n"

$masterReadme = @"
<!--
---
title: "Applications and Services"
description: "Service documentation for all deployed and planned applications on the Proxmox Astronomy Lab"
author: "VintageDon"
date: "$Today"
version: "2.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [applications, infrastructure]
related_documents:
  - "[Root README](../README.md)"
  - "[Infrastructure](../infrastructure/README.md)"
  - "[Hardware](../hardware/README.md)"
---
-->

# Applications and Services

Service documentation for all deployed and planned applications on the Proxmox Astronomy Lab cluster. Each service directory contains an overview README, instance-level asset sheets, and operational runbooks following the Diataxis documentation pattern.

---

## 1. Service Inventory

### Active Services

| Service | Description | Domain |
|---------|-------------|--------|
$activeTable

### Planned Services

| Service | Description | Domain |
|---------|-------------|--------|
$plannedTable

### Status Unknown - Review Required

<!-- Delete these directories if the service is confirmed decommissioned -->

| Service | Description | Domain |
|---------|-------------|--------|
$unknownTable

### Identity and Cloud Providers

Documented as KB articles rather than service directories - these are platform decisions, not instances.

| Provider | Documentation |
|----------|---------------|
| Google Workspace Enterprise | [google-workspace-enterprise.md](identity-and-cloud/google-workspace-enterprise.md) |
| Microsoft Azure | [microsoft-azure.md](identity-and-cloud/microsoft-azure.md) |
| AWS | [aws.md](identity-and-cloud/aws.md) |
| Atlassian | [atlassian.md](identity-and-cloud/atlassian.md) |

---

## 2. Document Types per Service

Each service directory follows the Diataxis documentation pattern through template selection:

| Document Type | Template | Diataxis Mode | Example |
|---------------|----------|---------------|---------|
| Service README | interior-readme-template | Explanation | Architecture decisions, configuration philosophy |
| Instance Asset Sheet | asset-sheet-template | Reference | pgsql01 specs, resource allocation, CIS controls |
| Runbook | runbook-template | How-To | Backup procedure, failover steps, scaling |
| KB Article | general-kb-template | Explanation | Technology overview, integration patterns |

---

## 3. Structure

``````
applications-and-services/
+-- README.md
+-- active-directory/
+-- alertmanager/
+-- docker/
+-- dragonflydb/
+-- gitea/
+-- grafana/
+-- identity-and-cloud/
|   +-- google-workspace-enterprise.md
|   +-- microsoft-azure.md
|   +-- aws.md
|   +-- atlassian.md
+-- kasm-workspaces/
+-- loki/
+-- mongodb/
+-- mssql/
+-- n8n/
+-- neo4j/
+-- netbird/
+-- netbox/
+-- nginx-proxy-manager/
+-- ollama/
+-- openwebui/
+-- pgadmin4/
+-- postgresql/
+-- prometheus/
+-- proxmox/
+-- rabbitmq/
+-- redis-commander/
+-- semaphore/
+-- wazuh/
+-- windmill/
``````

---

## 4. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [Infrastructure](../infrastructure/README.md) | VM specs and network configuration |
| [Hardware](../hardware/README.md) | Physical node documentation |
| [AI Ops](../ai-ops/README.md) | Agent tooling that interacts with these services |
| [Compliance](../compliance/README.md) | CISv8 IG1 controls applied to these services |
"@

Set-Content -Path "$AppSvcRoot\README.md" -Value $masterReadme -Encoding UTF8
Write-Host "  Created: applications-and-services/README.md" -ForegroundColor Green

# =============================================================================
# Summary
# =============================================================================

Write-Host "`n=== Complete ===" -ForegroundColor Green
Write-Host "  Service directories: $($services.Count)" -ForegroundColor White
Write-Host "  Cloud KB articles:   $($cloudProviders.Count)" -ForegroundColor White
Write-Host "  Active:   $($activeServices.Count)" -ForegroundColor Green
Write-Host "  Planned:  $($plannedServices.Count)" -ForegroundColor DarkYellow
Write-Host "  Unknown:  $($unknownServices.Count) (review and delete if dead)" -ForegroundColor Red
Write-Host ""
Write-Host "  Old dirs removed: ai-service-providers, cloud-service-providers, on-prem-services" -ForegroundColor Yellow
Write-Host "  Preserved files restored to new locations" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Next: Review unknown services, delete dead ones, then hydrate active service READMEs" -ForegroundColor White
