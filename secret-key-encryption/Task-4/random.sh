#!/bin/bash

# Continuous output of random values from /dev/random in a new terminal
gnome-terminal -- bash -c "cat /dev/random | hexdump"

# Use watch to periodically print entropy of /dev/random in another new terminal
gnome-terminal -- bash -c "watch -n 1 cat /proc/sys/kernel/random/entropy_avail"
