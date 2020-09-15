# Webinar "Władcy Sieci" o EIGRP z 15 września 2020

## Diagram labu demo
![Lab diagram](https://github.com/SzkolaDevNet/WladcySieci/blob/master/Webinary/EIGRP/EIGRP%20Lab%20diagram.png)

## Adresacja

```
L3 interfaces addressing
+----------+--------------------+--------------+----------+--------------------+--------------+
| Device A |    Interface A     | IP Address A | Device B |    Interface B     | IP Address B |
+----------+--------------------+--------------+----------+--------------------+--------------+
|  iosv-2  | GigabitEthernet0/1 | 10.0.0.21/30 |  iosv-1  | GigabitEthernet0/1 | 10.0.0.22/30 |
|  iosv-2  | GigabitEthernet0/2 | 10.0.0.25/30 |  iosv-3  | GigabitEthernet0/2 | 10.0.0.26/30 |
|  iosv-1  | GigabitEthernet0/3 | 10.0.0.29/30 |  iosv-3  | GigabitEthernet0/3 | 10.0.0.30/30 |
|  iosv-4  | GigabitEthernet0/1 | 10.0.0.33/30 |  iosv-3  | GigabitEthernet0/1 | 10.0.0.34/30 |
|  iosv-2  | GigabitEthernet0/3 | 10.0.0.37/30 |  iosv-4  | GigabitEthernet0/3 | 10.0.0.38/30 |
|  iosv-1  | GigabitEthernet0/2 | 10.0.0.41/30 |  iosv-4  | GigabitEthernet0/2 | 10.0.0.42/30 |
+----------+--------------------+--------------+----------+--------------------+--------------+
```

```
Loopback interfaces addressing
+-------------+------------------+
| Device name |   Loopback IP    |
+-------------+------------------+
|    iosv-0   | 192.168.255.1/32 |
|    iosv-1   | 192.168.255.2/32 |
|    iosv-2   | 192.168.255.3/32 |
|    iosv-3   | 192.168.255.4/32 |
|    iosv-4   | 192.168.255.5/32 |
+-------------+------------------+
```

```
Management interfaces addressing
+-------------+----------------+
| Device name | Management IP  |
+-------------+----------------+
|    iosv-0   | 172.16.1.71/24 |
|    iosv-1   | 172.16.1.72/24 |
|    iosv-2   | 172.16.1.73/24 |
|    iosv-3   | 172.16.1.74/24 |
|    iosv-4   | 172.16.1.75/24 |
+-------------+----------------+

```
