
Drilling = {
	DisabledControls = {30,31,32,33,34,35},

	Start = function(callback, type)
	  if not Drilling.Active then
	    Drilling.Active = true
	    Drilling.Init(type)
	    Drilling.Update(callback)
	  end
	end,

	Init = function(type)
  		if Drilling.Scaleform then
  		  Scaleforms.UnloadMovie(Drilling.Scaleform)
  		end

		  Drilling.Scaleform = Scaleforms.LoadMovie(type)
		  if type == 'VAULT_LASER' then
		    extra = "SET_LASER_WIDTH"
		  else
		    extra = "SET_SPEED"
		  end

		  Drilling.DrillSpeed = 0.0
		  Drilling.DrillPos   = 0.0
		  Drilling.DrillTemp  = 0.0
		  Drilling.HoleDepth  = 0.0

	  
		  Scaleforms.PopVoid(Drilling.Scaleform, "REVEAL")
		  Scaleforms.PopFloat(Drilling.Scaleform, extra,     0.0)
		  Scaleforms.PopFloat(Drilling.Scaleform,"SET_DRILL_POSITION",  0.0)
		  Scaleforms.PopFloat(Drilling.Scaleform,"SET_TEMPERATURE",     0.0)
		  Scaleforms.PopFloat(Drilling.Scaleform,"SET_HOLE_DEPTH",      0.0)
		  Scaleforms.PopInt(Drilling.Scaleform,"SET_NUM_DISCS",      3)
	end,

	Update = function(callback)
	  while Drilling.Active do
	    Drilling.Draw()
	    Drilling.DisableControls()
	    Drilling.HandleControls()
	    Wait(0)
	  end
	  callback(Drilling.Result)
	end,

	Draw = function()
	  DrawScaleformMovieFullscreen(Drilling.Scaleform,255,255,255,255,255)
	end,

	HandleControls = function()
	  local last_pos = Drilling.DrillPos
	  if IsControlJustPressed(0,172) then
	    Drilling.DrillPos = math.min(1.0,Drilling.DrillPos + 0.01)
	    Scaleforms.PopVoid(Drilling.Scaleform,"burstOutSparks")
	  elseif IsControlPressed(0,172) then
	    Drilling.DrillPos = math.min(1.0,Drilling.DrillPos + (0.1 * GetFrameTime() / (math.max(0.1,Drilling.DrillTemp) * 10)))
	  elseif IsControlJustPressed(0,173) then
	    Drilling.DrillPos = math.max(0.0,Drilling.DrillPos - 0.01)
	  elseif IsControlPressed(0,173) then
	    Drilling.DrillPos = math.max(0.0,Drilling.DrillPos - (0.1 * GetFrameTime()))
	  end

	  local last_speed = Drilling.DrillSpeed
	  if IsControlJustPressed(0,175) then
	    Drilling.DrillSpeed = math.min(1.0,Drilling.DrillSpeed + 0.05)
	  elseif IsControlPressed(0,175) then
	    Drilling.DrillSpeed = math.min(1.0,Drilling.DrillSpeed + (0.5 * GetFrameTime()))
	  elseif IsControlJustPressed(0,174) then
	    Drilling.DrillSpeed = math.max(0.0,Drilling.DrillSpeed - 0.05)
	  elseif IsControlPressed(0,174) then
	    Drilling.DrillSpeed = math.max(0.0,Drilling.DrillSpeed - (0.5 * GetFrameTime()))
	  end

	  local last_temp = Drilling.DrillTemp
	  if last_pos < Drilling.DrillPos then
	    if Drilling.DrillSpeed > 0.4 then
	      Drilling.DrillTemp = math.min(1.0,Drilling.DrillTemp + ((0.05 * GetFrameTime()) *  (Drilling.DrillSpeed * 10)))
	      Scaleforms.PopFloat(Drilling.Scaleform,"SET_DRILL_POSITION",Drilling.DrillPos)
	    else
	      if Drilling.DrillPos < 0.1 or Drilling.DrillPos < Drilling.HoleDepth then
	        Scaleforms.PopFloat(Drilling.Scaleform,"SET_DRILL_POSITION",Drilling.DrillPos)
	      else
	        Drilling.DrillPos = last_pos
	        Drilling.DrillTemp = math.min(1.0,Drilling.DrillTemp + (0.01 * GetFrameTime()))
	      end
	    end
	  else
	    if Drilling.DrillPos < Drilling.HoleDepth then
	      Drilling.DrillTemp = math.max(0.0,Drilling.DrillTemp - ( (0.05 * GetFrameTime()) *  math.max(0.005,(Drilling.DrillSpeed * 10) /2)) )
	    end

	    if Drilling.DrillPos ~= Drilling.HoleDepth then
	      Scaleforms.PopFloat(Drilling.Scaleform,"SET_DRILL_POSITION",Drilling.DrillPos)
	    end
	  end

	  if last_speed ~= Drilling.DrillSpeed then
	    Scaleforms.PopFloat(Drilling.Scaleform,extra,Drilling.DrillSpeed)
	  end

	  if last_temp ~= Drilling.DrillTemp then    
	    Scaleforms.PopFloat(Drilling.Scaleform,"SET_TEMPERATURE",Drilling.DrillTemp)
	  end

	  if Drilling.DrillTemp >= 1.0 then
	    Drilling.Result = false
	    Drilling.Active = false
	    Scaleforms.PopVoid(Drilling.Scaleform, "RESET")
	  elseif Drilling.DrillPos >= 1.0 then
	    Drilling.Result = true
	    Drilling.Active = false
	    Scaleforms.PopVoid(Drilling.Scaleform, "RESET")
	  end

	  Drilling.HoleDepth = (Drilling.DrillPos > Drilling.HoleDepth and Drilling.DrillPos or Drilling.HoleDepth)
	end,

	DisableControls = function()
	  for _,control in ipairs(Drilling.DisabledControls) do
	    DisableControlAction(0,control,true)
	  end
	end,

	EnableControls = function()
	  for _,control in ipairs(Drilling.DisabledControls) do
	    DisableControlAction(0,control,true)
	  end
	end,
}

return Drilling