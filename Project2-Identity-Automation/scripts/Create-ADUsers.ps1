# ============================================
# BULK AD USER CREATION SCRIPT
# Project 2 - Identity & Automation
# ============================================

# Import Active Directory module
Import-Module ActiveDirectory

# Define the path to CSV file
$CSVPath = "C:\Scripts\NewUsers.csv"

# Define the base OU path
$BaseOU = "OU=Company Users,DC=corp,DC=local"

# Import the CSV file
$Users = Import-Csv -Path $CSVPath

# Counter for tracking
$Created = 0
$Failed = 0

# Loop through each user in the CSV
foreach ($User in $Users) {
    
    # Build the username (first initial + last name)
    $Username = ($User.FirstName.Substring(0,1) + $User.LastName).ToLower()
    
    # Build the full name
    $FullName = "$($User.FirstName) $($User.LastName)"
    
    # Build the OU path for their department
    $DepartmentOU = "OU=$($User.Department),$BaseOU"
    
    # Convert password to secure string
    $SecurePassword = ConvertTo-SecureString $User.Password -AsPlainText -Force
    
    # Check if user already exists
    $ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue
    
    if ($ExistingUser) {
        Write-Host "SKIPPED: $Username already exists" -ForegroundColor Yellow
        $Failed++
    }
    else {
        try {
            # Create the user
            New-ADUser `
                -SamAccountName $Username `
                -UserPrincipalName "$Username@corp.local" `
                -Name $FullName `
                -GivenName $User.FirstName `
                -Surname $User.LastName `
                -DisplayName $FullName `
                -Title $User.Title `
                -Department $User.Department `
                -Path $DepartmentOU `
                -AccountPassword $SecurePassword `
                -ChangePasswordAtLogon $true `
                -Enabled $true
            
            Write-Host "CREATED: $FullName ($Username) in $($User.Department)" -ForegroundColor Green
            $Created++
        }
        catch {
            Write-Host "FAILED: $FullName - $($_.Exception.Message)" -ForegroundColor Red
            $Failed++
        }
    }
}

# Summary
Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "COMPLETE: $Created users created, $Failed skipped/failed" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
