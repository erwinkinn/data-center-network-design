! Arista vEOS 4.20.1F
! LEAF interfaces configuration.
! All uppercase values are boilerplates.
! Use m4 preprocessor (or similar) to define your values.

enable
configure terminal
hostname HOSTNAME 
ip routing

router isis underlay
net 49.ZONE.0100.0100.DEVICE.00
is-type level-1
address-family ipv4 unicast
exit
exit

interface Ethernet 1
description To spine-1
no switchport
ip address ETH1
isis enable underlay
isis circuit-type level-1
isis network point-to-point
isis bfd
exit

interface Ethernet 2 
description To spine-2
no switchport
ip address ETH2
isis enable underlay
isis circuit-type level-1
isis network point-to-point
isis bfd
exit

interface Loopback 1
ip address LO1
isis enable underlay
isis passive
exit

interface Loopback 2
ip address LO2
isis enable underlay
isis passive
exit

