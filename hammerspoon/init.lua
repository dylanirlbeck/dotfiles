-- Hammerspoon config: http://www.hammerspoon.org/go/
local application = require "hs.application"
local hotkey = require "hs.hotkey"
local Grid = require "grid"

local mashApps = {
  'cmd',
  'option'
}

local mashGeneral = {
  'cmd',
  'shift'
}

hs.hotkey.bind({"ctrl"}, "space", function()
    local app = hs.application.get("kitty")
    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"kitty", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("kitty")
    end
end)

-- Disable window animations (janky for iTerm)
hs.window.animationDuration = 0

-- Window Management
hotkey.bind(mashGeneral, 'O', Grid.fullscreen)
hotkey.bind(mashGeneral, 'H', Grid.leftchunk)
hotkey.bind(mashGeneral, 'L', Grid.rightchunk)
hotkey.bind(mashGeneral, 'K', Grid.topHalf)
hotkey.bind(mashGeneral, 'J', Grid.bottomHalf)

hotkey.bind(mashGeneral, 'U', Grid.topleft)
hotkey.bind(mashGeneral, 'N', Grid.bottomleft)
hotkey.bind(mashGeneral, 'I', Grid.topright)
hotkey.bind(mashGeneral, 'M', Grid.bottomright)

-- Spotify
hotkey.bind(mashGeneral, 'P', hs.spotify.play)
hotkey.bind(mashGeneral, 'Y', hs.spotify.pause)
hotkey.bind(mashGeneral, 'T', hs.spotify.displayCurrentTrack)

-- Slack-specific app launcher (since I keep it "peeked" to the side by default)
function showSlack()
  local appName = 'Slack'
  local app = application.find(appName)
  application.launchOrFocus(appName)

  if (app and application.isRunning(app)) then
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
