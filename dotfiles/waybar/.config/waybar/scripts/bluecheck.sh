#!/bin/bash

# Saving bluetooth device's MAC address
IFS=$'\n'
PAIRED_DEVICES=($(bluetoothctl paired-devices | cut -d ' ' -f2))
CONNECTED_DEVICE=$(while read device; do bluetoothctl info $device; done <<< ${PAIRED_DEVICES[*]} \
  | grep "Name:\|Connected: yes" \
  | grep -B1 "yes" \
  | head -n 1 \
  | cut -d ' ' -f 2-)


# Formatting the data using json syntax
echo "{\"text\": \"$CONNECTED_DEVICE\", \"tooltip\": \"\", \"class\": \"\", \"percentage\": \"\"}"
