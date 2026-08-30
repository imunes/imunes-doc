Enable VLAN filteringWhen VLAN filtering is enabled, each interface can be configured as either `trunk` or `access`. Each `access` interface must also be assigned a VLAN tag (**NOTE**: setting VLAN tag to 1 skips configuring that interface).

The switch behaves like a standard VLAN-aware switch. Frames received on `trunk` interfaces are accepted regardless of their VLAN tag, including untagged frames. Tagged frames are forwarded to interfaces belonging to the corresponding VLAN, while untagged frames are forwarded to other `trunk` interfaces.

Frames received on `access` interfaces are assigned the VLAN tag configured for that interface. The switch then forwards them to the appropriate `trunk` interfaces with the VLAN header included, or to `access` interfaces assigned to the same VLAN, without the VLAN header.

VLAN stacking is also supported. The switch does not inspect or process inner VLAN headers: it treats them as part of the frame payload and handles the frame based only on the outer-most VLAN header.
