#!/usr/bin/env bash
# Check if the script is run as root

# Find the process using port 80 and stop it
echo "Checking for processes using port 80..."
PID=$(netstat -tulnp | grep :80 | awk '{ split($7, parts, "/"); print parts[1]}')

if [ -n"$PID" ]; then
  echo "Found process using port 80: PID $PID. Stopping it..."
  kill $PID
else
  echo "No process found using port 80."
fi
service nginx start
echo "started nginx"