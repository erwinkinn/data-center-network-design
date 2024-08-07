! Arista vEOS 4.20.1F
! LEAF interfaces configuration.
! All uppercase values are boilerplates.
! Use m4 preprocessor (or similar) to define your values.

enable
configure terminal
hostname HOSTNAME 
ip routing

interface Ethernet 1
description Spine-1 
no switchport
ip address ETH1 
bfd static neighbor ETH1_BFD_NBR
no shutdown
exit

interface Ethernet 2 
description Spine-2
no switchport
ip address ETH2
bfd static neighbor ETH2_BFD_NBR
no shutdown
exit

interface Loopback 1
ip address LO1 
exit

interface Loopback 2
ip address LO2 
exit

router bgp LOCAL_AS 
! Define router ID as the Loopback 1's address
define(ROUTER_ID, substr(LO1, 0, index(LO1, /)))
router-id ROUTER_ID 
timers bgp 3 9
maximum-paths 10 ecmp 10
neighbor spines peer-group
neighbor spines remote-as REMOTE_AS 
neighbor spines allowas-in 1
neighbor NBR1 peer-group spines
neighbor NBR2 peer-group spines
network LO1 

