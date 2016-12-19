-------------------------------------------------------------------------------
-- FORCE LANGUAGE
-------------------------------------------------------------------------------

-- Specify the target language here
local target_lang = "English"

-- Specify the target app names here
local target_apps = {
  "Android Studio",
  "IntelliJ IDEA",
  "iTerm2",
  "Sketch",
  "WebStorm",
  "Xcode"
}

-- Global variable to prevent GC, see https://github.com/Hammerspoon/hammerspoon/issues/681
force_lang_watcher = nil

function initForceLanguage()
  for id,name in pairs(hs.keycodes.layouts()) do 
    if string.match(name, target_lang) then
      target_lang = name
      break
    end
  end
  force_lang_watcher = hs.application.watcher.new(checkForceLanguage):start()
end

function checkForceLanguage(name, event, app)
  -- Ignore not interesting events
  if event ~= hs.application.watcher.activated then
    return
  end

  -- Ignore event if already on target language
  if string.match(hs.keycodes.currentLayout(), target_lang) then
    return
  end

  for id,target_name in pairs(target_apps) do 
    if string.match(name, target_name) then
      hs.keycodes.setLayout(target_lang)
      break
    end
  end
end

initForceLanguage()
