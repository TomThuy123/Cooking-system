local module = {}

local list={
	["Rock salt"]={
		Level=1;
		Name="Salty"
	};
	["Basil herb"]={
		Level=1;
		Name="Sweet";
	};
	["Lemongrass herb"]={
		Level=1;
		Name="Zesty"
	}
	
}

function module.GetName(SeasoningList)
	local CurrentMax=0
	local name=""
	local ActualName=""
	if SeasoningList then
		for i,v in SeasoningList do
			if list[v].Level>=CurrentMax then
				CurrentMax=list[v].Level
				name=list[v].Name
				ActualName=v
			end
		end
	end
	if name=="" then
		return name,ActualName
	else
		return name.." ",ActualName
	end
end
return module
