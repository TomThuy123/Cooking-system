local module = {}

local list={
	["Basil herb"]=1.05;
	["Lemongrass herb"]=1.05;
	["Rock salt"]=1.05;
}
function module.GetMultiplier(Seasoning)
	return list[Seasoning]
end
return module
