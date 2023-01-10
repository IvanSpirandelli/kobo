#!/bin/bash
 
# Set the port
PORT=5000
 
# switch directories
echo "$PWD"
cd build/web/
 
# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT