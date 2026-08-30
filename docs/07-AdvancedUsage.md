# [Advanced Usage](#advanced-usage)

## [Extended Network Scenario](#extended-network-scenario)

In this section we will show how to extend the simple network topology (see
[Simple Network Scenario](#simple-network-scenario)). We will explain the
additional possibilities of building and configuring the extended network
scenario:

The simple network topology is placed in the *office-canvas* while the
additional elements are placed in the *roadwarrior-canvas*. The
*roadwarrior-canvas* consists of a router (*roadwarrior-router*), a PC
(*roadwarrior*) and a physical interface. The *roadwarrior-router* is connected
to the *office-router* on the *office-canvas* through the 192.168.3.0/24
network, the PC is in the 161.53.19.0/24 network whereas the physical interface
is in the 161.53.20.0/24 network.

We will now extend the simple network from the last chapter by adding the
*roadwarrior-router*, *roadwarrior* and the physical interface all placed on
another canvas. To open an existing IMUNES network configuration file use *File
$\to$ Open* from the menubar or start IMUNES with the imn file as an argument:
`imunes simple-topology.imn`. Check that you are in the edit mode. If not,
switch with *Experiment $\to$ Terminate*.

### [Canvas Management](#canvas-management)

To facilitate building of complex and large network topologies IMUNES lets you
divide the network topology into a set of network layers. These network layers
are called canvases.

Canvas management consists of two main elements:

 * Canvas menu in the menubar ([@fig:canvas_menu])
 * List of canvas tabs at the bottom of the main window, above the statusbar
   ([@fig:canvas_tabs_list])

![Canvas Tabs\
](./assets/canvas_tabs_list.png
){#fig:canvas_tabs_list}

To add a new canvas use the *Canvas $\to$ New* option from the menubar or
double click on the empty space in the canvas tabs list at the bottom of the
window.

You can rename the canvas with the *Canvas $\to$ Rename* option from the
menubar or double click on the canvas tab in the canvas tabs list.
([@fig:canvas_rename]) Similarly the *Canvas $\to$ Delete* option deletes the
active canvas.

![Canvas rename dialog\
](./assets/canvas_rename.png
){#fig:canvas_rename}

There is also the option *Canvas $\to$ Resize* that allows you to define a
custom canvas size in pixels. The default canvas size is 900x620 pixels
([@fig:canvas_resize]).

![Canvas resize dialog\
](./assets/canvas_resize.png
){#fig:canvas_resize}

Canvas selection can be done with the options from the *Canvas* menu
(*Previous, Next, First, Last*) or simply by clicking the tab with the canvas
name on it.

Rename the existing canvas *Canvas0* into *office-canvas*. Add a new canvas,
rename it into *roadwarrior-canvas* and select it as the active canvas. 

This canvas is empty so we will add a router by selecting the router tool and
clicking on the empty canvas. Rename this router into *roadwarrior-router*.
Switch to the *office-canvas*. Now we will connect the *office-router* and the
*roadwarrior-router*. To do that, right click on the *office-router* and select
*Create link to $\to$ roadwarrior-canvas $\to$ roadwarrior-router* option
([@fig:create_link_to]) from the popped up menu. This will create a link
between *roadwarrior-router* and *office-router*.

![Create link to\
](./assets/create_link_to.png
){#fig:create_link_to}

On the *office-router* set the *eth2* interface IPv4 address to 192.168.3.1/24.
On the *roadwarrior-router* set the *eth0* interface IPv4 address to
192.168.3.2/24. We will add another PC to the *roadwarrior-canvas*, name it
*roadwarrior* and connect it with the *roadwarrior-router*. On the
*roadwarrior* set the eth0 IPv4 address to 161.53.19.100/24. On the
*roadwarrior-router* set the eth1 IPv4 address to 161.53.19.1/24.

The *roadwarrior-router* uses the same dynamic routing model (quagga) as the
*office-router* and we do not need to configure anything else on the router.
The *roadwarrior* uses static routes and we will need to change the default
route gateway in static routes field of the *roadwarrior* configuration window
to 0.0.0.0/0 161.53.19.1.

Finally, the configured network topology should look like the following
([@fig:office_canvas] and [@fig:roadwarrior_canvas]):

![office-canvas\
](./assets/office_canvas.png
){#fig:office_canvas}

![roadwarrior-canvas\
](./assets/roadwarrior_canvas.png
){#fig:roadwarrior_canvas}
 
Both the *roadwarrior* and *roadwarrior-router* can be easily moved from
*roadwarrior-canvas* to *office-canvas* with the *Move To $\to$ office-canvas*
from the node menu. The link between *roadwarrior-router* and *office-router*,
as well as any other link, can be deleted with the *Delete* option from the
*Link* menu. To open the *link* menu, use the right click on the link and
choose the *Delete* option.

When we are done with network configuration, we can start the experiment with
*Experiment $\to$ Execute* from the menubar. We can now check that the
*roadwarrior* can ping both networks (192.168.1.0/24, 192.168.2.0/24) and
additionally, that the network 192.168.1.0/24 does not have an access to the
*roadwarrior*, but it has access to the 192.168.2.0/24 network.

### [Attaching an External Interface](#attaching-an-external-interface)

The *External interface* tool from the toolbox provides the possibility to
attach a physical interface to a virtual node. This way the virtual network is
able to communicate with nodes from the external network.

We will now add the external interface to the *roadwarrior-canvas*. To add a
external interface to the canvas select the *External interface* tool and click
on the canvas.

*External interface* nodes can be connected either with the LAN switch or the
router. Connect the newly created external interface with the virtual node
*roadwarrior-router* using the *Link* tool from the toolbox or the *Create link
to* option from the node menu.

The newly created external interface node is unassigned and in the node name
field it contains *UNASSIGNED*. Open the external interface configuration
window with a double click or right click on it and select the *Configure*
option. Choose the name of the designated physical interface in the *Physical
interface* drop-down list, e.g. em1, obtained from `ifconfig -a` command ran on
the physical machine (outside IMUNES). ([@fig:rj45_conf]) The name of the
physical interface will appear in the node name label. It is also possible to
assign a VLAN tag to it. ([@fig:rj45_canvas])

![External interface configuration dialog\
](./assets/rj45_conf.png
){#fig:rj45_conf}

![External interface node label\
](./assets/rj45_canvas.png
){#fig:rj45_canvas}

Check that *roadwarrior-router* has a properly configured IP address on the
network interface connected to the physical interface. Additionally, check that
routes which route packets between virtual network and the external network
through the physical interface exist in both the external network and in the
virtual network (on *roadwarrior-router*).

Save this configuration to a new file by selecting the *Save as* option from
the *File* menu. Name the file `extended-topology.imn`.

### [Attaching to a Running Experiment](#attaching-to-a-running-experiment)

IMUNES gives you the possibility to run multiple independent experiments on one
physical computer. Therefore, we added the possibility of attaching to running
experiments through the IMUNES GUI. In the *Experiment* menu, select the option
*Attach to experiment*. A dialog similar to [@fig:attach_to_experiment] is
opened. Here you can select on which experiment you would like to attach. You
can attach to all experiments, those that were started using batch mode and
those that were executed from the GUI. The window shows the following
experiment parameters:

 * Experiment ID
 * Filename of the topology
 * Time when the experiment was started.
 * Experiment screenshot (only if it was started through the GUI)

To attach to the you can double-click it's entry or use the *Resume
selected experiment* button.

![Attach to experiment window\
](./assets/attach_to_experiment.png
){#fig:attach_to_experiment}

## [Additional Configuration](#additional-configuration)

### [Custom Configuration](#custom-configuration)

The configuration window of each network layer node (PC, Host, Router, NAT64
and Click router) also has the *Custom startup configuration* field. In order
to view or edit the generated startup configuration click on the *Editor*
button as shown in [@fig:config_tab].

![Configuration tab\
](./assets/configuration_tab.png
){#fig:config_tab}

In a newly opened window, write a new configuration name and click *Create*. An
empty configuration file will be created. By clicking on *Fill defaults*, in
case of a non-router network layer node or a router node with the static
routing model, the default configuration consists of *ifconfig* and *route*
commands with the `/bin/sh` shell. [@fig:custom_config] shows the created
default configuration.

![Custom configuration window\
](./assets/custom_configuration.png
){#fig:custom_config}

It is possible to add custom commands that will be executed at the boot time.
When finished, click on the *Apply* or *Apply and Close* button to save the
changes. When you have multiple configurations, you can choose the default one
in the *Default configuration* drop-down menu. To delete a configuration,
select its tab and click *Delete config* button.

**NOTE:** After starting the network simulation, the new/custom configuration
will be considered only if *Custom startup configuration* is enabled. This is
done by checking the *Enabled* check box in the *Custom startup config* field
in [@fig:config_tab].

### [Physical and Logical Interfaces](#physical-and-logical-interfaces)

When the Interfaces tab is opened, a configuration window similar to the one
shown in [@fig:phys_log_ifc] is shown to the user. The Physical
Interfaces list represents actual interfaces connected to links in IMUNES. Thus
we can see that the selected node has one link in IMUNES.

IMUNES also offers the feature to configure additional logical interfaces. By
default only one logical interface is added: `lo0` - the loopback interface
with the following addresses: `127.0.0.1` for IPv4 and `::1` for IPv6. 

![Physical and logical interfaces\
](./assets/physical_logical_interfaces.png
){#fig:phys_log_ifc}

Users can configure additional logical interfaces by clicking on the Logical
Interfaces item in the Interfaces list. The Logical Interfaces configuration
window is show in [@fig:logical_ifcs]. At the moment IMUNES supports
two types of logical interfaces: `lo` and `vlan`.

![Logical interfaces management\
](./assets/logical_interfaces.png
){#fig:logical_ifcs}

[@fig:vlan_logical_ifcs] shows an example for setting up a `vlan`
logical interface `vlan0` on a physical interface `eth0` with an arbitrary tag
`10` and an IPv4 address `10.0.0.1/24`.

![Logical interfaces management\
](./assets/vlan_logical_interfaces.png
){#fig:vlan_logical_ifcs}

## [Advanced Node Options](#advanced-node-options)

{{include:generated-docs/advancedopts.md}}

## [Additional Tools](#additional-tools)

### [Splitting a Link](#splitting-a-link)

Links can be split in two separate parts and it is possible to change location
of both of its parts after selecting it with the *Select tool*. Right click on
the link and than left click on the *Split label* in the pop-up menu to split
the link in two halves. Separated link parts can be merged back with the
*Merge* option from the link menu. This feature is shown in [@fig:split_link].

![Split link\
](./assets/split_link.png
){#fig:split_link}

### [Generating a Network Topology](#generating-a-network-topology)

*TopoGen* menu from the menubar enables easier and faster generation of network
topologies ([@fig:topogen_menu_star]). This function can be used to generate
following topologies: *Chain, Star, Cycle, Wheel, Cube, Clique, Bipartite* or
*Random*. 

![TopoGen menu\
](./assets/topogen_menu_star.png
){#fig:topogen_menu_star}

Some examples can be seen in [@fig:star], [@fig:bipartite] and [@fig:wheel]. In
order to generate a topology first select the network layer nodes (router, host
or PC) from the toolbox and then the desired topology type e.g. bipartite graph
K(2,3) (see [@fig:bipartite]).

![Star topology\
](./assets/star.png
){#fig:star}

![Bipartite topology\
](./assets/bipartite.png
){#fig:bipartite}

![Wheel topology\
](./assets/wheel.png
){#fig:wheel}

In case of *random* topology an additional information is needed, so beside the
number of the nodes it is also necessary to specify the number of links. The
nodes in the random topology will be randomly connected with the number of
links specified before. An example of generating a *random* topology: 

 1. Select the router tool from the toolbox.
 2. Choose the random topology: *TopoGen $\to$ Random*
 3. Choose the desired number of nodes and links e.g. n = 6; m = 5, where n is
 the number of nodes and  m  the number of links in the generated network
 topology (*Random $\to$ R(6,m) $\to$ R(6,5)*). 

The result is shown in [@fig:random]. 

![Random topology\
](./assets/random.png
){#fig:random}
 
Using the *TopoGen* tool you can generate topologies containing one type of
node (router, host or PC). In that case, new nodes of the same type are created
and placed on the canvas. Another option is to add new nodes to canvas and then
connect them using the topology generator:

 1. Add nodes to the canvas (don't have to be same type). 
 2. Select nodes that should be included in the new topology
 3. Right click on one of the selected nodes and choose the option *Create Link
 to* from the menu. Choose the option *Selected* and select one of the offered
 topologies (*Chain, Star, Cycle, Clique* or *Random*). An example is shown in
 [@fig:connect]. 

In addition to that, it is also possible to transform existing nodes:

 1. Select nodes that should be transformed
 2. Right click on one of the selected nodes and choose the option *Transform
 to* from the menu. Select one of the offered options (*Router, PC* or *Host*).
 An example is shown in [@fig:transform].

![Example of creating a network topology with existing nodes\
](./assets/connect_1connect_2.png
){#fig:connect width=75%}

![Example of transforming existing network layer nodes\
](./assets/transform.png
){#fig:transform width=75%}

### [IPv4 Address Pool](#ipv4-address-pool)

*IPv4 address pool* option from the *Tools* menu is used for replacing default
10.0.0.0/24 address pool. Choosing that option invokes a dialog shown in
[@fig:ipv4_addr_pool].

![IPv4 address pool dialog\
](./assets/ipv4_addr_pool.png
){#fig:ipv4_addr_pool}

In order to replace default 10.0.0.0/24 address pool, set variable-mask IPv4
address pool through the invoked dialog. CIDR notation is required, so the IPv4
address needs to be followed by a slash and a network length. To apply changes
click on the *Apply* button. The given address pool will be applied to all the
subsequentially created network layer elements ([@fig:ipv4_addr_pool_example]).

![IPv4 address pool example\
](./assets/ipv4_addr_pool_example.png
){#fig:ipv4_addr_pool_example}

In order to apply the given address pool to selected elements, right click on
the network layer element and choose the option *IPv4 autorenumber* from the
popped up menu. In example shown in [@fig:ipv4_autorenumber_example] we have
set IPv4 address pool to 160.153.1.1/24, selected all network elements and
selected the option *IPv4 autorenumber* from the node menu to apply the given
address pool to selected elements.

![IPv4 autorenumber example\
](./assets/ipv4_autorenumber_example.png
){#fig:ipv4_autorenumber_example width=75%}

### [IPv6 Address Pool](#ipv6-address-pool)

*IPv6 address pool* option from the *Tools* menu is used for replacing default
fc00::/64 address pool.  The procedure for setting the IPv6 address pool is the
same as for setting the IPv4 address pool.

### [Routing Protocol Defaults](#routing-protocol-defaults)

In the *Tools* menu you can find the *Routing protocol defaults* option.
Selecting this option invokes a popup window shown in [@fig:router_def_1]. Just
as a reminder, settings referring to routing protocols can be also changed in
the *router configuration* window. The difference is that changes made there
are applied only to the router that is being configured. This tool in contrary
makes it possible to apply changes to one or more selected routers. If there is
no router selected than the changes will be applied to subsequentially created
routers. Note that this option will be disabled when the experiment starts.

![Router defaults window\
](./assets/router_defaults_1.png
){#fig:router_def_1}

## [Customizing Look](#customizing-look)

### [Annotations](#annotations)

To emphasize some parts of the network topology, you can add various graphic
elements to the canvas. These elements are divided into four groups:

     * Text
     * Freeform
     * Oval
     * Rectangle

Each of these elements have their own tools in the toolbox: *Text* tool
([@fig:text]), *Freeform* tool ([@fig:freeform]), *Oval* tool ([@fig:oval]) and
*Rectangle* tool ([@fig:rectangle]).

![Text tool\
](./assets/text_tool.png
){#fig:text}

![Freeform tool\
](./assets/freeform_tool.png
){#fig:freeform}

![Oval tool\
](./assets/oval_tool.png
){#fig:oval}

![Rectangle tool\
](./assets/rectangle_tool.png
){#fig:rectangle}

To add an annotation to the canvas, select the appropriate tool and click (and
drag) where you want to add the annotation. A popup window will be shown. There
you can define how will the annotation look.

When created, annotations can be moved around on the canvas. This is done by
using the select tool. Click on the annotation and then drag it to its
destination.

#### [Text](#text)

The text annotation lets you define the following options([@fig:text_conf]):

 * *Text color* - color of the text in RGB values
 * *Font* - which system font, size and style you want to use

![Text configuration window\
](./assets/text_conf.png
){#fig:text_conf}

#### [Freeform](#freeform)

The freeform configuration window includes:

	 * *Line color* - which line color to use
	 * *Width* - line width to use

![Freeform configuration window\
](./assets/freeform_conf.png
){#fig:freeform_conf}

#### [Oval](#oval)

The size of the oval annotation is defined by dragging the cursor on the canvas
while keeping the left mouse button pressed. When the annotation size seems to
be fine, release the mouse button. The oval configuration window will popup
([@fig:oval_conf]).

The oval annotation lets you define the following additional options
([@fig:oval_conf]):

 * *Fill color* - color of the annotation fill in RGB values.
 * *Border color* - color of the annotation border in RGB values.
 * *Border width* - width of the annotation border.

![Oval configuration window\
](./assets/oval_conf.png
){#fig:oval_conf}

#### [Rectangle](#rectangle)

The rectangle configuration window has the same options as the oval
configuration window. The rectangle size is defined the same way as the size of
the oval.

The rectangle annotation lets you define the following additional options
([@fig:rectangle_conf]):

 * *Radius of the bend at the corners* - defines roundness of the rectangle edges.

![Rectangle configuration window\
](./assets/rectangle_conf.png
){#fig:rectangle_conf}

Example of the annotations usage is shown in [@fig:annotations_example].

![Annotations example\
](./assets/annotations_example.png
){#fig:annotations_example}

### [Canvas Background Image](#canvas-background-image)

The options for changing the canvas background image are accessible through the
*Canvas* and *View* menu and through the menu that is opened with a right click
on the empty canvas ([@fig:canvas_menu] and [@fig:background_image_menu]).

![Background image menu\
](./assets/background_image_menu.png
){#fig:background_image_menu}

All options related to the canvas background are accessible in the *Background
image* menu ([@fig:background_image_menu]):

 * *Show background* - Show or hide the canvas background.
 * *Change background* - Opens the *Change canvas background* window ([@fig:change_canvas_background]).
 * *Remove background* - Removes the background from the current canvas.
 * *Set background from* - Sets the background from an another canvas.

To set a canvas background you need to open the *Change canvas background*
window ([@fig:change_canvas_background]).

![Change canvas background\
](./assets/change_canvas_background.png
){#fig:change_canvas_background}

This window is divided into two main parts:

 * Left pane with the canvas background options

  - Field and button for choosing the background image
  - Image setting options
  - Image alignment options
  - Additional information if imagemagick is not present ([@fig:imagemagick_warning])

 * Right pane with canvas and image information and preview

  - Canvas size information
  - Image preview
  - Image size information

![Warning if ImageMagick is not present\
](./assets/imagemagick_warning.png
){#fig:imagemagick_warning}

When the image is selected there are four image setting modes that can be
chosen:

 * *Use original/cropped image* - If the image is smaller it will be placed in
 the position defined by the image alignment. If the image is larger  it will
 be cropped. The image alignment will define which part of the image will be
 taken as the background.
 * *Stretch/shrink image* - If the image is smaller it will be stretched
 without changing the proportions. If the image is larger it will be shrunk
 without changing the proportions. The image alignment will define which part
 of the image will be taken as the background.
 * *Adjust canvas to image* - The canvas will be resized to the image size and
 then the background image will be set.
 * *Adjust image to canvas* - The image will be forcibly resized to the canvas
 size with changed proportions if needed.

#### [Settings Canvas Background Assets](#settings-canvas-background-assets)

We will use the extended topology example (*extended-topology.imn*) to set
canvas background assets. On the *office-canvas* we will set a background
image. Then we will go to the *roadwarrior-canvas* and set that same image
using the *Set background from $\to$ office-canvas* option
([@fig:set_background_from]).

![Set background from menu\
](./assets/set_background_from.png
){#fig:set_background_from}

The final result is shown in [@fig:canvas_background_example_1] and
[@fig:canvas_background_example_2].

![Canvas background example on office-canvas\
](./assets/canvas_background_example_1.png
){#fig:canvas_background_example_1 width=75%}

![Canvas background example on roadwarrior-canvas\
](./assets/canvas_background_example_2.png
){#fig:canvas_background_example_2 width=75%}

### [Icons](#icons)

IMUNES lets you choose custom node icons. First, select the nodes whose icons
you want to change. Then right click on the selection and then go to the *Node
icon $\to$ Change node icons* option ([@fig:node_icon_menu]). This menu has
also the *Set default icons* option that sets the default node icon for the
selected icons.

![Node icon menu\
](./assets/node_icon_menu.png
){#fig:node_icon_menu}

The *Change node icons* option opens the *Set custom icon* window
([@fig:set_custom_icon]).

![Set custom icon\
](./assets/set_custom_icon.png
){#fig:set_custom_icon}

This window is divided into two main parts ([@fig:set_custom_icon]):

 * Left pane for choosing custom icons

  - List of library and custom icons on the top. Every icon that has been used or is being used in the project will be available at the end of the list, and will be given a generic name (e.g. img0, img5).
  - Field and button for choosing the custom icon

 * Right pane with the icon preview and icon size information

We will now open the *extended-topology.imn* file and set a custom icon.  We
will choose the library icon *ipfirewall.gif* for the *roadwarrior-router*. The
final result is shown on [@fig:changed_node_icon].

![Changed roadwarrior-router icon\
](./assets/changed_node_icon.png
){#fig:changed_node_icon}

#### [Icon Size](#icon-size)

If you want to emphasize the information about nodes, interfaces and links
instead of node icons you can change the icon size through the *View $\to$ Icon
size* option ([@fig:icon_size]).

![Icon size menu\
](./assets/icon_size.png
){#fig:icon_size}

Let's take the `simple-topology.imn` example and set the icon size to small.
([@fig:icon_size_example])

Currently, only two sizes are available, normal and small. Otherwise, custom
icons can be used.

![Icon size example\
](./assets/icon_size_example.png
){#fig:icon_size_example}

## [User-configurable Event Scheduling](#user-configurable-event-scheduling)

This section describes a feature for scheduling of arbitrary deterministic and
stochastic events during experiment execution.

### [Principle of Operation](#principle-of-operation)

The control plane in IMUNES is extended to retain control over the experiment
execution after initial topology instantiation, allowing for user-scheduled
events to influence selected parameters during run time.

The current implementation allows for the event scheduler to assume control
over selected link properties such as:

 * bandwidth
 * delay
 * bit error rate
 * packet duplication
 * visual attributes
  - line width
  - line color

The event scheduler supports two general classes of schedulable events:
one-time changes and periodic functions. 

One-time events update the selected parameter at requested point in time,
leaving that parameter constant throughout rest of the experiment execution, or
until another event updates it to a new value at some later point in time. 

Periodic functions allow for time-variant functions to be applied to selected
parameters by specifying those functions as single events. Subsequently
scheduled events acting upon the same parameter will cancel the current
periodic function and replace it with either a constant value or another
periodic function.

### [Configuring Events with Events Editor](#configuring-events-with-events-editor)

Events can be specified in the *Events editor* (Figure [@fig:event_editor]). To
open the *Events editor* select the *Events* $\to$ *Events editor* option. The
editor is divided into two elements. The left side element contains a list of
all links. The right side element contains events configured on the selected
link. This dialog allows you to edit events on that link. To save the event
scheduling configuration you need to click on *Apply* button. The events editor
gives you the possibility to start or stop the event scheduling during
experiment execution. This can be also done from the *Events* menu in the
menubar.

![Events editor\
](./assets/event_editor.png
){#fig:event_editor width=55%}

Each event entry occupies a single line of text, consisting of four fields:
deadline, target parameter, function and function parameters. The first field,
deadline, is specified as an integer number of seconds since experiment
instantiation. The second field, target parameter, may be one of the following:
bandwidth, delay, ber, duplicate, width or color. The remainder of the line is
further parsed as a function. The type of the function is determined by the
leading keyword, which may be either const, ramp, rand or square. When saving
the configuration through the events editor a syntax check will be performed.
If the syntax is wrong the configuration will not be saved and a popup dialog
will show the first line that has a syntax error.

#### [Const](#const)

The const function accepts one parameter, the target value. After the deadline
time the parameter will constantly be equal to the target value.

#### [Ramp](#ramp)

Behavior of the ramp function is determined by three arguments: initial value,
delta, and period, which are all integers. The first argument represents the
initial function value. The second is the delta value, which may be both
positive or negative, which is added to the previous value of the function at
each period. The third argument is the period, determining how often will the
delta value be added to the current function value.

#### [Rand](#rand)

The rand function is determined by three arguments: lower bound, upper bound,
and period; all of which are integers. The function will assume a random value
between lower and upper bound after each period (in seconds) expires.

#### [Square](#square)

Finally, the square function has three arguments as well: low value, high
value, and period; all integer numbers. The resulting function will flip from
low value to high and vice versa after each period (in second) expires.

#### [Example](#example)

The following example illustrates a possible event scheduling scenario that can
be entered in the Event editor window (Figure [@fig:event_editor]):

```
  30 bandwidth ramp 128000 8000 2
  30 delay rand 80000 120000 8
  60 delay square 100000 200000 10
  60 ber const 1
  90 ber const 0
  120 delay const 0
```

At `t = 30 s`, bandwidth of the selected link will be set to 128 Kbps, and will
continue to grow at a rate of 8 Kbps each 2 s.

Also at `t = 30 s`, the delay will begin assuming a random value between 80 ms
and 120 ms, and will continue to change the setting to new random values in the
same range each 8 s.

At `t = 60 s`, the delay will cease to assume random values, and instead it will
begin to oscillate between two discrete values, 100 ms and 200ms, each 10 s.

Also at `t = 60 s`, the bit error rate (BER) will be set to 1, resulting in all
frames traversing the link to be silently dropped.

At `t = 90 s`, the BER is reset back to 0, allowing for all frames to traverse
the link without artificial losses.

At `t = 120 s`, the oscillation of the delay parameter will stop, and delay will
be reset to 0 ms for the rest of the experiment execution time.

The current time is shown on the status bar after the zoom value. (Figure
[@fig:statusbar_execute])

### [Configuring Events Through Configuration File](#configuring-events-through-configuration-file)

**NOTE:** It is advised to use the Events editor to configure event scheduling
because it includes a syntax check. In the case of configuring events through
configuration file, the wrong syntax will be silently ignored.

IMUNES experiments are defined via plain-text configuration files, which
currently describe virtual nodes and links, as well as additional objects
related only to GUI visual properties and annotations. The other way to
configure events is manual editing of an existing configuration file.

The example bellow shows a configuration section describing a virtual link in
an IMUNES experiment. The link l0 connects virtual nodes n0 and n1 using
interfaces ifc1 and ifc1, and has the bandwidth constraint set to 128 Kbps. All
of the mentioned properties are directly controllable via the IMUNES GUI. The
configuration for link l0 also includes an example for schedulable events.

```json
"link": {
    "l0": {
        "peers": "n0 n1",
        "peers_ifaces": "ifc1 ifc1",
        "bandwidth": 128000,
        "events": [
            "10 ber const 10000",
            "10 bandwidth const 2500000"
        ]
    }
}
```

The events section in the configuration file accepts the same commands as does the Events editor in the GUI.

## [Starting and Terminating a Simulation Through CLI](#starting-and-terminating-a-simulation-through-cli)

In addition to the *File$\to$Open* option to open an .imn file and the
*Experiment$\to$Execute* option used to initiate the virtual network topology
in the GUI, the simulation can be initiated through the command-line interface
(CLI) with the following command:

`# imunes -b simple-network.imn`
 
Using IMUNES through GUI, the *Experiment$\to$Terminate* option is used for
shutting down the simulation and cleaning up the virtual network topology from
the kernel. The CLI alternative for the latter is the following command:

`# imunes -b -e experimentId`

The parameter `exeperimentId` represents the experiment identifier. In order to
get the experiment identifier you can use the `himage` command. With `himage
-l` you will get a list of identifiers of all started experiments. 

## [Managing Virtual Nodes (jails) - jls, jexec](#managing-virtual-nodes-jails---jls-jexec)

The FreeBSD jail mechanism allows partitioning of a FreeBSD-based computer
system into several independent smaller systems called jails. This mechanism
enables creation of a safe environment, separate from the rest of the system.
Processes created inside a jail are limited within that jail environment. Each
jail is a virtual environment running on the host machine, having its own file
system, processes, set of users, networking subsystem of the FreeBSD kernel and
a few other things.

Two main commands exist in FreeBSD for manging and configuring previously
created jails:

 * `jexec` - executes a command inside an existing jail
 * `jls` - lists jails.

A virtual image or vimage is a jail with its own independent network stack
instance. Every process, socket and network interface present in the system is
always attached to one, and only one, virtual network stack instance (vnet).
During system bootup sequence a default vnet is created to which all the
configured interfaces and user processes are initially attached. 

The `jexec` command allows for execution of arbitrary processes in a targeted
virtual image.

`jexec jname command ...`

The jexec command starts the selected command and it's arguments in the jail
`jname`.

To find out the names of started jails the jls command is used: 

`# jls [-hnqsv] [parameter ...]`
 
Since the default jls command doesn't list names of jails a better output is
provided using the command:

`# jls -h jid name host.hostname`

Also, the command `jls -v` gives a more detailed output.

### [Examples](#examples)

Execute the `ifconfig` command in the jail with the jail name `n1`:

`# jexec n1 ifconfig`

Execute the `csh` command in the IMUNES virtual node named `host1`:

First we need to find out the jail ID or jail name to execute the wanted
command:

`# jls -h jid name host.hostname | grep host1`

The first parameter output is the jail ID, the second is the jail name and the
last is the hostname. To execute the command you need the jail ID or jail name:

```
# jexec <jid> csh
or 
# jexec <jname> csh
```

## [Himage Tool](#himage-tool)

The jls and jexec commands can be impractical for creating scripts for
topologies since the output of the jls command is needed for starting the jexec
command. The jexec command can't take the hostname of the jail as an argument,
it can only take the jail name or jail id. The jail name is created from the
IMUNES experiment ID and the node identifier (not hostname). Every experiment
started in IMUNES has a different randomly generated experiment ID to enable
execution of multiple experiments at once.

IMUNES comes with the `himage` tool that enables the usage of hostnames when
starting commands in virtual nodes. The `himage` tool starts the jexec command
with the appropriate jail name so that the user doesn't have to search for it. 

The `himage` command has the following options:

 * `himage vi_hostname command ...` - executes the command in the virtual node
 with the specified hostname. If no command is specified, it starts an
 interactive shell.
 * `himage -m vi_hostname` - executes the command in the experiment master
 jail. If no command is specified, it starts an interactive shell.
 * `himage -v vi_hostname` - gets the jail node name of the virtual node with
 the specified hostname
 * `himage -n vi_hostname` - gets the node identifier for the specified
 hostname.
 * `himage -e vi_hostname` - gets the experiment ID in which the virtual node
 with the specified hostname is running.
 * `himage -j/-i vi_hostname` - gets the jail ID in which the virtual node
 with the specified hostname is running.
 * `himage -d` - gets the hostname jail filesystem path on the host machine.
 * `himage -l` - gets the experiment list with the experiment data.
 * `himage -ln` - gets the experiment list with node names.

### [Examples](#examples-1)

Example of usage of the command himage on a node with the hostname "pc" to get
a list of running processes:

`# himage pc ps ax`

If there are multiple experiments running and there are nodes with the same
hostnames in these experiments the `himage` command accepts the following node
specification where `vi_hostname` is specified as `hostname@eid`, where eid is
the experiments' ID.

`# himage hostname@eid command ...`

i.e:

`# himage pc@i3d05a ps ax`

where `i3d05a` is the experiment ID of the running experiments. To find out
which experiments are running the `himage -l` command can be used as well as
`jls -h jid name host.hostname`.

Execute the `ifconfig` command the IMUNES node named `server`:

`# himage server ifconfig`

## [Hcp Tool](#hcp-tool)

While the `himage` command is used for running programs inside virtual nodes
the `hcp` is used to copy files directly to the filesystem of running mobile
nodes, thus simplifying deployment of configuration files for starting various
services on virtual nodes.

Usage of the command `hcp`:

`hcp [cp_command_options] [vi_hostname1:]filename [vi_hostname2:]filename`

The `hcp` command invokes the cp command with the specified options. If the
`vi_hostname1` is specified the script copies a file from the virtual node,
otherwise it copies a file from the local folders. The second `vi_hostname2`
specifies on which node the first file will be copied, if not specified the
file is copied to the local folders.

`vi_hostname` is specified in the same way as in the `himage` command,
`hostname` or `hostname@eid`.

### [Examples](#examples-2)

Copy file dhcpd.conf from a local folder to the virtual node DHCP:

`# hcp dhcpd.conf DHCP:/usr/local/etc/`

Copy file message.txt from the virtual node PC to a local folder:

`# hcp PC:/root/message.txt .`

Copy file index.html from the virtual node HOST to the virtual node HTTP:

`# hcp HOST:/usr/local/www/data/index.html HTTP:/usr/local/www/data/`

## [Example (himage and hcp)](#example-himage-and-hcp)

This is an example of starting an DHCP server through a script with the
provided configuration file dhcpd.conf.

Kill the server if it's started:

`# himage DHCP killall -9 dhcpd`

Copy the configuration file:

`# hcp dhcpd.conf DHCP:/usr/local/etc/`

Create the `.leases` file defined in `dhcpd.conf`:

`# himage DHCP touch /var/db/dhcpd.leases`

Start the sever with the copied configuration file:

`# himage DHCP dhcpd -cf /usr/local/etc/dhcpd.conf`

## [Vlink Tool](#vlink-tool)

The `vlink` tool is used to change link parameters. The following link
parameters are available:

 * bandwidth (bps, bits-per-second)
 * bit-error rate, BER (number of bits in which one error will occur)
 * delay (microseconds)
 * packet duplication (%, percentage of packets that will be duplicated)

A link is identified by the endpoint node names. The link between pc1 and pc2
is identified by *pc1:pc2* or *pc2:pc1*.

Usage of the command `vlink`:

`vlink [options] link_name[@eid]`

### [Examples](#examples-3)

Setting the bandwidth to 10 Mb/s with a delay of 30 ms to the link connecting
*router1* and *pc1*:

`# vlink -bw 10000000 -dly 30000 router1:pc1`

Generate an error on one bit in a million:

`# vlink -BER 1000000 router1:pc1`

Set packet duplication to 20%:

`# vlink -dup 20 router1:pc1`

Modifying a link in a specific experiment (i.e. Experiment ID = i56ad1):

`# vlink -dup 20 router1:pc1@i56ad1`

To reset the link settings to the default values the -r flag is used:

`# vlink -r router1:pc1@i56ad1`

Check all `vlink` arguments with:

`# vlink -h`
