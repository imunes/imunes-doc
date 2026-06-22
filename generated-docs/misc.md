Editor Preferences`Active options`

Preview of currently active options combining Custom, Topology and Default options. The Default options are loaded first, overwritten by the Topology options and Custom options. If `custom_override` is enabled for the option, the Custom option will always overwrite the topology option.

`Custom options`

Options loaded from .rc files (`/etc/imunes/config`, `$HOME/.imunes.rc` if it exists, otherwise `$XDG_CONFIG_HOME/imunes/config`, `./.imunes.rc`, `/etc/imunes/override` - in that order). Apply button will save the configured options to the last loaded existing .rc file - not including /etc/imunes/override.

`Topology options`

Options loaded from, and saved to the .imn file - some options cannot be saved.
