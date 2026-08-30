
#### [Configure External interface](#configure-external-interface)

'Steal' an interface from the host OS.

Depending on the type of link it connects to, the interface is handled differently.

FreeBSD:

  * *normal* link: the interface is moved to the experiment jail and bridged with the nodes interface
  * *direct* link: the interface is moved to the experiment jail and connected directly with the nodes interface
 
Linux:

  * *normal* link: the interface is moved into the experiment netns and bridged with the nodes interface
  * *direct* link: a new macvlan (or ipvlan if wireless) interface is created, and moved to the nodes namespace
