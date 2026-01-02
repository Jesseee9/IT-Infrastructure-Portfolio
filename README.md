# IT Infrastructure Portfolio

Enterprise IT lab environment demonstrating real-world infrastructure skills.

---

## 🎯 Portfolio Overview

This portfolio contains hands-on projects that simulate a real corporate IT environment. Each project builds on the previous one, demonstrating progression from foundational infrastructure to enterprise automation.

| Project | Focus | Status |
|---------|-------|--------|
| Project 1 | On-Prem Infrastructure (AD, DNS, DHCP) | ✅ Complete |
| Project 2 | Identity & Automation (PowerShell, Azure Entra ID) | ✅ Complete |
| Project 3 | ServiceNow Operations (MID Server, Flow Designer) | ✅ Complete |

---

## 🏗️ Project 1: On-Prem Infrastructure

**Objective:** Build a corporate Windows environment from scratch.


### Environment

| Component | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Network | Isolated Host-only (simulating corporate LAN) |
| Domain | corp.local |

### Virtual Machines

| VM Name | Role | IP Address | OS |
|---------|------|------------|-----|
| CORP-DC1 | Domain Controller | 192.168.10.10 (static) | Windows Server 2022 |
| CORP-CLIENT1 | Workstation | DHCP assigned (.50-.100) | Windows 11 Pro |

### Services Configured

| Service | Purpose |
|---------|---------|
| Active Directory Domain Services | Centralized identity and computer management |
| DNS | Name resolution for domain resources |
| DHCP | Automatic IP address assignment |
| Domain Join | Client authentication against AD |

### Key Achievements

- Built complete Windows domain environment from scratch
- Configured AD DS, DNS, and DHCP on Windows Server 2022
- Successfully joined Windows 11 client to domain
- Implemented proper network isolation for lab security
- Documented troubleshooting steps for common issues

---

## 🤖 Project 2: Identity & Automation

**Objective:** Automate user onboarding in both on-premises AD and cloud environments.


### What Was Built

| Component | Description |
|-----------|-------------|
| OU Structure | Organized department-based hierarchy (IT, HR, Finance, Sales, Marketing) |
| PowerShell Automation | Script that reads CSV and bulk-creates AD users |
| Azure Entra ID | Cloud identity management with matching user accounts |

### Automation Workflow
CSV File (employee data)
↓
PowerShell Script
↓
┌────┴────┐
↓ ↓
AD Azure Entra ID
(on-prem) (cloud)

### Key Achievements

- Designed logical OU structure mirroring real corporate departments
- Built PowerShell script for bulk user provisioning from CSV
- Created matching cloud identities in Azure Entra ID
- Demonstrated hybrid identity management approach

---

## ☁️ Project 3: ServiceNow Operations

**Objective:** Bridge cloud ITSM operations with on-premises infrastructure using ServiceNow MID Server.


### Architecture

┌─────────────────────────────────────────────────────────────┐
│ │
│ ServiceNow (Cloud) CORP-DC1 (On-Prem) │
│ ┌─────────────────┐ ┌───────────────────┐ │
│ │ PDI Instance │ │ Windows Server │ │
│ │ │ Internet │ │ │
│ │ Flow Designer │◄───────────►│ MID Server │ │
│ │ Incidents │ │ PowerShell │ │
│ └─────────────────┘ └───────────────────┘ │
│ │
└─────────────────────────────────────────────────────────────┘


### What Was Built

| Component | Description |
|-----------|-------------|
| MID Server | Secure bridge between ServiceNow cloud and on-prem infrastructure |
| Service Account | Dedicated AD account (svc_mid) for MID Server authentication |
| Flow Designer | Automation workflow triggered by incident creation |
| PowerShell Script | Remediation script for service restart with logging |

### MID Server Configuration

| Setting | Value |
|---------|-------|
| MID Server Name | CORP-DC1-MID |
| Status | Up |
| Validated | Yes |
| Host | CORP-DC1 (192.168.10.10) |
| ServiceNow Instance | Personal Developer Instance (Zurich) |

### Key Achievements

- Configured dual-NIC setup on domain controller (Host-only + NAT) for hybrid connectivity
- Installed and validated MID Server connecting cloud ITSM to on-prem environment
- Created dedicated service accounts following security best practices
- Built Flow Designer automation responding to incident triggers
- Developed PowerShell remediation script with error handling and logging
- Demonstrated enterprise pattern: Cloud ticketing → On-prem execution

---

## 🛠️ Technical Skills Demonstrated

| Category | Skills |
|----------|--------|
| **Windows Server** | AD DS, DNS, DHCP, Group Policy, Service Accounts |
| **Networking** | Static IP, DHCP scopes, Virtual networking, Dual-NIC configuration |
| **Automation** | PowerShell scripting, Bulk operations, Error handling |
| **Cloud Identity** | Azure Entra ID, User provisioning |
| **ITSM** | ServiceNow administration, MID Server, Flow Designer |
| **Virtualization** | VMware Workstation, Snapshots, Resource management |

---



