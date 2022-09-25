-- Don't ask me why there so many Timer
-- I usually Hard Code The Mod
-- So i don't know much about Lua
-- Sorry if it look messy and not professional 
-- -TaeYai
local allowCountdown = false
local stops = 0;
function onStartCountdown()
	if not allowCountdown then
		if stops == 0 then
			runTimer('startC',3)
		end
		if stops == 1 then
		allowCountdown = true;
        
        end
        
		return Function_Stop;
	end
	return Function_Continue;

end

	function onTimerCompleted(tag)
		if tag == 'countdown' then
			seenCutscene = true
			allowCountdown = true;
			stops = stops + 1
		end
		if tag == 'startC' then
			startCountdown();
            
		end
        if tag == 'hud' then
            doTweenAlpha('alpha1','camHUD',1,1,'quartIn')
        end
	end

    function onCreate()
        runTimer('countdown',3.5)
        runTimer('hud',6)
        setProperty('camHUD.alpha',0)
        
    end
