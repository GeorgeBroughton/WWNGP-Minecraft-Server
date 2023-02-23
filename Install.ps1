Set-Location -Path $PSScriptRoot

Write-Host 'Downloading Dependencies (might take a while)'
    Invoke-WebRequest -Uri 'https://edge.forgecdn.net/files/4301/113/Version%20108%20server%20files.zip' -OutFile './WWNGP-Server.zip'

Write-Host 'Installing Mods'
    if (!(Test-Path -Path ".\Minecraft-Data")) { New-Item -Path ".\Minecraft-Data" -ItemType Directory }
    Expand-Archive -Path '.\WWNGP-Server.zip' -DestinationPath '.\Minecraft-Data'
    Remove-Item -Path '.\WWNGP-Server.zip'

docker-compose up -d

Write-Host ''
Write-Host 'Done'