#!/bin/bash

# Deactivate
launchctl stop com.user.slack-spotify
launchctl unload ~/Library/LaunchAgents/com.user.slack-spotify.plist

# Delink
rm ~/Library/LaunchAgents/com.user.slack-spotify.plist
