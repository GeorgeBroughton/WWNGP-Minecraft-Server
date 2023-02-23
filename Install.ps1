Set-Location -Path $PSScriptRoot

Write-Host "Downloading Weedie's modpack"
    Invoke-WebRequest -Uri 'https://edge.forgecdn.net/files/4301/113/Version%20108%20server%20files.zip' -OutFile './WWNGP-Server.zip'

if (!(Get-WinGetPackage -ID "Docker.DockerDesktop")) { 
    Write-Host "Installing Docker Desktop"
        Install-WinGetPackage -ID "Docker.DockerDesktop"
} else {
    Write-Host "Docker Desktop is already installed and will not be downloaded."
}

Write-Host 'Installing Mods'
    if (!(Test-Path -Path ".\Minecraft-Data")) {
        Write-Host 'Creating new folder to install game files into.'
        New-Item -Path ".\Minecraft-Data" -ItemType Directory
    }
    Expand-Archive -Path '.\WWNGP-Server.zip' -DestinationPath '.\Minecraft-Data'
    Remove-Item -Path '.\WWNGP-Server.zip'

docker-compose up -d

Write-Host ''
