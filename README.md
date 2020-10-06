# Spotify Slack Status
A simple script which automatically displays the currently playing spotify track in your Slack status.

## Script Effect
If you are not listening to music this script will set your status to use the `DEFAULT_STATUS` text and the `DEFAULT_STATUS_EMOJI` will be displayed next to your avatar.

_By default this is a blank status and no emoji._

If you are listening to music it will set your status to to the current song and the `PLAYBACK_STATUS_EMOJI` will be displayed next to your avatar.

_By default this will look like :metal: Listening to {Artist} - {Song} on Spotify_

## Requirements:
- OSx
- Perl (Bundled by default in OSx)

NB: This script is agnostic but uses the OSx plist files to set up a watch. It _should_ work in windows, but you'll likely need some sort of CRON.

## Installation
### Slack Token Configuration
1. Navigate to [https://api.slack.com/apps](https://api.slack.com/apps)
2. Click 'Create new app'
    - Name the app (I'd suggest _"Spotify slack status"_)
    - Select the desired Workspace
    - Click 'Create app'
3. Grant the app required permissions
    - Click 'Add Features & Functionality > Permissions'
    - Click 'Add an OAuth Scope' under 'Scopes > User Token Scopes'
    - You should now be on the 'OAuth & Permissions' page
    - Select the 'users.profile:write' scope
4. Install the app
    - Scroll back to the top of the 'OAuth & Permissions' page
    - Click 'Install app to Workspace'
    - Check the permissions (You should see that the app can 'perform actions as you')
    - Click allow (assuming everything looked good)

### Configure spotify.sh
1. Re-save as `spotify.sh` (remove the `.dist`)
2. Update script
    - You should now be back on the 'OAuth & Permissions' page
    - Copy the 'OAuth Access Token' (should be a long alphanumeric key)
    - Set the APIKEY variable in the `spotify.sh` file with the value of your token
    - It should look like a longer (and more secure) version of this: `APIKEY="12345-abcdef-123abc"`
3. Customise (optional)
   - `DEFAULT_STATUS`: Your default status text
   - `DEFAULT_STATUS_EMOJI`: Emoji you want next to you picture when you are not listening to music (with colons)
   - `PLAYBACK_STATUS_EMOJI`: Emoji you want next to the your picture when you are listening to music (with colons)

### Configure com.user.slack-spotify.plist
1. Re-save as `com.user.slack-spotify.plist` (remove the .dist)
2. Replace the `/path/to/checkout/` string in the included PLIST
    - It should look something like `./<checkout-folder/spotify-slack-status/spotify.sh`
    - NB: You must use an absolute path

### Enable
Run the install script:
```sh
$ ./install.sh
```

### Disable
Run the uninstall script
```sh
$ ./uninstall.sh
```

## Testing
To test the script run the following command:
```sh
$ ./spotify.sh
```

This will manually run the script once.
