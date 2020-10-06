#!/bin/bash

APIKEY="<key>"

DEFAULT_STATUS=""
DEFAULT_STATUS_EMOJI=""
PLAYBACK_STATUS_EMOJI=":metal:"

trap onexit INT

function reset() {
    # echo 'Resetting status'

    curl -s \
        --data-urlencode "token=${APIKEY}" \
        --data-urlencode "profile={\"status_text\":\"${DEFAULT_STATUS}\",\"status_emoji\":\"${DEFAULT_STATUS_EMOJI}\"}" \
         -d "payload=$json" \
         "https://slack.com/api/users.profile.set"  > /dev/null
}

function onexit() {
    # echo 'Exitting'
    reset
    exit
}

state=$(osascript -e 'tell application "Spotify" to player state')

# date
# echo "Spotify: "$state

if [[ "$state" != "playing" ]]; then
    reset
else
    SONG=$(osascript -e 'tell application "Spotify" to artist of current track & " - " & name of current track')
    # echo $SONG

    curl -s \
        --data-urlencode "token=${APIKEY}" \
        --data-urlencode "profile={\"status_text\":\"Listening to ${SONG} on Spotify\",\"status_emoji\":\"${PLAYBACK_STATUS_EMOJI}\"}" \
         -d "payload=$json" \
         "https://slack.com/api/users.profile.set"  > /dev/null
fi