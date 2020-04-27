-- Hammerspoon config: http://www.hammerspoon.org/go/
local application = require "hs.application"
local hotkey = require "hs.hotkey"
local Grid = require "grid"

local mashApps = {
  'cmd',
  'shift'
}

local mashGeneral = {
  'cmd',
  'shift'
}

-- Disable window animations (janky for iTerm)
hs.window.animationDuration = 0

-- Window Management
hs.hotkey.bind(mashGeneral, 'O', Grid.fullscreen)
hs.hotkey.bind(mashGeneral, 'H', Grid.leftchunk)
hs.hotkey.bind(mashGeneral, 'L', Grid.rightchunk)
hs.hotkey.bind(mashGeneral, 'K', Grid.topHalf)
hs.hotkey.bind(mashGeneral, 'J', Grid.bottomHalf)

hs.hotkey.bind(mashGeneral, 'U', Grid.topleft)
hs.hotkey.bind(mashGeneral, 'N', Grid.bottomleft)
hs.hotkey.bind(mashGeneral, 'I', Grid.topright)
hs.hotkey.bind(mashGeneral, 'M', Grid.bottomright)

-- Spotify
hs.hotkey.bind(mashGeneral, 'P', hs.spotify.play)
hs.hotkey.bind(mashGeneral, 'Y', hs.spotify.pause)
hs.hotkey.bind(mashGeneral, 'T', hs.spotify.displayCurrentTrack)

-- Slack-specific app launcher (since I keep it "peeked" to the side by default)
function showSlack()
  local appName = 'Slack'
  local app = hs.application.find(appName)
  hs.application.launchOrFocus(appName)

  if (app and hs.application.isRunning(app)) then
    Grid.topleft()
  end
end
-- App Shortcuts
hotkey.bind(mashApps, '1', function() application.launchOrFocus('kitty') end)
hotkey.bind(mashApps, '2', function() application.launchOrFocus('Firefox') end)
hotkey.bind(mashApps, '3', showSlack)

-- Reload automatically on config changes
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
hs.alert('Hammerspoon is locked and loaded', 1)
