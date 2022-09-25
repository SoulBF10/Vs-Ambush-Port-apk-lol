function onCreate()
	if dadName == 'ambush' then
		makeAnimatedLuaSprite('animatedicon', 'icon-ambush', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'normal', 25, true)
		addAnimationByPrefix('animatedicon', 'losing', 'lose', 25, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'hud')
                setObjectOrder('animatedicon', getObjectOrder("iconP2"))
		addLuaSprite('animatedicon', true)
		objectPlayAnimation('animatedicon', 'normal', false)
		setProperty('animatedicon.visible', false)
		
	end
end


function onUpdate(elapsed)
    if curStep >= 0 then
	setProperty('iconP2.alpha', 0)
	setProperty('animatedicon.visible', true)
	else
	setProperty('iconP2.alpha', 0)
	end
	if dadName == 'ambush' then
		if getProperty('health') > 1.6 then
			objectPlayAnimation('animatedicon', 'losing', false)
		else
			objectPlayAnimation('animatedicon', 'normal', false)
		end
	end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x') + 20)
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') + -20)
	setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
	setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end
