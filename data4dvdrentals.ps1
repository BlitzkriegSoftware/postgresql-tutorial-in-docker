<#
	
    .SYNOPSIS
       Restore DVD Rental Data

    .DESCRIPTION
        See above
    
    .INPUTS
        none

    .OUTPUTS
        Sucess or failure 
#>

[string]$NAME='postgressvr'
[string]$USERNAME='postgres'
[string]$PASSWORD='password123-'
[string]$DBNAME="dvdrental"
[string]$POSTDB="postgres"

#
# Main
#

Set-StrictMode -Version 2.0
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12
Push-Location $PSScriptRoot


Write-Output "Creating dvdrental from sql script"

docker exec -it "${NAME}" "/usr/bin/psql -c CREATE DATABASE ${DBNAME}" "user=${USERNAME} dbname=${POSTDB} password=${PASSWORD}"
docker exec -it "${NAME}" "/usr/bin/psql -f '/var/lib/postgresql/data/dvdrental/people-table-data.txt'" "user=${USERNAME} dbname=${DBNAME} password=${PASSWORD}" 
