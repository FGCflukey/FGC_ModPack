require "ISUI/ISPanelJoypad"
require "ISUI/ISUI3DModel"
require "XpSystem/ISUI/ISCharacterScreen"

ISCharacterScreen.loadTraits = function(self)
	for _,image in ipairs(self.traits) do
		self:removeChild(image)
	end
	table.wipe(self.traits);
	self:setDisplayedTraits()
	for _,trait in ipairs(self.displayedTraits) do
		local textImage = ISImage:new(0, 0, trait:getTexture():getWidthOrig(), trait:getTexture():getHeightOrig(), trait:getTexture());
		textImage:initialise();
		local color = " <RGB:1,1,1>";
		local Type = "";
		local cost = trait:getCost();
		if cost < 0 then
			color = " <RGB:1,0,0>"; --Rojo
			Type = getText("IGUI_TraitInfoNeg") .. " (" .. tostring(cost) ..")"
		elseif cost == 0 then
			color = " <RGB:1,0.87,0>"; -- Amarillo
			Type = getText("IGUI_TraitInfoProf")
		elseif cost > 0 then
			color = " <RGB:0,1,0>"; -- Verde
			Type = getText("IGUI_TraitInfoPos") .. " (" .. tostring(cost) ..")"
		end
		local Ttext = color .. trait:getLabel() .. " " .. Type .. " <LINE> <RGB:1,1,1>" .. trait:getDescription();
		textImage:setMouseOverText(Ttext);
		textImage:setVisible(false);
		textImage.trait = trait;
		self:addChild(textImage);
		table.insert(self.traits, textImage);
	end
	self.Strength = self.char:getPerkLevel(Perks.Strength)
	self.Fitness = self.char:getPerkLevel(Perks.Fitness)
end