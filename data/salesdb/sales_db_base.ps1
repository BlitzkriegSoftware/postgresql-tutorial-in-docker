<#
    .SYNOPSIS
       Create salesdb, schema, and seed data

    .DESCRIPTION
        See above
    
    .INPUTS
        none

    .OUTPUTS
        Sucess or failure 
#>
[string]$NAME='postgressvr'
[string]$VOL='/var/lib/postgresql/data/salesdb'
[string]$script='sales_db_base.sh'
[string]$FilePath = Join-Path -Path $PSScriptRoot -ChildPath ".\${script}"
(Get-Content -Raw -Path $FilePath) -replace "`r`n","`n" | Set-Content -Path $FilePath -NoNewline
docker exec --workdir "${VOL}" "${NAME}" "${VOL}/${script}"