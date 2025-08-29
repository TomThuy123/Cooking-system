local module = {}
local List = {
	{
		name      = "Plate of fish",
		baseTier  = 1,
		required  = {},
		allowCats = {["Fish"]=1},
		Enabled=true
	};
	{
		name      = "Baked Apple",
		baseTier  = 1,
		required  = {"Apple"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Banana Chips",
		baseTier  = 1,
		required  = {"Banana"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Grape Jelly",
		baseTier  = 1,
		required  = {"Grape"},
		allowCats = {},
		Enabled=true
	},

	{
		name      = "Apple-Banana Smoothie",
		baseTier  = 1,
		required  = {"Apple", "Banana"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Apple & Grape Crisp",
		baseTier  = 1,
		required  = {"Apple", "Grape"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Banana Grape Jam",
		baseTier  = 1,
		required  = {"Banana", "Grape"},
		allowCats = {},
		Enabled=true
	},

	{
		name      = "Caramelized Apple Slices",
		baseTier  = 1,
		required  = {"Apple", "Apple"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Double Banana Pudding",
		baseTier  = 1,
		required  = {"Banana", "Banana"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Crystal Grape Conserve",
		baseTier  = 1,
		required  = {"Grape", "Grape"},
		allowCats = {},
		Enabled=true
	},

	{
		name      = "Cooked Meat",
		baseTier  = 1,
		required  = {"Raw meat"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Cooked Meats",
		baseTier  = 1,
		required  = {},
		allowCats = {["Meat"]=2},
		Enabled=true
	},
	{
		name      = "Dish of fishes",
		baseTier  = 1,
		required  = {},
		allowCats = {["Fish"]=2},
		Enabled=true
	},
	{
		name      = "Grilled salmon",
		baseTier  = 1,
		required  = {"Raw salmon"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Grilled trout",
		baseTier  = 1,
		required  = {"Raw trout"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Boiled Egg",
		baseTier  = 1,
		required  = {"Egg"},
		allowCats = {},
		Enabled=true
	},

	{
		name      = "Basil Herb Tea",
		baseTier  = 1,
		required  = {"Basil herb"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Lemongrass Herb Tea",
		baseTier  = 1,
		required  = {"Lemongrass herb"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Basilgrass Tea",
		baseTier  = 1,
		required  = {"Lemongrass herb","Basil herb"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Salt Crystals",
		baseTier  = 1,
		required  = {"Rock salt"},
		allowCats = {},
		Enabled=true
	},
	{
		name      = "Bananagrade Meat Infusion",
		baseTier  = 1,
		required  = {"Banana", "Grape"},
		allowCats = {["Meat"]=1},
		Enabled=true
	},
	{
		name      = "Cooked Salmon & Beef Plate",
		baseTier  = 1,
		required  = {"Raw salmon"},
		allowCats = {["Meat"]=1},
		Enabled=true
	};
	{
		name      = "Cooked Salmon & too many Beef Plate",
		baseTier  = 1,
		required  = {"Raw salmon"},
		allowCats = {["Meat"]=4},
		Enabled=true
	};
	{
		name      = "Basil Crystal tea",
		baseTier  = 1,
		required  = {"Basil herb"},
		allowCats = {["Crystal"]=1},
		Enabled=true
	};
	{
		name      = "Fruit medley",
		baseTier  = 1,
		required  = {},
		allowCats = {["Fruit"]=3},
		Enabled=true
	};
	{
		name      = "Fiseg plate",
		baseTier  = 1,
		required  = {"Egg"},
		allowCats = {["Fish"]=1},
		Enabled=true
	};
	{
		name      = "Cooked meat medley",
		baseTier  = 1,
		required  = {},
		allowCats = {["Meat"]=3},
		Enabled=true
	};
	
	{
		name      = "Seasoning mush",
		baseTier  = 1,
		required  = {},
		allowCats = {["Seasoning"]=3},
		Enabled=true
	};
}


function module.GetList()
	return List
end

return module
