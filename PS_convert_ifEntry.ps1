##------------------------------------------------------------------------------------------------##
## It is a script that outputs ifIndex(.1.3.6.1.2.1.2.2.1)
## after converting it to a table format.
##
## Usage)
## snmpwalk -On -v 2c -c <community> <target_ip> 1.3.6.1.2.1.2.2.1 | ./convert_ifIndex.ps1
##------------------------------------------------------------------------------------------------##
param($IFS)

if (-Not($IFS)) {
    $IFS = ""
  # $IFS = "`t"
  # $IFS = ";"
}
else {
    $IFS = $IFS.Replace("\t", "`t")
    $IFS = $IFS.Replace("\r", "`r")
    $IFS = $IFS.Replace("\n", "`n")
}

class ifValues {
    [string] $OID
    [string] $OIDRegular
    [string] $Name
    $table = @{}

    Init($oid, $name) {
        $this.Name = $name
        $this.OID = $oid
        $this.OIDRegular = "^" + $this.OID.Replace("." ,"\.")
    }
}

$ifIndex = New-Object ifValues
$ifIndex.Init(".1.3.6.1.2.1.2.2.1.1.", "ifIndex")

$ifDescr = New-Object ifValues
$ifDescr.Init(".1.3.6.1.2.1.2.2.1.2.", "ifDescr")

$ifType = New-Object ifValues
$ifType.Init(".1.3.6.1.2.1.2.2.1.3.", "ifType")

$ifMtu = New-Object ifValues
$ifMtu.Init(".1.3.6.1.2.1.2.2.1.4.", "ifMtu")

$ifSpeed = New-Object ifValues
$ifSpeed.Init(".1.3.6.1.2.1.2.2.1.5.", "ifSpeed")

$ifPhysAddress = New-Object ifValues
$ifPhysAddress.Init(".1.3.6.1.2.1.2.2.1.6.", "ifPhysAddress")

$ifAdminStatus = New-Object ifValues
$ifAdminStatus.Init(".1.3.6.1.2.1.2.2.1.7.", "ifAdminStatus")

$ifOperStatus = New-Object ifValues
$ifOperStatus.Init(".1.3.6.1.2.1.2.2.1.8.", "ifOperStatus")

$ifLastChange = New-Object ifValues
$ifLastChange.Init(".1.3.6.1.2.1.2.2.1.9.", "ifLastChange")

$ifInOctets = New-Object ifValues
$ifInOctets.Init(".1.3.6.1.2.1.2.2.1.10.", "ifInOctets")

<#
$ifInUcastPkts = New-Object ifValues
$ifInUcastPkts.Init(".1.3.6.1.2.1.2.2.1.11.", "ifInUnicastPkts")

$ifInDiscards = New-Object ifValues
$ifInDiscards.Init(".1.3.6.1.2.1.2.2.1.13.", "ifInDiscards")

$ifInErrors = New-Object ifValues
$ifInErrors.Init(".1.3.6.1.2.1.2.2.1.14.", "ifInErrors")

$ifInUnknownProtos = New-Object ifValues
$ifInUnknownProtos.Init(".1.3.6.1.2.1.2.2.1.15.", "ifInUnknownProtos")
#>

$ifOutOctets = New-Object ifValues
$ifOutOctets.Init(".1.3.6.1.2.1.2.2.1.16.", "ifOutOctets")

<#
$ifOutUcastPkts = New-Object ifValues
$ifOutUcastPkts.Init(".1.3.6.1.2.1.2.2.1.17.", "ifOutUcastPkts")

$ifOutDiscards = New-Object ifValues
$ifOutDiscards.Init(".1.3.6.1.2.1.2.2.1.19.", "ifOutDiscards")

$ifOutErrors = New-Object ifValues
$ifOutErrors.Init(".1.3.6.1.2.1.2.2.1.20.", "ifOutErrors")
#>

