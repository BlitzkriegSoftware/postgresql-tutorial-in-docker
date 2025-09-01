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
docker exec -it "${NAME}" /bin/bash