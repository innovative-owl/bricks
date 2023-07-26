#!/bin/bash

echo "........... getting firebase runtime config"
firebase functions:config:get > functions/.runtimeconfig.json

echo "........... building functions"
cd functions
npm install && npm run build:watch &

echo "........... killing any running ports"
npx kill-port 5001 5002 8080 8082 8085 9099 9199 9299

cd ..
if [ -z "$1" ]; then 
    echo "........... firebase emulators:start"
    firebase emulators:start
else 
    echo "........... firebase emulators:start --import $1"
    firebase emulators:start --import $1
fi