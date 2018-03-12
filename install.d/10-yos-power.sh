#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

###############################################################################
# Power Settings                                                              #
###############################################################################
# Power Settings for all Users (Display Sleep, Workstation Sleep, Wake for network access) (Pmset -a = All Power modes | Pmset -c = A/C Power | Pmset -b = Battery Power)
# to copy preferences in a less painful manner: "pmset -g" awk 1 ORS='' | tr -s ' ' > ~/FileToEdit (note: you will need to prune some of the output)
# this will set up the battery settings
sudo pmset -b standbydelay 10800 standby 1 halfdim 1 hibernatefile /var/vm/sleepimage darkwakes 0 disksleep 0 sleep 0 autopoweroffdelay 14400 hibernatemode 3 autopoweroff 1 ttyskeepawake 1 displaysleep 0

# This will set up the ac power settings
sudo pmset -a standbydelay 10800 standby 1 halfdim 1 darkwakes 0 disksleep 0 sleep 0 autopoweroffdelay 14400 hibernatemode 3 autopoweroff 1 ttyskeepawake 1 displaysleep 0 acwake 0 lidwake 1
