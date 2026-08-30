
#### [Advanced node options](#advanced-node-options)

Additional options for Docker/Jail/others when creating the current node (such as mounts, CPUs, memory, etc).

{{include:generated-docs/advancedopts.md}}

#### [Services](#services)

For each enabled service, the node will start its daemon on node startup.

#### [Custom static routes](#custom-static-routes)

Add defined routes on node startup. Set one route per line in the format
a.b.c.d/prefix x.y.z.w

For example: 0.0.0.0/0 10.0.0.1

#### [Automatic default routes](#automatic-default-routes)

If *Enable automatic default routes* is enabled, IMUNES will dynamically generate default routes for this node and automatically add them on node startup.

You can see the default routes that will be generated in the *Automatic default routes* tab.

#### [Custom config](#custom-config)

If enabled, custom configuration(s) will be run instead of default behaviour. There are currently two custom configuration options: interfaces config and node config.

#### [Custom interfaces config](#custom-interfaces-config)

If enabled, custom interfaces configuration will be run instead of default behaviour from the 'Interfaces' tab. More information is available inside the custom config editor.

#### [Custom node config](#custom-node-config)

If enabled, custom node configuration will be run instead of default commands. More information is available inside the custom config editor.

#### [Open in external editor](#open-in-external-editor)

Open the selected custom configuration in external editor (configured in 'external_editor_command' custom variable).

Ignored if custom configuration is DISABLED.

Example values for 'external_editor_command' are:

  * *xterm+vim* -	`{xterm -T "%TITLE%" -e "vim %FILE_PATH%"}`
  * *gedit* -	`{gedit --standalone %FILE_PATH%}`
  * *mousepad* -	`{mousepad --disable-server %FILE_PATH%}`
  * *kate* -	`{kate --block %FILE_PATH%}`
  * *vscode* -	`{code --wait --new-window %FILE_PATH%}`
  * *sublime* -	`{subl -n -w %FILE_PATH%}`
  * *gvim* -	`{gvim -f %FILE_PATH%}`

The external editor must quit, only then will IMUNES fetch the latest changes.
