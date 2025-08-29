local module = {}

function module.Check(ChosenList, TypeList, FlexibleList)
	local function isSeasoning(name)
		local item=TypeList[name]
		if not item or not item.Types then return false end
		for i,v in ipairs(item.Types) do
			if v=="Seasoning" then 
				return true 
			end
		end
		return false
	end

	local function hasType(name, cat)
		local item=TypeList[name]
		if not item or not item.Types then return false end
		for i,v in ipairs(item.Types) do
			if v==cat then 
				return true 
			end
		end
		return false
	end

	local function hasAnyAllowedType(name, allowCats)
		local item=TypeList[name]
		if not item or not item.Types then return false end
		for i,v in ipairs(item.Types) do
			if allowCats[v] then
				return true
			end
		end
		return false
	end

	local function buildCounts(list)
		local BuildList={}
		for i,v in ipairs(list) do
			BuildList[v]=(BuildList[v] or 0)+1
		end
		return BuildList
	end

	local function buildRequiredCounts(requiredList)
		local CountList={}
		for i,v in ipairs(requiredList) do
			CountList[v]=(CountList[v] or 0) + 1
		end
		return CountList
	end

	local function recipeEnabled(recipe)
		if recipe.Enabled==nil then return true end
		return recipe.Enabled==true
	end

	
	local function consumeRequired(ChosenList,reqCounts)
		if not reqCounts or next(reqCounts)==nil then
			local AssignList={}
			for i,name in ipairs(ChosenList) do
				table.insert(AssignList,{index=i,name=name,assigned=false})
			end
			return AssignList
		end


		local chosenCounts=buildCounts(ChosenList)
		for name,need in pairs(reqCounts) do
			if(chosenCounts[name] or 0)<need then
				return nil 
			end
		end


		local left={}
		local reqLeft={}
		for i,v in pairs(reqCounts) do 
			reqLeft[i]=v 
		end

		for i,name in ipairs(ChosenList) do
			if reqLeft[name] and reqLeft[name]>0 then
				reqLeft[name]-=1 
			else
				table.insert(left,{index=i,name=name,assigned=false})
			end
		end
		return left
	end

	local function satisfyAllowCats(remainingItems, allowCats)
		local assignedPerCat={}
		local checker=true
		local NumLeft=#remainingItems

		local function assignToCategory(cat, wantCount)
			local cnt=0
			for i=1,NumLeft do
				local item=remainingItems[i]
				if not item.assigned and not isSeasoning(item.name) and hasType(item.name, cat) then
					item.assigned=true
					cnt+=1
					if cnt==wantCount then 
						break 
					end
				end
			end
			if cnt<wantCount then
				for i=1,NumLeft do
					local item=remainingItems[i]
					if not item.assigned and isSeasoning(item.name) and hasType(item.name, cat) then
						item.assigned=true
						cnt+=1
						if cnt==wantCount then 
							break 
						end
					end
				end
			end
			assignedPerCat[cat]=cnt
			return cnt==wantCount
		end

		for cat,required in pairs(allowCats) do
			if cat~="Seasoning" and required and required>0 then
				if not assignToCategory(cat,required) then
					checker=false
					break
				end
			end
		end

		if checker and allowCats["Seasoning"] and allowCats["Seasoning"]>0 then
			local need=allowCats["Seasoning"]
			local cnt=0
			for i=1,NumLeft do
				local item=remainingItems[i]
				if not item.assigned and isSeasoning(item.name) then
					item.assigned=true
					cnt+=1
					if cnt==need then 
						break 
					end
				end
			end
			assignedPerCat["Seasoning"]=(assignedPerCat["Seasoning"] or 0)+cnt
			if cnt<need then 
				checker=false 
			end
		end
		return checker,assignedPerCat
	end
	
	local function ExtraHandling(remainingItems,allowCats,SeasoningList)
		for i,v in ipairs(remainingItems) do
			if not v.assigned then
				if isSeasoning(v.name) then
					table.insert(SeasoningList,v.name) 
				else
					if next(allowCats)~=nil then
						if not hasAnyAllowedType(v.name, allowCats) then
							return false
						end
					else
						return false
					end
				end
			end
		end
		return true
	end

	local function tryRecipe(recipe)
		if not recipeEnabled(recipe) then return nil, {} end

		local requiredList=recipe.required 
		local allowCats=recipe.allowCats

		local reqCounts=nil
		if #requiredList>0 then
			reqCounts=buildRequiredCounts(requiredList)
		end

		local remaining=consumeRequired(ChosenList, reqCounts)
		if remaining==nil then
			return nil,{}
		end

		local SeasoningList={}

		if next(allowCats)~=nil then
			if not ({satisfyAllowCats(remaining,allowCats)})[1] then
				return nil,{}
			end
			
			if not ExtraHandling(remaining,allowCats, SeasoningList) then
				return nil,{}
			end

		else
			for i,v in ipairs(remaining) do
				if isSeasoning(v.name) then
					table.insert(SeasoningList,v.name)
				else
					return nil,{}
				end
			end
		end
		
		return recipe, SeasoningList
	end

	
	local RecipeData=nil
	local SeasoningList={}
	
	for _, recipe in ipairs(FlexibleList) do
		if recipe.required and #recipe.required>0 and (not recipe.allowCats or next(recipe.allowCats)==nil) then
			RecipeData,SeasoningList=tryRecipe(recipe)
			if RecipeData then return RecipeData,SeasoningList end
		end
	end

	
	for _, recipe in ipairs(FlexibleList) do
		if recipe.required and #recipe.required > 0 and recipe.allowCats and next(recipe.allowCats)~=nil then
			RecipeData,SeasoningList=tryRecipe(recipe)
			if RecipeData then return RecipeData,SeasoningList end
		end
	end

	
	for _, recipe in ipairs(FlexibleList) do
		if (not recipe.required or #recipe.required == 0) and recipe.allowCats and next(recipe.allowCats) ~= nil then
			RecipeData,SeasoningList=tryRecipe(recipe)
			if RecipeData then return RecipeData,SeasoningList end
		end
	end

	return RecipeData, SeasoningList
end

return module
