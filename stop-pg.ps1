[string]$NAME='postgressvr'

# Dispose of any old running ones
$null = (docker stop "${NAME}") 2> $null
$null = (docker rm "${NAME}") 2> $null