foreach ($line in $input) {

#   Write-Output $line

    switch -Regex ($line) {
        $ifIndex.OIDRegular {
            $line = $line.Replace($ifIndex.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifIndex.table[[int]$flds[0]] = [int]$flds[1].Replace("INTEGER: ", "")
            }
            break
        }
        $ifDescr.OIDRegular {
            $line = $line.Replace($ifDescr.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifDescr.table[[int]$flds[0]] = $flds[1].Replace("STRING: ", "")
            }
            break
        }
        $ifType.OIDRegular {
            $line = $line.Replace($ifType.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifType.table[[int]$flds[0]] = $flds[1].Replace("INTEGER: ", "")
            }
            break
        }
        $ifMtu.OIDRegular {
            $line = $line.Replace($ifMtu.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifMtu.table[[int]$flds[0]] = $flds[1].Replace("INTEGER: ", "")
            }
            break
        }
        $ifSpeed.OIDRegular {
            $line = $line.Replace($ifSpeed.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifSpeed.table[[int]$flds[0]] = $flds[1].Replace("Gauge32: ", "")
            }
            break
        }
        $ifPhysAddress.OIDRegular {
            $line = $line.Replace($ifPhysAddress.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifPhysAddress.table[[int]$flds[0]] = $flds[1].Replace("STRING: ", "")
            }
            break
        }
        $ifAdminStatus.OIDRegular {
            $line = $line.Replace($ifAdminStatus.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifAdminStatus.table[[int]$flds[0]] = $flds[1].Replace("INTEGER: ", "")
            }
            break
        }
        $ifOperStatus.OIDRegular {
            $line = $line.Replace($ifOperStatus.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifOperStatus.table[[int]$flds[0]] = $flds[1].Replace("INTEGER: ", "")
            }
            break
        }
        $ifLastChange.OIDRegular {
            $line = $line.Replace($ifLastChange.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifLastChange.table[[int]$flds[0]] = $flds[1].Replace("Timeticks: ", "")
            }
            break
        }
        $ifInOctets.OIDRegular {
            $line = $line.Replace($ifInOctets.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifInOctets.table[[int]$flds[0]] = $flds[1].Replace("Counter32: ", "")
            }
            break
        }
        $ifOutOctets.OIDRegular {
            $line = $line.Replace($ifOutOctets.OID, "")
            $flds = $line -split " = "
            if ($flds.Length -gt 1) {
                $ifOutOctets.table[[int]$flds[0]] = $flds[1].Replace("Counter32: ", "")
            }
            break
        }
    }
}

##------------------------------------------------------------------##
## Note!
## The type of $ifIndex.table is changed from a{} to a()
##------------------------------------------------------------------##
$ifIndex.table = $ifIndex.table.GetEnumerator() | sort -Property key

if ($IFS -eq "") {
    $format = "{0,-10}{1,-30}{2,-7}{3,-12}{4,-14}{5,-14}{6,-32}{7,-14}{8,-14}"
    Write-Output ($format -f `
        "ifIndex" `
      , "ifDesc" `
      , "ifMtu" `
      , "ifSpeed" `
      , "ifAdminStatus" `
      , "ifOperStatus" `
      , "ifLastChange" `
      , "ifInOctets" `
      , "ifOutOctets" `
    )

    #foreach ($index in $ifIndex.table.Keys) {
    foreach ($index in $ifIndex.table) {
        Write-Output ($format -f `
        # $ifIndex.table[$index.Key] `
          $index.Key `
        , $ifDescr.table[$index.Key] `
        , $ifMtu.table[$index.Key] `
        , $ifSpeed.table[$index.Key] `
        , $ifAdminStatus.table[$index.Key] `
        , $ifOperStatus.table[$index.Key] `
        , $ifLastChange.table[$index.Key] `
        , $ifInOctets.table[$index.Key] `
        , $ifOutOctets.table[$index.Key] `
        )
    }
}
else {
    $format = "{0}$IFS{1}$IFS{2}$IFS{3}$IFS{4}$IFS{5}$IFS{6}$IFS{7}$IFS{8}"
    Write-Output ($format -f `
        "ifIndex" `
      , "ifDesc" `
      , "ifMtu" `
      , "ifSpeed" `
      , "ifAdminStatus" `
      , "ifOperStatus" `
      , "ifLastChange" `
      , "ifInOctets" `
      , "ifOutOctets" `
    )

    #foreach ($index in $ifIndex.table.Keys) {
    foreach ($index in $ifIndex.table) {
        Write-Output ($format -f `
        # $ifIndex.table[$index.Key] `
          $index.Key `
        , $ifDescr.table[$index.Key] `
        , $ifMtu.table[$index.Key] `
        , $ifSpeed.table[$index.Key] `
        , $ifAdminStatus.table[$index.Key] `
        , $ifOperStatus.table[$index.Key] `
        , $ifLastChange.table[$index.Key] `
        , $ifInOctets.table[$index.Key] `
        , $ifOutOctets.table[$index.Key] `
        )
    }
}
