local RP=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RecipeChecker=require(RP.Modules.Food.RecipeChecker)
--Player
local player = game.Players.LocalPlayer
local Character = player.Character or player.CharacterAdded:Wait()	
local Humanoid=Character:WaitForChild("Humanoid")

--Insert chosen ingredients here
local list={}
local DishData=RecipeChecker.CheckRecipe(list,player)
print(DishData)