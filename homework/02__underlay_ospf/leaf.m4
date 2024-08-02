! Arista vEOS 4.20.1F
! LEAF interfaces configuration.
! All uppercase values are boilerplates.
! Use m4 preprocessor (or similar) to define your values.

enable
configure terminal
hostname HOSTNAME 
ip routing

interface Ethernet 1
description To spine-1 
no switchport
ip address ETH1 
ip ospf network point-to-point
ip ospf area 0.0.0.0
exit

interface Ethernet 2 
description To spine-2
no switchport
ip address ETH2
ip ospf network point-to-point
ip ospf area 0.0.0.0
exit

interface Loopback 1
ip address LO1 
exit

interface Loopback 2
ip address LO2 
exit

router ospf 42 
bfd all-interfaces
! We define the OSPF router ID as the Lo1 address
define(ROUTER_ID, substr(LO1, 0, index(LO1, /)))
router-id ROUTER_ID 
network LO1 area 0.0.0.0
network LO2 area 0.0.0.0
passive-interface Loopback 1-2
exit

