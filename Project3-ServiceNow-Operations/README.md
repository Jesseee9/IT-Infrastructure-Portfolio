# Project 3: ServiceNow Operations

Bridging cloud ITSM with on-premises infrastructure using ServiceNow MID Server.

---

## 🎯 Objective

Connect a ServiceNow cloud instance to an on-premises Windows Server environment, enabling cloud-based IT operations to interact with local infrastructure.

---

## 🏗️ Architecture
┌──────────────────────────────────────────────────────────────────┐
│ │
│ SERVICENOW (Cloud) CORP-DC1 (On-Premises) │
│ ┌──────────────────┐ ┌────────────────────┐ │
│ │ │ │ Windows Server │ │
│ │ Flow Designer │ │ 2022 │ │
│ │ + │ Internet │ │ │
│ │ Incident Mgmt │◄────────────────►│ MID Server │ │
│ │ │ (Validated) │ (CORP-DC1-MID) │ │
│ │ │ │ │ │
│ └──────────────────┘ │ PowerShell │ │
│ │ Scripts Ready │ │
│ └────────────────────┘ │
│ │
└──────────────────────────────────────────────────────────────────┘

---https://docs.google.com/document/d/1uStkXWx25GhWItCnboR53mSuo08ItcCXuBkCDcaaaZI/edit?usp=sharing

## ✅ What Was Built

### 1. Network Configuration

Added dual-NIC setup to domain controller for hybrid connectivity:

| Adapter | Type | Purpose | IP Address |
|---------|------|---------|------------|
| Ethernet0 | Host-only | Lab network (AD, DNS, DHCP) | 192.168.10.10 (static) |
| Ethernet1 | NAT | Internet access for MID Server | DHCP assigned |

---

### 2. MID Server Installation & Validation

| Component | Details |
|-----------|---------|
| MID Server Name | CORP-DC1-MID |
| Status | Up |
| Validated | Yes |
| Host | CORP-DC1 |
| ServiceNow Instance | Personal Developer Instance (Zurich release) |

**Accounts Created:**

| Account | Purpose | Location |
|---------|---------|----------|
| mid.server | MID Server authentication to ServiceNow | ServiceNow |
| svc_mid | Windows service account for MID Server | Active Directory |

**Security Configuration:**
- Granted "Log on as a service" right to svc_mid
- Password set to never expire (service account best practice)
- MID Server validated and authorized in ServiceNow

---

### 3. Flow Designer Automation

Created incident-triggered automation flow:

| Component | Configuration |
|-----------|---------------|
| Trigger | Record Created → Incident table |
| Filter | Short description contains "Print Spooler" |
| Action | Update Record → Set state to "In Progress" |

---

### 4. PowerShell Remediation Script

Created and tested locally on CORP-DC1:

**Script:** `Restart-PrintSpooler.ps1`

**Features:**
- Restarts the Print Spooler service
- Creates timestamped log entries
- Includes error handling with try/catch
- Returns success/failure status codes

**Log Output Location:** `C:\Scripts\Logs\ServiceNow-Automation.log`

```powershell
# Sample log output after execution:
[2025-01-02 10:15:32] === Script Started ===
[2025-01-02 10:15:32] Attempting to restart Print Spooler service...
[2025-01-02 10:15:34] SUCCESS: Print Spooler restarted. Status: Running
[2025-01-02 10:15:34] === Script Completed Successfully ===
📝 Technical Note: IntegrationHub
The full automation pattern (Incident → MID Server → PowerShell execution) requires the IntegrationHub PowerShell plugin, which is a licensed enterprise feature not available on free Personal Developer Instances.

What I demonstrated:

✅ MID Server successfully bridging cloud to on-prem
✅ Flow Designer automation triggered by incidents
✅ PowerShell script tested and working locally
✅ Architecture ready for full integration
In a licensed enterprise environment, the complete flow would be:

text
Incident Created → Flow Designer → MID Server → PowerShell Executes → Incident Updated
This constraint is common in real enterprise environments where licensing dictates available features.
What I Learned
MID Server Architecture — How ServiceNow communicates with on-prem infrastructure securely
Service Accounts — Creating dedicated accounts with minimal required permissions
Flow Designer — Building trigger-based automations in ServiceNow
Enterprise Constraints — Working within licensing limitations while demonstrating core concepts
Hybrid Networking — Configuring VMs with multiple network adapters for different purposes
