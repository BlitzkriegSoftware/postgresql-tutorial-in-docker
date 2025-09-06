<#
    Run the base DB setup on Docker image
#>

<#
	
    .SYNOPSIS
       Start PostgreSQL Bash Session

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
docker exec --workdir "${VOL}" "${NAME}" "${VOL}/${script}"