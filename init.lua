-------------------------------------------------------------------------------
-- FORCE LANGUAGE
-------------------------------------------------------------------------------

-- Specify the target language here
local target_lang = "English"

-- Specify the target app names here
local target_apps = {"Sketch", "iTerm2", "IntelliJ IDEA", "Android Studio"}

function initForceLanguage()
  for id,name in pairs(hs.keycodes.layouts()) do 
    if string.match(name, target_lang) then
      target_lang = name
      break
    end
  end
  hs.application.watcher.new(checkForceLanguage):start()
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

  for id,name in pairs(target_apps) do 
    if string.match(app:title(), name) then
      hs.keycodes.setLayout(target_lang)
      break
    end
  end
end

initForceLanguage()
