README before RUN:
============================================================================================================================
STEP-1: Open PowerShell as Administrator
STEP-2: Navigate to the script folder using the cd command
Example:
cd "C:\Users\user\Downloads\Bitdefender-GravityZone-Automation-Windows-main
STEP-3: Run the installation command:
powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\install_bd_business_client.ps1" `
-installerPath "..\installer\epskit_x64_8.26.4.628\epskit_x64.exe"
============================================================================================================================
IMPORTANT NOTES:
Make sure the Bitdefender installer file is present in the correct path:
..\installer\epskit_x64_8.26.4.628\epskit_x64.exe
Script must be executed with Administrator privileges.
Internet connection is required for installation and registration.
During installation, Bitdefender services will start automatically.
The script will:
Install Bitdefender GravityZone Endpoint Security Tools (BEST)
Validate services (EPProtectedService)
Check Windows Security Center (WSC) registration
Verify Real-Time Protection via registry
Print detailed logs
============================================================================================================================
EXAMPLE COMMAND:
powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\install_bd_business_client.ps1" `
-installerPath "..\installer\epskit_x64_8.26.4.628\epskit_x64.exe"
============================================================================================================================
EXPECTED OUTPUT:
=========================================
Bitdefender Business Client Silent Installer
Installer found: ..\installer\epskit_x64_8.26.4.628\epskit_x64.exe
Starting installation...
Arguments: /bdparams="integrated=true" /silent /norestart
Installer finished. Verifying installation...
Installation successful. Service 'EPProtectedService' is running.
Checking Windows Security Center...
WSC: Bitdefender registered as AV - 'Bitdefender Endpoint Security Tools Antimalware'
Checking Real-Time Protection...
RTP: Bitdefender registry key found - real time protection is - ON
All checks passed. Installation verified successfully.
============================================================================================================================