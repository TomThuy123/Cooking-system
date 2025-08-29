local RP=game:GetService("ReplicatedStorage")
local HttpService=game:GetService("HttpService")
local RecipeList=require(RP.Modules.Food.RecipeList)
local Notification=require(RP.Modules.Notifications)
local TierCounter=require(script.Parent.TierCounter)
local SeasoningNamer=require(RP.Modules.Food.SeasoningNameGetter)
local LuckSystem=require(RP.Modules.LuckSystem)

local module = {}
function module.CheckRecipe(ChosenList,player)
	local DishMade=false	
	
	local TC,Color,TotalTier, GottenRarity=TierCounter.TierGetter(ChosenList)
	local DishData,SeasoningList=RecipeList.CheckFlexibleList(ChosenList)
	local SeasoningName,TrueSeasoning=SeasoningNamer.GetName(SeasoningList)
	local DishItem
	local DishState="Normal"
	
	local DishStateLst={
		{"Normal",1};
		{"Shiny",100}
	}
	DishState=LuckSystem.ChanceGetter(player,DishStateLst)
	if DishData~=nil then
		
		DishItem={
			Name=DishData.name;
			Tier=TC;
			TierCount=TotalTier;
			Seasoning=SeasoningName:gsub("%s+$", "");
			TrueSeasoningName=TrueSeasoning;
			State=DishState;
			Rarity=GottenRarity;
			IngredientList=ChosenList;
			FoodID=HttpService:GenerateGUID(false)
		}
		
		DishMade=true
		print(player.Name.." has made "..DishData.name)
		coroutine.wrap(function()
			if DishState~="Shiny" then
				Notification.NotifyPlayer(player,player,"Dish made", "You have made a "..SeasoningName..DishData.name.." ("..GottenRarity..")",4,Color,false)
			else
				Notification.NotifyPlayer(player,player,"Dish made", "You have made a Shiny "..SeasoningName..DishData.name.." ("..GottenRarity..")",4,Color,false)	
			end
			
		end)()
	end
	
	if DishMade==false then
		DishItem={
			Name="Inedible sludge";
			Tier=TC;
			TierCount=TotalTier;
			Seasoning="";
			TrueSeasoningName="";
			State=DishState;
			Rarity=GottenRarity
		}
		coroutine.wrap(function()
			Notification.NotifyPlayer(player,player,"Dish made!", "You have made an inedible sludge" .." ("..GottenRarity..")",4,Color3.new(0.282353, 0.282353, 0.282353),false)
		end)()
		print(player.Name.." has made inedible sludge")
	end
	return DishItem
	
end

return module
