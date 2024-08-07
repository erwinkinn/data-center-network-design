! Arista vEOS 4.20.1F
! SPINE interfaces configuration.
! All uppercase values are boilerplates.
! Use m4 preprocessor (or similar) to define your values.

enable
configure terminal
hostname HOSTNAME 
ip routing

interface Ethernet 1
description Leaf-1 
no switchport
ip address ETH1 
bfd static neighbor ETH1_BFD_NBR
no shutdown
exit

interface Ethernet 2
description Leaf-2 
no switchport
ip address ETH2 
bfd static neighbor ETH2_BFD_NBR
no shutdown
exit

interface Ethernet 3
description Leaf-3 
no switchport
ip address ETH3 
bfd static neighbor ETH3_BFD_NBR
no shutdown
exit

interface loopback 1
ip address LO1 
exit

interface loopback 2
ip address LO2 
exit

peer-filter leafs 
10 match as-range RANGE result accept
exit

router bgp AS 
! Define router ID as the Loopback 1's address
define(ROUTER_ID, substr(LO1, 0, index(LO1, /)))
router-id ROUTER_ID 
timers bgp 3 9
maximum-paths 10 ecmp 10
neighbor leafs peer-group
bgp listen range SUBNET peer-group leafs peer-filter leafs 
network LO1 

