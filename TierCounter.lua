local module = {}
local IngredientTypeChecker=require(script.Parent.IngredientTypeChecker)

local TierMultiplier={
	[1]=1;
	[2]=5;
	[3]=20;
	[4]=80;
	[5]=240;
	[6]=720
}


function module.TierGetter(ChosenList)
	local tierFetcher = coroutine.wrap(function()
		local TypeList = IngredientTypeChecker.GetTypeList()
		local total   = 0
		for _, name in ipairs(ChosenList) do
			total += TierMultiplier[TypeList[name].Tier]
		end
		if total < 5 then
			return 1,Color3.new(1,1,1),total, "Common"
		elseif total < 20 then
			return 2, Color3.new(0.47451, 0.815686, 0),total, "Uncommon"
		elseif total < 80 then
			return 3, Color3.new(0, 0.0509804, 1),total, "Rare"
		elseif total < 240 then
			return 4, Color3.new(0.470588, 0, 0.937255),total, "Epic"
		elseif total < 720 then
			return 5, Color3.new(1, 0.917647, 0),total, "Legendary"
		else
			return 6,Color3.new(1, 0, 0),total, "Exotic"
		end
	end)
	return tierFetcher()  
end

function module.NumberChecker(TierCount)
	local total=TierCount
	if total < 5 then
		return 1,Color3.new(1,1,1),total
	elseif total < 20 then
		return 2, Color3.new(0.47451, 0.815686, 0),total
	elseif total < 80 then
		return 3, Color3.new(0, 0.0509804, 1),total
	elseif total < 240 then
		return 4, Color3.new(0.470588, 0, 0.937255),total
	elseif total < 720 then
		return 5, Color3.new(1, 0.917647, 0),total
	else
		return 6,Color3.new(1, 0, 0),total
	end
end


return module
