#!/bin/bash
cd "$(dirname "$0")"

# Link
ln com.user.slack-spotify.plist ~/Library/LaunchAgents/

# Activate
launchctl load ~/Library/LaunchAgents/com.user.slack-spotify.plist
launchctl start com.user.slack-spotify

cd -
