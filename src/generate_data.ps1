<#
    Invokes Data Generation
#>

param(
    [string]$Year = '2024',
    [int]$Number = 100
)

function Get-MajorVersion([string]$version) {
    [int]$major = 0;
    if(-not [string]::IsNullOrWhiteSpace($version)) {
        [int]$index = $version.IndexOf('.');
        if($index -gt 0) {
            [string]$t = $version.Substring(0, $index ).ToLower().Trim();
            $t = $t.Replace('v','');
            $major = [System.Convert]::ToInt32($t);
        }
    }
    return $major;
}

[int]$NPM_MIN = 11;
[int]$NODE_MIN = 24;
$npm_text = $(npm --version) 2> $null
$npm_ver = Get-MajorVersion($npm_text)
$node_text = $(node --version) 2> $null
$node_ver = Get-MajorVersion($node_text);

Write-Output "Node ${node_text} (${node_ver}), NPM ${npm_text} (${npm_ver})"
if($npm_ver -lt $NPM_MIN -or $node_ver -lt $NODE_MIN)
{
    Write-Error "Node must be version ${NODE_MIN} or higher, and NPM must be ${NPM_MIN} or higher"
    return 1;
}

Push-Location $PSScriptRoot

# restore packages
$NULL = (npm i) 2> $null

# run script
npx ts-node index.ts -n="${Number}" -y="${Year}"

Pop-Location