
### [Widgets Menu](#widgets-menu)

This menu contains a list of 'widgets' for displaying information about the nodes of the currently running topology. To see these information, place the mouse pointer on the virtual node of interest after selecting a widget.

![Widgets menu](./assets/widgets_menu.png){#fig:widgets_menu width=20%}

Selecting a widget and hovering the mouse cursor over a node executes the associated command and displays its output in a GUI popup. These commands are designed for fast responses and therefore time out after 0.1 seconds to prevent them from blocking the GUI.

The pre-existing widgets are:

  * *None* - Disable widgets - do not run any commands on mouse-hover.
  * *ifconfig* - `ifconfig` - Show network interfaces parameters.
  * *IPv4 Routing table* - `netstat -4 -rn` - Show the IPv4 routing table.
  * *IPv6 Routing table* - `netstat -6 -rn` - Show the IPv6 routing table.
  * *RIP routes info* - `vtysh -c 'show ip rip'` - Show the RIP routing information.
  * *RIPng routes info* - `vtysh -c 'show ip rip'` - Show the RIPng routing information.
  * *Process list* - `ps ax` - Show the running processes.
  * *IPv4 sockets* - `netstat -4 -an` - Show the IPv4 sockets.
  * *IPv6 sockets* - `netstat -6 -an` - Show the IPv6 sockets.
  * *View ifaces startup script* - `cat /var/imunes/*/*/{boot,custom}_ifaces.conf` - Show the interfaces startup script
  * *View ifaces startup logs* - `cat /var/imunes/*/*/{out,err}_ifaces.log` - Show the interfaces startup logs
  * *View startup script* - `cat /var/imunes/*/*/{boot,custom}.conf` - Show the startup script
  * *View startup logs* - `cat /var/imunes/*/*/{out,err}.log` - Show the startup logs
  * *List files* - `ls` - Show files in the node working directory.
  * *Custom...* - Allows the specification of the custom command that will be executed inside a virtual node.
