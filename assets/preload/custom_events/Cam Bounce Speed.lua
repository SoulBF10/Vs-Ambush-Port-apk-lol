boomspeed = 4
bam = 0;
songEnded = false

function onCreate()
	--preload the event
	addLuaScript('custom_events/Cam Zoom Bounce')
end

function onEvent(n,v1,v2)
	if n == "Cam Bounce Speed" then
		boomspeed = tonumber(v1)
		bam = tonumber(v2)
	end
end

function onBeatHit()
	if curBeat % boomspeed == 0 and cameraZoomOnBeat and not songEnded then
		triggerEvent("Cam Zoom Bounce",  getProperty("defaultCamZoom") + bam, (crochet / 1000) * boomspeed);
	end
end

function onEndSong()
	songEnded = true
	return Function_Continue;
end