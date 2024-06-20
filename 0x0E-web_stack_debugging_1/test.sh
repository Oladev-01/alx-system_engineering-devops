#!/usr/bin/env bash
# Check if the script is run as root

# Find the process using port 80 and stop it
if service nginx status | grep -q "active (running)"; then
  echo "Nginx is now running."
else
  echo "Failed to start Nginx. Please check the logs for details."
  exit 1
fi
