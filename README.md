# PS_convert_ifEntry

It is a script that outputs ifEntry(.1.3.6.1.2.1.2.2.1)<br>
after converting it to a table format On PowerShell.

## Requirement

* Net-SNMP(http://www.net-snmp.org/)
* PowerShell 5.1 or Later

## Usage

```
> snmpwalk -On -v 2c -c <community> <target_ip> .1.3.6.1.2.1.2.2.1 | ./convert_ifEntry.ps1
```

## Execution example(Sample Data)

```
PS D:\PS_convert_ifEntry> Get-Content .\sample\sample.txt
.1.3.6.1.2.1.2.2.1.1.1 = INTEGER: 1
.1.3.6.1.2.1.2.2.1.1.2 = INTEGER: 2
.1.3.6.1.2.1.2.2.1.1.3 = INTEGER: 3
.1.3.6.1.2.1.2.2.1.1.4 = INTEGER: 4
.1.3.6.1.2.1.2.2.1.1.5 = INTEGER: 5
.1.3.6.1.2.1.2.2.1.1.6 = INTEGER: 6
.1.3.6.1.2.1.2.2.1.1.7 = INTEGER: 7
.1.3.6.1.2.1.2.2.1.1.8 = INTEGER: 8
  ...
  ...
.1.3.6.1.2.1.2.2.1.2.1 = STRING: GigabitEthernet0/0
.1.3.6.1.2.1.2.2.1.2.2 = STRING: Null0
.1.3.6.1.2.1.2.2.1.2.3 = STRING: unrouted VLAN 1
.1.3.6.1.2.1.2.2.1.2.4 = STRING: unrouted VLAN 1002
.1.3.6.1.2.1.2.2.1.2.5 = STRING: unrouted VLAN 1004
.1.3.6.1.2.1.2.2.1.2.6 = STRING: unrouted VLAN 1005
.1.3.6.1.2.1.2.2.1.2.7 = STRING: unrouted VLAN 1003
.1.3.6.1.2.1.2.2.1.2.8 = STRING: GigabitEthernet1/0/1
.1.3.6.1.2.1.2.2.1.2.9 = STRING: GigabitEthernet1/0/2
.1.3.6.1.2.1.2.2.1.2.10 = STRING: GigabitEthernet1/0/3
.1.3.6.1.2.1.2.2.1.2.11 = STRING: GigabitEthernet1/0/4
  ...
  ...
PS D:\PS_convert_ifEntry> Get-Content .\sample\sample1.txt | .\PS_convert_ifEntry.ps1
ifIndex   ifDesc                        ifMtu  ifSpeed     ifAdminStatus ifOperStatus  ifLastChange                    ifInOctets    ifOutOctets
1         GigabitEthernet0/0            1500   1000000000  down(2)       down(2)       (78380142) 9 days, 1:43:21.42   0             0
2         Null0                         1500   4294967295  up(1)         up(1)         (78380328) 9 days, 1:43:23.28   0             0
3         unrouted VLAN 1               1500   4294967295  testing(3)    unknown(4)    (78364910) 9 days, 1:40:49.10
4         unrouted VLAN 1002            1500   4294967295  testing(3)    unknown(4)    (78364910) 9 days, 1:40:49.10
5         unrouted VLAN 1004            1500   4294967295  testing(3)    unknown(4)    (78364910) 9 days, 1:40:49.10
6         unrouted VLAN 1005            1500   4294967295  testing(3)    unknown(4)    (78364910) 9 days, 1:40:49.10
7         unrouted VLAN 1003            1500   4294967295  testing(3)    unknown(4)    (78364910) 9 days, 1:40:49.10
8         GigabitEthernet1/0/1          1500   1000000000  up(1)         up(1)         (78380330) 9 days, 1:43:23.30   1417965       1058025
9         GigabitEthernet1/0/2          1500   1000000000  up(1)         down(2)       (78380030) 9 days, 1:43:20.30   0             0
10        GigabitEthernet1/0/3          1500   1000000000  down(2)       down(2)       (78380050) 9 days, 1:43:20.50   0             0
11        GigabitEthernet1/0/4          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
12        GigabitEthernet1/0/5          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
13        GigabitEthernet1/0/6          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
14        GigabitEthernet1/0/7          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
15        GigabitEthernet1/0/8          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
16        GigabitEthernet1/0/9          1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
17        GigabitEthernet1/0/10         1500   1000000000  down(2)       down(2)       (78380051) 9 days, 1:43:20.51   0             0
18        GigabitEthernet1/0/11         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
19        GigabitEthernet1/0/12         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
20        GigabitEthernet1/0/13         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
21        GigabitEthernet1/0/14         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
22        GigabitEthernet1/0/15         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
23        GigabitEthernet1/0/16         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
24        GigabitEthernet1/0/17         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
25        GigabitEthernet1/0/18         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
26        GigabitEthernet1/0/19         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
27        GigabitEthernet1/0/20         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
28        GigabitEthernet1/0/21         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
29        GigabitEthernet1/0/22         1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
30        GigabitEthernet1/0/23         1500   1000000000  up(1)         up(1)         (78380330) 9 days, 1:43:23.30   12246537      6416874
31        GigabitEthernet1/0/24         1500   1000000000  up(1)         up(1)         (78380330) 9 days, 1:43:23.30   701494        10123652
32        GigabitEthernet1/1/1          1500   1000000000  up(1)         up(1)         (78542457) 9 days, 2:10:24.57   2966021       966691
33        GigabitEthernet1/1/2          1500   1000000000  up(1)         up(1)         (78613821) 9 days, 2:22:18.21   1278151       1043005
34        GigabitEthernet1/1/3          1500   1000000000  down(2)       down(2)       (78380052) 9 days, 1:43:20.52   0             0
35        GigabitEthernet1/1/4          1500   1000000000  down(2)       down(2)       (78380053) 9 days, 1:43:20.53   0             0
  ...
  ...
PS D:\PS_convert_ifEntry> 

```

## Licence

[MIT](https://github.com/NobuyukiInoue/PS_convert_ifEntry/blob/master/LICENSE)

## Author

[Nobuyuki Inoue](https://github.com/NobuyukiInoue/)
