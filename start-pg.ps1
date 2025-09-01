<#
	
    .SYNOPSIS
       Start PostgreSQL

    .DESCRIPTION
        See above
    
    .INPUTS
        none

    .OUTPUTS
        Sucess or failure 
#>

Import-Module Microsoft.PowerShell.Utility

function Get-DockerRunning {

	[bool]$DockerAlive = $false

	try {
		$null = Get-Process 'com.docker.backend' -ErrorAction Stop
		$DockerAlive = $true;
	} catch {
		$DockerAlive = $false;
	}

	return $DockerAlive
}

#
# Main
#

Set-StrictMode -Version 2.0
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12
Push-Location $PSScriptRoot

[bool]$da = Get-DockerRunning
if(! $da) {
	Write-Error "docker must be running 1st"
	return 1
}

[int]$PORT=5432
[string]$NAME='postgressvr'
[string]$IMAGE='postgres:13.22-trixie'
[string]$USERNAME='postgres'
[string]$PASSWORD='password123-'
[string]$VOL="/var/lib/postgresql/data"

[string]$dbPath = Join-Path -Path $pwd -ChildPath "data"

$null = (setx POSTGRES_USER "${USERNAME}") 2> $null
$null = (setx POSTGRES_PASSWORD "${PASSWORD}") 2> $null

# Dispose of any old running ones
$null = (docker stop "${NAME}") 2> $null
$null = (docker rm "${NAME}") 2> $null

# Ensure clean pull of pinned image
$null = (docker pull $IMAGE) 2> $null

# Force a clean start
$pgDir =  Join-Path -Path $dbPath -ChildPath "pgdata"
$null = (Remove-Item -Path $pgDir -Recurse -Force) 2> $null

docker run -d -e "POSTGRES_USER=${USERNAME}" -e POSTGRES_PASSWORD="${PASSWORD}" -e PGDATA='/var/lib/postgresql/data/pgdata' --name="${NAME}" -p "${PORT}:${PORT}" -v "${dbPath}:${VOL}" postgres

Write-Output "Waiting for SQL to Start"

Start-Sleep -Seconds 30

Write-Output "Creating dvdrental from restoredb.sh"

docker exec -it "${NAME}" "sed -i 's/\r$//' ${VOL}/restoredb.sh"
docker exec -it "${NAME}" "chmod +x ${VOL}/restoredb.sh" 
docker exec -it "${NAME}" "${VOL}/restoredb.sh" 

Write-Output "PostgreSql running on ${PORT} as ${USERNAME} with ${PASSWORD}"