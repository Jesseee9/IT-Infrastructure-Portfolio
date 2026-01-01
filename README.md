# IT Infrastructure Portfolio

Enterprise IT lab environment demonstrating real-world infrastructure skills.

---

## 🎯 Portfolio Overview

This portfolio contains hands-on projects that simulate a real corporate IT environment. Each project builds on the previous one, demonstrating progression from foundational infrastructure to enterprise automation.

| Project | Focus | Status |
|---------|-------|--------|
| Project 1 | On-Prem Infrastructure (AD, DNS, DHCP) | ✅ Complete |
| Project 2 | Identity & Automation (PowerShell, Azure Entra ID) | ✅ Complete |
| Project 3 | ServiceNow Operations (MID Server, Flow Designer) | 🔜 Coming Soon |

---

## 🏗️ Project 1: On-Prem Infrastructure

**Objective:** Build a corporate Windows environment from scratch.

[📁 View Full Project Documentation](https://docs.google.com/document/d/1uStkXWx25GhWItCnboR53mSuo08ItcCXuBkCDcaaaZI/edit?usp=sharing)

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

[📁 View Full Project Documentation](https://docs.google.com/document/d/1uStkXWx25GhWItCnboR53mSuo08ItcCXuBkCDcaaaZI/edit?usp=sharing

### What Was Built

| Component | Description |
|-----------|-------------|
| OU Structure | Organized department-based hierarchy (IT, HR, Finance, Sales, Marketing) |
| PowerShell Automation | Script that reads CSV and bulk-creates AD users |
| Azure Entra ID | Cloud identity management with matching user accounts |

### Automation Workflow

