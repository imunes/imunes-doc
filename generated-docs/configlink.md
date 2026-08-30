
### [Link from](#link-from)

Defines the two endpoints connected by the link:

  * `Normal` links use an intermediate bridge/switch segment when required by the platform.
  * `Direct` links connect endpoints directly without an intermediate bridge.

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

### [Jitter mode](#jitter-mode)

Select how configured jitter values are applied. `sequential` uses the values in order; `random` selects values randomly.

### [Jitter hold](#jitter-hold)

Time in milliseconds for which a selected jitter value remains active before the next value is used.

### [Jitter values](#jitter-values)

List of jitter values in milliseconds, one value per line. Values are configured separately for each link direction.
