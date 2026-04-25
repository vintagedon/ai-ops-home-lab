<!--
---
title: "[Asset Name] - [Brief Descriptor]"
description: "Asset documentation for [asset name] providing [primary function]"
author: "VintageDon"
date: "YYYY-MM-DD"
version: "1.1"
status: "Active"
asset_type: "[node|vm|service|database|license|network|storage]"
asset_status: "[active|planned|maintenance|deprecated|decommissioned]"
tags:
  - type: asset-sheet
  - domain: [infrastructure/kubernetes/databases/monitoring/networking/security/storage/automation/agents]
  - tech: [specific-technologies]
related_documents:
  - "[Related Asset](path/to/asset.md)"
  - "[Parent System](path/to/parent.md)"
---
-->

# [Asset Name]

Brief description of the asset, its role in the infrastructure, and primary function. One to two sentences.

---

## 1. Asset Identification

Core identification and classification information for this asset.

| Field | Value |
|-------|-------|
| **Asset ID** | `[unique-identifier]` |
| **Asset Type** | [Node / VM / Service / Database / License / Network / Storage] |
| **Asset Status** | [Active / Planned / Maintenance / Deprecated / Decommissioned] |
| **Hostname/Name** | `[hostname or service name]` |
| **Environment** | [Production / Development / Testing / Staging] |
| **Location** | [Physical location or host system] |
| **Owner** | [Team or individual responsible] |
| **Service Tier** | [Critical / Standard / Development] |

---

## 2. Asset Details

<!--
This section varies by asset type. Use the appropriate subsection pattern below.
Delete the patterns that don't apply.
-->

### For Hardware Nodes

#### 2.1 Hardware Specifications

| Component | Specification |
|-----------|---------------|
| **Processor** | [CPU model and core count] |
| **Memory** | [RAM capacity and type] |
| **Primary Storage** | [Drive model and capacity] |
| **Network Interfaces** | [Interface types and count] |

#### 2.2 Storage Configuration

| Pool/Volume | Type | Capacity | Usage |
|-------------|------|----------|-------|
| [pool-name] | [LVM/ZFS/etc] | [size] | [purpose] |

#### 2.3 Network Configuration

| Interface | Type | Configuration | Purpose |
|-----------|------|---------------|---------|
| [eth0] | [Physical/Bond/Bridge] | [IP/VLAN] | [purpose] |

---

### For Virtual Machines

#### 2.1 VM Specifications

| Resource | Allocation |
|----------|------------|
| **VM ID** | [Proxmox VM ID] |
| **vCPU** | [count] |
| **Memory** | [allocation] |
| **Disk** | [size and storage pool] |
| **Host Node** | [node hosting this VM] |
| **OS** | [operating system and version] |

#### 2.2 Network Configuration

| Interface | Network | IP Address | Purpose |
|-----------|---------|------------|---------|
| [eth0] | [VLAN/bridge] | [IP] | [purpose] |

#### 2.3 Services Hosted

| Service | Port | Purpose |
|---------|------|---------|
| [service-name] | [port] | [function] |

---

### For Services/Applications

#### 2.1 Service Configuration

| Property | Value |
|----------|-------|
| **Service Type** | [web/api/database/agent/etc] |
| **Version** | [current version] |
| **Port(s)** | [listening ports] |
| **URL/Endpoint** | [access URL] |
| **Authentication** | [auth method] |

#### 2.2 Dependencies

| Dependency | Type | Purpose |
|------------|------|---------|
| [dependency-name] | [Required/Optional] | [why needed] |

#### 2.3 Resource Requirements

| Resource | Minimum | Recommended | Current |
|----------|---------|-------------|---------|
| CPU | [min] | [rec] | [actual] |
| Memory | [min] | [rec] | [actual] |
| Storage | [min] | [rec] | [actual] |

---

### For Databases

#### 2.1 Database Configuration

| Property | Value |
|----------|-------|
| **Engine** | [PostgreSQL/MongoDB/Redis/etc] |
| **Version** | [version] |
| **Port** | [port] |
| **Storage Location** | [path or volume] |
| **Storage Used** | [current size] |

#### 2.2 Databases/Collections

| Database/Collection | Purpose | Size |
|---------------------|---------|------|
| [name] | [purpose] | [size] |

#### 2.3 Access Configuration

| User/Role | Permissions | Purpose |
|-----------|-------------|---------|
| [user] | [permissions] | [why] |

---

### For Licenses

#### 2.1 License Details

| Property | Value |
|----------|-------|
| **Vendor** | [vendor name] |
| **Product** | [product name] |
| **License Type** | [perpetual/subscription/open-source] |
| **License Key** | `[stored in: location]` |
| **Seats/Units** | [count or unlimited] |

#### 2.2 Terms and Dates

| Term | Date/Value |
|------|------------|
| **Purchase Date** | [YYYY-MM-DD] |
| **Expiration Date** | [YYYY-MM-DD or N/A] |
| **Renewal Cost** | [$X/period] |
| **Support Level** | [community/standard/premium] |

#### 2.3 Usage

| System | Purpose |
|--------|---------|
| [system-name] | [how license is used] |

---

## 3. Operations

### 3.1 Monitoring

| Metric | Method | Alert Threshold |
|--------|--------|-----------------|
| [metric] | [how monitored] | [when to alert] |

### 3.2 Backup

| Data | Frequency | Retention | Method |
|------|-----------|-----------|--------|
| [what] | [schedule] | [period] | [how] |

### 3.3 Maintenance

| Task | Frequency | Last Performed | Next Due |
|------|-----------|----------------|----------|
| [task] | [schedule] | [date] | [date] |

### 3.4 Automation & Agent Access

<!--
Documents which agent personas or automation systems can interact with this
asset, at what privilege level, and what actions they're authorized to perform.
Omit this section if no agents interact with this asset.
-->

| Agent/Automation | Access Level | Authorized Actions | Constraints |
|------------------|-------------|-------------------|-------------|
| [agent persona or automation name] | [read/write/admin/execute] | [what the agent can do] | [limitations, approval gates, scope boundaries] |

---

## 4. Security & Compliance

### 4.1 Access Control

| Access Type | Method | Authorized |
|-------------|--------|------------|
| [admin/user/service] | [how] | [who/what] |

### 4.2 CIS Controls

| Control | Status | Evidence |
|---------|--------|----------|
| [CIS control reference] | [Compliant/Partial/N/A] | [where documented] |

---

## 5. Related Assets

| Asset | Relationship | Documentation |
|-------|--------------|---------------|
| [asset-name] | [depends-on/provides-to/hosted-by] | [link] |

---

## 6. Notes & History

### 6.1 Known Issues

| Issue | Status | Workaround |
|-------|--------|------------|
| [issue] | [open/resolved] | [mitigation] |

### 6.2 Change Log

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | YYYY-MM-DD | VintageDon | Initial creation |
