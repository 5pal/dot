#!/usr/bin/env bash
# Simple network status without exposing network names
# Shows WiFi/Ethernet/Offline based on connectivity

# Test connectivity with a quick ping
if ping -q -c 1 -W 1 8.8.8.8 &>/dev/null; then
    # Connected to internet, check if using WiFi or Ethernet
    case $(uname -s) in
        Darwin)
            # Check if WiFi is active
            if networksetup -getairportnetwork en0 | grep -q "You are not associated"; then
                echo "Ethernet"
            else
                echo "WiFi"
            fi
            ;;
        *)
            echo "Online"
            ;;
    esac
else
    echo "Offline"
fi