local module = {}




local TypeList = {
	-- Fruit
	["Apple"]      = { Types = {"Fruit"},     Tier = 1, Rarity="Common" },
	["Banana"]     = { Types = {"Fruit"},     Tier = 1, Rarity="Common" },
	["Grape"]      = { Types = {"Fruit"},     Tier = 1 , Rarity="Common" },

	-- Meat
	["Raw meat"]   = { Types = {"Meat"},      Tier = 1, Rarity="Common" },

	-- Fish / Seafood
	["Raw salmon"] = { Types = {"Fish","Seafood"}, Tier = 1, Rarity="Common" },
	["Raw trout"]  = { Types = {"Fish","Seafood"}, Tier = 1, Rarity="Common" },
	["Amberjack"]  = { Types = {"Fish","Seafood"}, Tier = 2, Rarity="Uncommon" },
	["Sea bass"]   = { Types = {"Fish","Seafood"}, Tier = 1, Rarity="Common" },
	["Mackerel"]   = { Types = {"Fish","Seafood"}, Tier = 1, Rarity="Common" },
	["Pollock"]    = { Types = {"Fish","Seafood"}, Tier = 1, Rarity="Common" },
	["Carp"]       = { Types = {"Fish","Seafood"}, Tier = 2, Rarity="Uncommon" },
	["Swordfish"]  = { Types = {"Fish","Seafood"}, Tier = 3, Rarity="Rare" },
	-- Misc
	["Egg"]        = { Types = {"Misc"},      Tier = 1 , Rarity="Common"},

	-- Seasoning
	["Basil herb"] = { Types = {"Seasoning", "Plant"}, Tier = 1, Rarity="Common" },
	["Lemongrass herb"] = { Types = {"Seasoning","Plant"}, Tier = 1, Rarity="Common" },
	["Rock salt"]  = { Types = {"Seasoning","Crystal"}, Tier = 1, Rarity="Common" },
}


function module.GetTypeList()
	return TypeList
end

return module
