BookLearning = {};

--Add skill XP gain to book reading timed action
BOOKLEARNING_ISReadABook_update = ISReadABook.update

function ISReadABook:update()
    BOOKLEARNING_ISReadABook_update(self)
	local checkSuccess;
	local canLearn;
	checkSuccess, canLearn = pcall(BookLearning.checkIfCanLearn, self);
	
	if (checkSuccess and canLearn) then
		BookLearning.gainXP(self);
	end
end

--Sets o to true if the player can learn from this book
BookLearning.checkIfCanLearn = function(self)
	local o = true;
	
	if (not (SkillBook[self.item:getSkillTrained()] ~= nil))
		or self.item:getLvlSkillTrained() > self.character:getPerkLevel(SkillBook[self.item:getSkillTrained()].perk) + 1
		or self.character:HasTrait("Illiterate")
		or self.item:getMaxLevelTrained() < self.character:getPerkLevel(SkillBook[self.item:getSkillTrained()].perk) + 1
	then
		o = false;
	end
	
	return o;
end

--Provides player XP for every page read.
BookLearning.gainXP = function(self)
	local trainedStuff = SkillBook[self.item:getSkillTrained()];
	
--	print( self.item:getSkillTrained())
	
	if not trainedStuff then return end
	local XPRate = nil;
	
	if trainedStuff == SkillBook["Strength"] or trainedStuff == SkillBook["Fitness"] then
		XPRate = BookLearning.xpByPassLevel
	else
		XPRate = BookLearning.xpByLevel
	end
	
	local readPercent = (self.item:getAlreadyReadPages() / self.item:getNumberOfPages()) * 100;
	if readPercent > 100 then
		readPercent = 100;
	end
	
	local targetSkillLevel = self.item:getLvlSkillTrained() + self.item:getNumLevelsTrained() - 1;
	local bookMaxXP = 0;
	for i=1,targetSkillLevel do
		bookMaxXP = (bookMaxXP + XPRate[i]);
	end
	local targetXP = bookMaxXP * (readPercent / 100);
	local xpGained = math.ceil(targetXP - self.character:getXp():getXP(trainedStuff.perk));

	--Fix rounding error for XP on last page
	if readPercent == 100 then
		xpGained = xpGained + 0.1;
	end
	
	if xpGained > 0 then
		self.character:getXp():AddXP(trainedStuff.perk, xpGained);
	end

end

--XP per skill level as of 41.50
BookLearning.xpByLevel = {};
BookLearning.xpByLevel[0] = 0;
BookLearning.xpByLevel[1] = 75;
BookLearning.xpByLevel[2] = 150;
BookLearning.xpByLevel[3] = 300;
BookLearning.xpByLevel[4] = 750;
BookLearning.xpByLevel[5] = 1500;
BookLearning.xpByLevel[6] = 3000;
BookLearning.xpByLevel[7] = 4500;
BookLearning.xpByLevel[8] = 6000;
BookLearning.xpByLevel[9] = 7500;
BookLearning.xpByLevel[10] = 9000;

BookLearning.xpByPassLevel = {};
BookLearning.xpByPassLevel[0] = 0;
BookLearning.xpByPassLevel[1] = 1500;
BookLearning.xpByPassLevel[2] = 3000;
BookLearning.xpByPassLevel[3] = 6000;
BookLearning.xpByPassLevel[4] = 9000;
BookLearning.xpByPassLevel[5] = 18000;
BookLearning.xpByPassLevel[6] = 30000;
BookLearning.xpByPassLevel[7] = 60000;
BookLearning.xpByPassLevel[8] = 90000;
BookLearning.xpByPassLevel[9] = 120000;
BookLearning.xpByPassLevel[10] = 150000;