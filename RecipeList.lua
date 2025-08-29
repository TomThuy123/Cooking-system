local RP=game:GetService("ReplicatedStorage")
local TypeChecker=require(RP.Modules.Food.IngredientTypeChecker)
local RecipeChecker=require(script.TheChecker)
local ListGetter=require(script.TheList)
local module = {}

function module.CheckFlexibleList(ChosenList)
	local FlexibleList=ListGetter.GetList()
	local TypeList=TypeChecker.GetTypeList()
	
	local RecipeData,SeasoningList=RecipeChecker.Check(ChosenList,TypeList,FlexibleList)
	if RecipeData~=nil then
		return RecipeData,SeasoningList
	else
		return nil
	end
end
return module
