
# Project 1: On-Prem Infrastructure

Building a corporate Windows environment from scratch — Active Directory, DNS, DHCP, and domain-joined client.

---

## 🎯 Objective

Prove I can stand up a corporate Windows environment from nothing. This is the foundation for all future projects.

---

## 🖥️ Environment Overview

| Component | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Network Type | Host-only (isolated) |
| Network Subnet | 192.168.10.0/24 |
| Domain Name | corp.local |
| NetBIOS Name | CORP |

---

## 🖧 Virtual Machines

| VM Name | Role | OS | IP Address |
|---------|------|-----|------------|
| CORP-DC1 | Domain Controller | Windows Server 2022 | 192.168.10.10 (static) |
| CORP-CLIENT1 | Workstation | Windows 11 Pro | 192.168.10.50-100 (DHCP) |

---

## 🔧 Services Configured

### Active Directory Domain Services (AD DS)

**What it is:**
Central database that stores all users, computers, and policies in an organization.

**What I did:**
- Installed AD DS role on Windows Server 2022
- Promoted server to Domain Controller
- Created new forest and domain: corp.local

**Why it matters:**
Every corporate Windows environment uses AD. It's how companies manage thousands of users and computers from one place.

---

### DNS (Domain Name System)

**What it is:**
Translates names (corp.local) to IP addresses (192.168.10.10).

**What I did:**
- Installed automatically with AD DS
- Configured client to use DC as DNS server
- Verified resolution with `nslookup corp.local`

**Why it matters:**
Without DNS, computers can't find each other by name. Domain join fails without proper DNS.

---

### DHCP (Dynamic Host Configuration Protocol)

**What it is:**
Automatically assigns IP addresses to devices on the network.

**What I did:**
- Installed DHCP role
- Created scope: 192.168.10.50 – 192.168.10.100
- Authorized DHCP server in Active Directory

**Why it matters:**
In real companies, you don't manually assign IPs to hundreds of computers. DHCP automates this.

---

### Domain Join

**What it is:**
Connecting a computer to the domain so it's managed by Active Directory.

**What I did:**
- Configured client network settings
- Joined CORP-CLIENT1 to corp.local
- Logged in with domain credentials (CORP\Administrator)
- Verified computer object appeared in AD Users and Computers


---

## 🗺️ Network Diagram

┌─────────────────────────────────────────────────────────────┐
│ Host-only Network (VMnet1) │
│ 192.168.10.0/24 │
│ │
│ ┌─────────────────┐ ┌─────────────────┐ │
│ │ CORP-DC1 │ │ CORP-CLIENT1 │ │
│ │ │ │ │ │
│ │ 192.168.10.10 │◄────────►│ 192.168.10.X │ │
│ │ (static) │ │ (DHCP) │ │
│ │ │ │ │ │
│ │ ┌───────────┐ │ │ ┌───────────┐ │ │
│ │ │ AD DS │ │ │ │ Windows │ │ │
│ │ │ DNS │ │ │ │ 11 Pro │ │ │
│ │ │ DHCP │ │ │ │ │ │ │
│ │ └───────────┘ │ │ └───────────┘ │ │
│ └─────────────────┘ └─────────────────┘ │
│ │
└─────────────────────────────────────────────────────────────┘

---

## 📸 Screenshots

### Active Directory Users and Computers
![AD Computers](![Active Directory — Computer](https://github.com/user-attachments/assets/ae3187f6-00d5-41e7-a4af-26d5e898b670)

*CORP-CLIENT1 visible in the Computers container after successful domain join.*

### DHCP Scope Configuration
![DHCP Scope](![DHCP Scope](https://github.com/user-attachments/assets/f90f305a-9338-422f-bb3c-71b5613fc382)

*DHCP scope configured with range 192.168.10.50-100.*

### Client IP Configuration
![Client IP](./screenshots/client-ipconfig.png
*Client received IP from DHCP with correct DNS pointing to Domain Controller.*

### Domain Login
![Domain Login](![domain-login png](https://github.com/user-attachments/assets/381a7936-84f3-4ebe-88ac-b22efa28905f)

*Successfully logged in as domain user.*

---

## 💻 Key Commands Used

| Command | Purpose |
|---------|---------|
| `ipconfig /all` | View IP, DHCP, and DNS configuration |
| `ping 192.168.10.10` | Test connectivity to Domain Controller |
| `nslookup corp.local` | Verify DNS resolution |
| `whoami` | Confirm logged-in user context |

---

## 🔥 Troubleshooting Encountered

| Issue | Cause | Solution |
|-------|-------|----------|
| Client got 169.254.x.x IP | DHCP server not reachable | Verified both VMs on same VMnet (Host-only) |
| DNS timeout during nslookup | Client DNS not set correctly | Manually set DNS to 192.168.10.10 |
| Domain join failed initially | Client couldn't resolve corp.local | Fixed DNS settings, then join succeeded |

---

## 📚 What I Learned

1. **AD DS requires DNS** — Domain join fails without proper name resolution
2. **DHCP must be authorized** — Prevents rogue DHCP servers in enterprise environments
3. **Snapshots save time** — Always capture working states before making changes
4. **Static IPs for servers** — Domain Controllers need predictable addresses
5. **Isolated networks for labs** — Host-only prevents conflicts with real network

---

## ✅ Project Completion Checklist

- [x] VMware Workstation installed
- [x] Isolated virtual network created
- [x] Windows Server 2022 VM built
- [x] Static IP configured
- [x] AD DS role installed
- [x] Server promoted to Domain Controller
- [x] DNS verified working
- [x] DHCP role installed and scope created
- [x] DHCP authorized in AD
- [x] Windows 11 client VM built
- [x] Client received DHCP address
- [x] Client joined to domain
- [x] Domain login successful
- [x] Computer object visible in AD
- [x] Snapshots taken at key stages
- [x] Documentation completed

---

## ⏭️ Next Steps

This foundation enables:
- **Project 2:** PowerShell automation for bulk user creation and Azure Entra ID integration
- **Project 3:** ServiceNow MID Server installation and ITSM automation

---

*Project completed and documented.*
