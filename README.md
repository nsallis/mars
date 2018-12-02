# M.A.R.S
My Auto-Rice Script - an auto-rice script for minimal-ubuntu

## Getting Started
Install minimal ubuntu from https://help.ubuntu.com/community/Installation/MinimalCD, once you have rebooted into the OS,
run the mars setup script with:
```
bash <(curl https://raw.githubusercontent.com/nsallis/mars/master/installer.sh)
```

## Background
this script takes you from a basic minimal-ubuntu install to a fully set up i3 instance with neovim, chrome, and a bunch of
lightweight goodies.

# XPS 15 install
If you are installing this on an xps 15 machine, try using the acpi_osi=Windows kernel parameter. This SHOULD tell your bios to 
give you all hardware, not just the stuff it thinks you can handle.
