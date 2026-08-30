
## [Link Options](#link-options)

Right-clicking on the link opens a popup menu with options pertaining to that link.

  * *Configure* - Opens a *Configuration* window for this link to change functional and visual options such as bandwidth, delay, color, width, etc. For more information, check documentation section [Link Configuration](#link-configuration) and sections for specific options.
  * *Clear all settings* - Remove all link emulation settings (bandwidth, delay, BER, loss, duplication) from the link. This change will immediately trigger link reconfiguration.
  * *Direct link* - Toggle between `normal` and `direct` link mode of operation: `normal` links use an intermediate bridge/switch and `direct` links connect endpoints directly without any intermediate elements. For `External interface` and `External connection` node types, the behaviour of the `direct` link changes depending on its peer. For more information about `direct` links, check documentation section [IMUNES Architecture](#imunes-architecture).
  * *Delete* - Remove the link, including the interfaces on both endpoints.
  * *Delete (keep interfaces)* - Remove the link, but keep the interfaces on both endpoints. Due to the nature of `direct` links on Linux, interfaces will be first removed and then recreated.
  * *Split* - Visually splits the link and connects each endpoint to its peer's mirror `pseudo-node`. Each `pseudo-node` can be moved independently. When nodes are on different canvases, the links between them are automatically split. Splitting a segmented link temporarily removes its segmentation - the segmentation is restored when the link is merged. Split links cannot be segmented.
  * *Merge* - Reconnects a previously split link and deletes its `pseudo-nodes`. If the link was segmented before it was split, its previous segmentation is restored.
  * *Segment* - Adds a point to the middle of a link or an existing segment. The point can then be moved with the *Select tool* to change the appearance of the link. To delete a point, right-click it. Segmented links can be split - splitting temporarily removes the segmentation, which is restored when the link is merged.

## [Link Configuration](#link-configuration)

Double-clicking on the link, or choosing *Configuration* from the right-click menu opens a window with options to configure for that specific link.

### [Link from](#link-from)

Defines the two endpoints connected by the link.

### [Link bandwidth](#link-bandwidth)

Maximum link bandwidth in bits per second. Set this to 0 to leave bandwidth unlimited (or rather: limited by your hardware).

### [Link delay](#link-delay)

Propagation delay added to packets crossing this link, in microseconds. Set this to 0 for no additional delay.

### [Link BER](#link-ber)

(FreeBSD only)

Bit error rate expressed as 1/N. Smaller non-zero N values produce errors more frequently. Set this to 0 to disable BER emulation.

### [Link packet loss](#link-packet-loss)

(Linux only)

Percentage of packets dropped on this link. Set this to 0 for no artificial packet loss.

### [Link packet duplication](#link-packet-duplication)

Percentage of packets duplicated on this link. Set this to 0 to disable packet duplication.

### [Link width](#link-width)

Width of the link line on the canvas. This changes only the visual representation of the link.

### [Link color](#link-color)

Color of the link line on the canvas. This changes only the visual representation of the link.



