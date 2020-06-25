param($target, $community)

if (-Not($target)) {
    Write-Host "Usage :"$MyInvocation.MyCommand.Name"<target> <community>"
    exit
}

if (-Not($community)) {
    $community = "public"
}

$OID = ".1.3.6.1.2.1.2.2.1"
$walkResult = snmpwalk -On -v 2c -c $community $target $OID

if ($walkResult -eq $NULL) {
    Write-Output $walkResult
    exit
}

$walkResult | ./PS_convert_ifEntry.ps1
