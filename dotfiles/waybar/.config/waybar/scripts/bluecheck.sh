#!/bin/bash

# Saving bluetooth device's MAC address
MAC="F4:73:35:77:D4:92"
DEVICE="Logitech Keyboard K380"

CONNECTED_DEVICE=$(bluetoothctl info $MAC \
  | grep "Name:\|Connected: yes" \
  | grep -B1 "yes" \
  | head -n 1 \
  | cut -d ' ' -f 2-)


# Formatting the data using json syntax
if [ -z "$CONNECTED_DEVICE" ];
then
  echo "{\"text\": \"$DEVICE\", \"tooltip\": \"\", \"class\": \"off\", \"percentage\": \"\"}"
else
  echo "{\"text\": \"$DEVICE\", \"tooltip\": \"\", \"class\": \"on\", \"percentage\": \"\"}"
fi
