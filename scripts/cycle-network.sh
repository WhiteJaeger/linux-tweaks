#!/usr/bin/env bash

WIRED="Wired connection 1"
WIFI="WIFI-NAME"

ACTIVE=$(nmcli -t -f NAME connection show --active)

if echo "$ACTIVE" | grep -q "$WIRED"; then
    # Switch to Wi-Fi
    nmcli connection down "$WIRED"
    nmcli connection up "$WIFI"

elif echo "$ACTIVE" | grep -q "$WIFI"; then
    # Switch to Wired
    nmcli connection down "$WIFI"
    nmcli connection up "$WIRED"

else
    # Neither active → default to wired
    nmcli connection up "$WIRED"
fi
