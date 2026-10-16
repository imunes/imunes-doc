# [Building and Organizing Topologies](#building-and-organizing-topologies)

## [Network Elements](#network-elements)

As previously mentioned in section [Functional Elements](#functional-elements), the main part of IMUNES toplogies and experiments are nodes, interfaces and links.

{{include:generated-docs/linklayertools.md}}

{{include:generated-docs/netlayertools.md}}

{{include:generated-docs/linktool.md}}

## [Editing Topologies](#editing-topologies)

### [Manipulating Topology Elements](#manipulating-topology-elements)

### [Creating and Manipulating Links](#creating-and-manipulating-links)

### [Rearranging Elements](#rearranging-elements)

### [Generating Topologies with TopoGen](#generating-topologies-with-topogen)

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

## [Managing Canvases](#managing-canvases)

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
([@fig:create_link_to]) from the pop-up menu. This will create a link between
*roadwarrior-router* and *office-router*.

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

### [Creating, Deleting and Editing Canvases](#creating-deleting-and-editing-canvases)

### [Creating Cross-Canvas Links](#creating-cross-canvas-links)

## [Customizing Topology Appearance](#customizing-topology-appearance)

### [Text and Graphical Annotations](#text-and-graphical-annotations)

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

### [Node Icons and Labels](#node-icons-and-labels)

#### [Icons](#icons)

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

### [Canvas Backgrounds and Grid](#canvas-background-and-grid)

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

### [Display and Zoom Options](#display-and-zoom-options)
