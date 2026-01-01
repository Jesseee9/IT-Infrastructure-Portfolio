
# Project 2: Identity & Automation

Automating user onboarding with PowerShell and managing cloud identities in Azure Entra ID.

---

## Why I Built This

Clicking through the GUI to create user accounts works fine for one or two people. But what happens when HR sends you a list of 50 new hires starting Monday? You automate it.

This project simulates exactly that — taking employee data from a spreadsheet and turning it into fully configured AD accounts without touching the GUI.

I also wanted to get hands-on with Azure Entra ID since most companies now use some combination of on-prem AD and cloud identity.

---

## What's In This Project

| Component | Purpose |
|-----------|---------|
| OU Structure | Department-based organization in AD |
| PowerShell Script | Reads CSV, creates users, places them in correct OUs |
| Azure Entra ID Users | Same employees provisioned in the cloud |

---

## The OU Structure

Before creating users, I needed somewhere logical to put them. I created a parent OU called "Company Users" with department OUs inside:
corp.local
└── Company Users
├── IT
├── HR
├── Finance
├── Sales
└── Marketing

This mirrors how real companies organize their AD. It also makes it easy to apply Group Policies to specific departments later.


---

## The CSV File

HR systems typically export employee data as CSV files. Mine looks like this:
FirstName,LastName,Department,Title,Password
John,Smith,IT,Help Desk Technician,Welcome2026!
Sarah,Johnson,IT,Systems Administrator,Welcome2026!
Michael,Williams,HR,HR Coordinator,Welcome2026!

10 employees across 5 departments. The script reads this and does the rest.

[View the full CSV file](./data/NewUsers.csv)

---

## The PowerShell Script

This is where the automation happens.

**What the script does:**
1. Reads employee data from the CSV
2. Builds a username from first initial + last name (John Smith → jsmith)
3. Figures out which OU they belong in based on department
4. Creates the AD account with all the right attributes
5. Sets their password and forces them to change it at first login
6. Tells me if it worked or if something failed

**Sample output:**
CREATED: John Smith (jsmith) in IT
CREATED: Sarah Johnson (sjohnson) in IT
CREATED: Michael Williams (mwilliams) in HR
...
COMPLETE: 10 users created, 0 skipped/failed

10 users created in about 3 seconds. Doing this manually would take 20-30 minutes.

![10 users created via powershell](https://github.com/user-attachments/assets/04836e27-5b10-43c3-acbf-fb349133cf96)


---

## Azure Entra ID

Most companies don't just use on-prem AD anymore. They have cloud services, remote workers, and SaaS applications that need cloud identities.

I created the same 10 users in Azure Entra ID to demonstrate hybrid identity management — handling both on-prem and cloud from the same employee data.

One thing I ran into: Azure rejected the password "Welcome2026!" because it blocks commonly used words. Had to use something stronger. Small detail, but it's the kind of thing you learn by actually doing it.

(![All users in Entra ID](https://github.com/user-attachments/assets/854716fc-6da6-4b6c-8140-f979f989f753)




(![Entra ID user Profile ](https://github.com/user-attachments/assets/82a9927b-3e92-43bf-b4dd-d4ce9be0f6ce)


---

## Users Created

| Username | Full Name | Department | Title |
|----------|-----------|------------|-------|
| jsmith | John Smith | IT | Help Desk Technician |
| sjohnson | Sarah Johnson | IT | Systems Administrator |
| mwilliams | Michael Williams | HR | HR Coordinator |
| ebrown | Emily Brown | HR | Recruiter |
| djones | David Jones | Finance | Accountant |
| jdavis | Jessica Davis | Finance | Financial Analyst |
| cmiller | Christopher Miller | Sales | Sales Representative |
| awilson | Amanda Wilson | Sales | Account Manager |
| dtaylor | Daniel Taylor | Marketing | Marketing Specialist |
| aanderson | Ashley Anderson | Marketing | Content Creator |

---

## Issues I Ran Into

**CSV file not found**

The script kept failing because I had the folder path wrong. I created a folder called "CScripts" instead of putting a "Scripts" folder at the root of C: drive. Windows paths can be tricky — `C:\Scripts` means the Scripts folder at the root of C:, not a folder named "C:\Scripts".

**Azure password rejection**

Azure Entra ID has stricter password policies than on-prem AD. It checks against commonly used passwords and known breached passwords. Ended up using a stronger password that passed validation.

**PowerShell ISE pointing to old location**

After moving my script file, ISE was still trying to run it from the old location. Had to close it completely and reopen the file from the new path.

---

## What I Learned

- Automation is essential once you're dealing with more than a handful of users
- OU design matters — it affects Group Policy targeting and keeps AD organized
- Cloud identity (Azure Entra ID) has different rules than on-prem AD
- Always test scripts with a small batch before running against production
- Error handling in scripts saves time when something goes wrong

---

## Files

