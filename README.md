
# IT Infrastructure Portfolio

Enterprise IT lab environment demonstrating real-world infrastructure skills.

---

## 🎯 Portfolio Overview

This portfolio contains hands-on projects that simulate a real corporate IT environment. Each project builds on the previous one, demonstrating progression from foundational infrastructure to enterprise automation.

---

## 🏗️ Project 1: On-Prem Infrastructure

**Objective:** Build a corporate Windows environment from scratch.

[📁 View Full Project Documentation](https://docs.google.com/document/d/1uStkXWx25GhWItCnboR53mSuo08ItcCXuBkCDcaaaZI/edit?usp=sharing

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

## 🛠️ Technical Skills Demonstrated

### Infrastructure
- Windows Server 2022 Administration
- VMware Workstation
- Virtual Networking
- Static IP Configuration

### Identity & Access Management
- Active Directory Domain Services
- DNS Configuration
- DHCP Scope Management

### Professional Practices
- VM Snapshot Management
- Technical Documentation
- Troubleshooting Methodology

---

## 📫 Contact

Project 2 next
