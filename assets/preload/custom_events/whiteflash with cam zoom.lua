function onCreate()
  makeLuaSprite('whiteflash', '', -1500, -1000)
  makeGraphic('whiteflash', 3920, 3080, 'FFFFFF')
  setScrollFactor('whiteflash', 0, 0)
  addLuaSprite('whiteflash',true)
  setProperty('whiteflash.alpha', 0)
end
function onEvent(name, value1, value2)
  if name == 'whiteflash with cam zoom' then
    setProperty('whiteflash.alpha', 1)
    doTweenAlpha('whiteflashbye', 'whiteflash', 0, 0.5, 'linear')
    triggerEvent('Add Camera Zoom','0.1','0.005')
  end
end
function onUpdate()
  haha = false
  if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') and not haha == true then
    setProperty('whiteflash.alpha', 1)
    doTweenAlpha('whiteflashbye', 'whiteflash', 0, 3, 'linear')
  end
end
