README – Bitdefender Installation Script

Steps to Run
Open PowerShell as Administrator

Navigate to the script folder:

cd "C:\Users\user\Downloads\Bitdefender-business-client"

Run the script:

powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\install_bd_business_client.ps1" `
-installerPath "..\installer\epskit_x64_8.26.4.628\epskit_x64.exe"

Important Notes
Ensure the installer exists at:

..\installer\epskit_x64_8.26.4.628\epskit_x64.exe
Run PowerShell with Administrator privileges
Internet connection is required
What the Script Does
Installs Bitdefender GravityZone Endpoint Security Tools (BEST)
Validates services (EPProtectedService)
Checks Windows Security Center (WSC) registration
Verifies Real-Time Protection
Displays installation logs
Expected Output (Summary)
Installer runs successfully
Service EPProtectedService is running
Bitdefender registered in WSC
Real-Time Protection is ON
Installation verified successfully