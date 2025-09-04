<#
    Convert-to-Quoted-Delimited
#>
$filein = 'f100.csv'
$fileout = 'f100-PS.csv'
import-csv -LiteralPath $filein | export-csv -LiteralPath $fileout -NoTypeInformation -Encoding UTF8 -QuoteFields Company,Ticker