! Arista vEOS 4.20.1F
! LEAF interfaces configuration.
! All uppercase values are boilerplates.
! Use m4 preprocessor (or similar) to define your values.

enable
configure terminal
hostname HOSTNAME 

interface Ethernet 1
  description To Spine 1 
  no switchport
  ip address ETH1 
  no shutdown

interface Ethernet 2
  description To Spine 2 
  no switchport
  ip address ETH2 
  no shutdown
  
interface loopback 1
  ip address LO1 

interface loopback 2
  ip address LO2 
