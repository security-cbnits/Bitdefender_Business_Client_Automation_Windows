param (
    [Parameter(Mandatory = $true)]
    [string]$installerPath
)

Write-Host "========================================="
Write-Host " Bitdefender GravityZone Silent Installer"
Write-Host "========================================="

if (!(Test-Path $installerPath)) {
    Write-Host "ERROR: Installer not found at path: $installerPath"
    exit 1
}

Write-Host "Installer found: $installerPath"

$arguments = '/bdparams="integrated=true" /silent /norestart'

Write-Host "Starting installation..."
Write-Host "Arguments: $arguments"

try {
    # Start-Process (single line)
    $process = Start-Process -FilePath "$installerPath" -ArgumentList "$arguments" -Wait -PassThru

    Write-Host "Installer finished. Verifying installation..."

    # SERVICE CHECK
    $service = Get-Service -Name "EPProtectedService" -ErrorAction SilentlyContinue

    if ($service -and $service.Status -eq "Running") {
        Write-Host "Installation successful. Service 'EPProtectedService' is running."
    }
    else {
        Write-Host "Service not running."
        exit 1
    }

    # WSC CHECK
    Write-Host "Checking Windows Security Center..."

    $av = Get-WmiObject -Namespace "root\SecurityCenter2" -Class AntiVirusProduct |
    Where-Object { $_.displayName -like "*Bitdefender*" }

    if ($av) {
        Write-Host "WSC: Bitdefender registered as AV - '$($av.displayName)'"
    }
    else {
        Write-Host "WSC registration failed"
        exit 1
    }

    # REGISTRY CHECK
    Write-Host "Checking Real-Time Protection..."

    if (Test-Path "HKLM:\SOFTWARE\Bitdefender") {
        Write-Host "RTP: Bitdefender registry key found - Real-Time Protection is ON"
    }
    else {
        Write-Host "RTP check failed"
        exit 1
    }

    Write-Host ""
    Write-Host "All checks passed. Installation verified successfully."
}
catch {
    Write-Host "Exception occurred:"
    Write-Host $_.Exception.Message
    exit 1
}