zooming = 0;
timing = 0;
diff = 0

function onEvent(name,value1,value2)

    if name == "Cam Zoom Bounce" then
        
        if value2 == '' then
			cancelTween('camz1');
			cancelTween('camz2');
			setProperty("defaultCamZoom",value1)
			debugPrint(value2)
		else

			cancelTween('camz1');
			cancelTween('camz2');

			zooming = tonumber(value1);
			timing = tonumber(value2) / 2;
            doTweenZoom('camz1','camGame', zooming, timing,'quadOut');
		end
            
    end


end

function onTweenCompleted(name)

if name == 'camz1' then

		 setProperty('camGame.zoom', zooming);
      	 doTweenZoom('camz2','camGame', getProperty("defaultCamZoom"), timing, 'quintIn');

end

if name == 'camz2' then

		diff = (getProperty("defaultCamZoom") - zooming) / 3;
      	setProperty('camGame.zoom', getProperty("defaultCamZoom") + diff);

end


end