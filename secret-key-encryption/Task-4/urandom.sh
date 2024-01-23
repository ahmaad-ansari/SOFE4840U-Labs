#!/bin/bash

# Continuous output of random values from /dev/urandom in a new terminal
gnome-terminal -- bash -c "cat /dev/urandom | hexdump"

# Generate 1 MB of pseudo-random numbers from /dev/urandom and save to a file
head -c 1M /dev/urandom > output.bin

# Run ent command on the generated file in another new terminal
gnome-terminal -- bash -c "ent output.bin"
