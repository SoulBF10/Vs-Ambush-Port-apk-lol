function onCreatePost()
    addCharacterToList('ambush')
    addCharacterToList('ambushalt')

	scaleObject('dad', 0.2, 0.2)
	setProperty('dad.alpha', 0)

	setProperty('dark.alpha', 0)
    setProperty('b.alpha', 0)
    setProperty('HUD.alpha', 0)
	setProperty('gf.visible', false)
	setProperty('boyfriend.visible', false)
end

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'jump');

    makeLuaSprite('HUD', 'fmShade', 0, 0)
	setLuaSpriteScrollFactor('HUD', 1, 1)
	scaleObject('HUD', 1, 1)
    setObjectCamera('HUD', 'camOther')
    addLuaSprite('HUD', false)

    makeLuaSprite('b', 'w', 380, 210)
	setLuaSpriteScrollFactor('b', 1, 1)
	scaleObject('b', 1.5, 1.5)
    setObjectCamera('b', 'camGame')
	
    makeLuaSprite('dark', 'turnoff', -570, -215)
	setLuaSpriteScrollFactor('b', 1, 1)
	scaleObject('dark', 1.7, 1.7)
    setObjectCamera('dark', 'camGame')
	

	makeLuaSprite('videoSprite','boo',-370,-100)
	addLuaSprite('videoSprite')

    addLuaSprite('dark', false)
	addLuaSprite('b', false)
    
end

function onStepHit()

    if curStep == 372 then
    doTweenAlpha('b','b', 1, 0.5, 'linear')
    end
    if curStep == 376 then
        doTweenAlpha('b','b', 0, 0.3, 'linear')
        setProperty('dad.visible', true)
        doTweenAlpha('dark','dark', 0.5, 0.3, 'linear')

        doTweenColor('videoSprite','videoSprite', FFFFFF, 0.3, 'linear')
        doTweenAlpha('HUD','HUD', 1, 0.3, 'linear')
        doTweenAlpha('dad','dad', 1, 0.3, 'linear')
        doTweenX('dadScaleTweenX', 'dad.scale', 0.9, 0.3, 'circInOut' )
        doTweenY('dadScaleTweenY', 'dad.scale', 0.9, 0.3, 'circInOut' )

    end
    if curStep == 380 then
        setProperty('HUD.visible', true)
    end

    if curStep == 1952 then
        setProperty('dad.visible', true)

        doTweenAlpha('dad','dad', 0, 0.3, 'circInOut')
        doTweenX('dadScaleTweenX', 'dad.scale', 0.2, 0.3, 'circInOut' )
        doTweenY('dadScaleTweenY', 'dad.scale', 0.2, 0.3, 'circInOut' )

        
    end
end