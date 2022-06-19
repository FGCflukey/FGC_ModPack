--[[							
OPTION CONFIGURED MULTI-DISTRIBUTION METHOD SYSTEM DESIGNED BY ARSENAL[26].							
THIS IS A WORK IN PROGRESS, AND AS SUCH… NO PERMISSION IS GRANTED FOR USE OF							
ANY PORTION OF THIS FILE FOR 3RD PARTY MODS, TWEAKS, PATCHES, OR ANYTHING OF							
THE LIKE. THAT MEANS YOU DO NOT HAVE PERMISSION TO CHANGE A FEW NUMBERS							
AROUND AND POST ANY OF THIS AS YOUR OWN MOD.							
]]							
							
local SETTINGS = {							
	options = {						
		box1		=	false	,	-- SHOW HIT DAMAGE		(true or false)
		box2		=	false	,	-- SHOW HIT % RANGE		(true or false)
		dropdown3	=	1	,	-- SHOW WEAPON INFO		(1 - 3)
		box4		=	true	,	-- DISPLAY AMMO COUNTER		(true or false)
		box5		=	true	,	-- DISPLAY MOVEMENT GAUGE	(true or false)
		box6		=	true	,	-- DYNAMIC RECOIL SYSTEM	(true or false)
		dropdown7	=	2	,	-- DYNAMIC RANGE SYSTEM		(1 - 5)
		box8		=	true	,	-- RESET SIGHT PICTURE		(true or false)
		dropdown9	=	2	,	-- FIREARM JAM			(1 - 5)
		box10		=	false	,	-- FIREARMS NEVER BREAK		(true or false)
		dropdown11	=	5	,	-- ATTACHMENTS BREAK ON MELEE	(1 - 5)
		dropdown12	=	5	,	-- ATTACHMENTS BREAK ON FIRE	(1 - 5)
		dropdown13	=	4	,	-- SOUND SUPPRESSION		(1 - 6)
		dropdown14	=	11	,	-- SOUND LINEAR BASE		(1 - 21)	
		dropdown15	=	3	,	-- LAUNCHER RANGE MULTIPLIER	(1 - 5)	
		box16		=	true	,	-- VEHICLE PENALTY		(true or false)
		dropdown17	=	2	,	-- DEBUG LEVELS			(1 - 4)	
		box18		=	false	,	-- NO KNOCK-DOWN		(true or false)
		dropdown19	=	11	,	-- SHELL EJECTION 100%
		dropdown20	=	2	,	-- TYPE	BOW			(1 - 11)
		dropdown21	=	6	,	-- TYPE	FLAME			(1 - 11)
		dropdown22	=	6	,	-- TYPE	GRENADE / ROCKET	(1 - 11)
		dropdown23	=	2	,	-- TYPE	MINIGUN			(1 - 11)
		dropdown24	=	11	,	-- TYPE	LIGHT MACHINEGUN	(1 - 11)
		dropdown25	=	11	,	-- TYPE	SEMI AUTOMATIC		(1 - 11)
		dropdown26	=	11	,	-- TYPE	AUTOMATIC RIFLE		(1 - 11)
		dropdown27	=	11	,	-- TYPE	AUTOMATIC PISTOL	(1 - 11)
		dropdown28	=	11	,	-- TYPE	LEVERGUN		(1 - 11)
		dropdown29	=	11	,	-- TYPE	REVOLVER		(1 - 11)
		dropdown30	=	11	,	-- TYPE	PUMP ACTION		(1 - 11)	
		dropdown31	=	11	,	-- TYPE	BOLT ACTION		(1 - 11)
		dropdown32	=	11	,	-- TYPE	BREAK ACTION		(1 - 11)
		dropdown33	=	11	,	-- ORIGIN (UNITED STATES)	(1 - 11)
		dropdown34	=	7	,	-- ORIGIN (SOVIET UNION)	(1 - 11)
		dropdown35	=	1	,	-- ORIGIN (REP KOREA)		(1 - 11)
		dropdown36	=	4	,	-- ORIGIN (PAC RIM)		(1 - 11)
		dropdown37	=	6	,	-- ORIGIN (CZECH REP)		(1 - 11)
		dropdown38	=	6	,	-- ORIGIN (EUROPE)		(1 - 11)
		dropdown39	=	4	,	-- ORIGIN (ISREAL)		(1 - 11)
		dropdown40	=	6	,	-- ORIGIN (REST WORLD)		(1 - 11)
		dropdown41	=	6	,	-- CALIBER (50 BMG/MAG)		(1 - 11)
		dropdown42	=	2	,	-- CALIBER (4g SHOT)		(1 - 11)
		dropdown43	=	2	,	-- CALIBER (10g SHOT)		(1 - 11)
		dropdown44	=	11	,	-- CALIBER (12g SHOT)		(1 - 11)
		dropdown45	=	2	,	-- CALIBER (20g SHOT)		(1 - 11)
		dropdown46	=	5	,	-- CALIBER (30-06 SPG)		(1 - 11)
		dropdown47	=	11	,	-- CALIBER (308 WIN)		(1 - 11)
		dropdown48	=	11	,	-- CALIBER (7.62x54mm R)	(1 - 11)
		dropdown49	=	9	,	-- CALIBER (5.45x39mm)		(1 - 11)
		dropdown50	=	11	,	-- CALIBER (7.62x39mm)		(1 - 11)
		dropdown51	=	11	,	-- CALIBER (5.56x45mm)		(1 - 11)
		dropdown52	=	4	,	-- CALIBER (.223 REM)		(1 - 11)
		dropdown53	=	4	,	-- CALIBER (45 COLT / 410g)	(1 - 11)
		dropdown54	=	2	,	-- CALIBER (46-70)		(1 - 11)
		dropdown55	=	4	,	-- CALIBER (44 Mag)		(1 - 11)
		dropdown56	=	11	,	-- CALIBER (45 ACP)		(1 - 11)
		dropdown57	=	5	,	-- CALIBER (38 SPC)		(1 - 11)
		dropdown58	=	11	,	-- CALIBER (9mm)		(1 - 11)
		dropdown59	=	6	,	-- CALIBER (5.7x28mm)		(1 - 11)
		dropdown60	=	5	,	-- CALIBER (380 ACP)		(1 - 11)
		dropdown61	=	11	,	-- CALIBER (22 LR)		(1 - 11)
		dropdown62	=	11	,	-- CALIBER (177 BB)		(1 - 11)
		dropdown63	=	2	,	-- RANDOM CASES / CCW		(1 - 11)	
		dropdown64	=	3	,	-- ATTACHMENT SUPPRESSOR	(1 - 11)	
		dropdown65	=	4	,	-- ATTACHMENT OPTICS		(1 - 11)	
		dropdown66	=	4	,	-- ATTACHMENT LIGHTS / LASER	(1 - 11)
		dropdown67	=	4	,	-- ATTACHMENT ALL OTHER		(1 - 11)
		dropdown68	=	6	,	-- AMMUNITION CANISTER		(1 - 11)
		dropdown69	=	7	,	-- AMMUNITION BOX		(1 - 11)
		dropdown70	=	7	,	-- MAGAZINE STANDARD		(1 - 11)
		dropdown71	=	5	,	-- MAGAZINE EXTENDED		(1 - 11)
		dropdown72	=	2	,	-- MAGAZINE DRUM		(1 - 11)
		dropdown73	=	3	,	-- POLYMER CANISTER		(1 - 11)
		dropdown74	=	3	,	-- MELEE KNIFE LARGE		(1 - 11)
		dropdown75	=	2	,	-- MELEE KNIFE SMALL		(1 - 11)
		dropdown76	=	4	,	-- MELEE SWORD			(1 - 11)
		dropdown77	=	4	,	-- MELEE AXE			(1 - 11)
		dropdown78	=	3	,	-- MELEE BLUNT			(1 - 11)
		dropdown79	=	6	,	-- MELEE SPEAR			(1 - 11)
		dropdown80	=	8	,	-- ARMOR (Brita's / USMC)	(1 - 21)
		dropdown81	=	1	,	-- POST 1992 PRODUCTION		(1 - 5)	
		dropdown82	=	1	,	-- LEO IN CIV			(1 - 5)
		dropdown83	=	1	,	-- MIL IN CIV			(1 - 5)	
		dropdown84	=	1	,	-- CIV IN LEO			(1 - 5)	
		dropdown85	=	1	,	-- MIL IN LEO			(1 - 5)	
		dropdown86	=	1	,	-- NON MIL IN MIL		(1 - 5)
		dropdown87	=	1	,	-- NON SEC IN SEC		(1 - 5)
		dropdown88	=	1	,	-- NON HNT IN HNT		(1 - 5)
		dropdown89	=	1	,	-- NON SUR IN SUR		(1 - 5)
		dropdown90	=	3	,	-- ROLLS GUNSTORE (GUNS)	(1 - 5)
		dropdown91	=	3	,	-- ROLLS GUNSTORE (AMMO)	(1 - 5)	
		dropdown92	=	1	,	-- ROLLS GUNSTORE (PARTS)	(1 - 5)
		dropdown93	=	3	,	-- ROLLS GUNSTORE (ARMOR)	(1 - 5)
		dropdown94	=	2	,	-- ROLLS POLICE (GUNS+++)	(1 - 5)
		dropdown95	=	3	,	-- ROLLS POLICE (AMMO/MAG)	(1 - 5)	
		dropdown96	=	1	,	-- ROLLS POLICE (NOT USED)	(1 - 5)
		dropdown97	=	3	,	-- ROLLS POLICE (ARMOR)		(1 - 5)
		dropdown98	=	4	,	-- ROLLS MILITARY (GUNS+++)	(1 - 5)
		dropdown99	=	4	,	-- ROLLS MILITARY (AMMO/MAG)	(1 - 5)
		dropdown100	=	1	,	-- ROLLS MILITARY (NOT USED)	(1 - 5)
		dropdown101	=	1	,	-- ROLLS MILITARY (ARMOR)	(1 - 5)
		dropdown102	=	1	,	-- ROLLS SECURITY (GUNS+++)	(1 - 5)
		dropdown103	=	2	,	-- ROLLS SECURITY (AMMO/MAG)	(1 - 5)
		dropdown104	=	1	,	-- ROLLS SECURITY (NOT USED)	(1 - 5)
		dropdown105	=	3	,	-- ROLLS SECURITY (ARMOR)	(1 - 5)
		dropdown106	=	1	,	-- ROLLS SURPLUS (GUNS)		(1 - 5)
		dropdown107	=	2	,	-- ROLLS SURPLUS (AMMO)		(1 - 5)
		dropdown108	=	1	,	-- ROLLS SURPLUS (PARTS)	(1 - 5)
		dropdown109	=	3	,	-- ROLLS SURPLUS (ARMOR)	(1 - 5)
		dropdown110	=	1	,	-- ROLLS HUNTING (GUNS)		(1 - 5)
		dropdown111	=	3	,	-- ROLLS HUNTING (AMMO)		(1 - 5)
		dropdown112	=	1	,	-- ROLLS HUNTING (PARTS)	(1 - 5)
		dropdown113	=	3	,	-- ROLLS HUNTING (ARMOR)	(1 - 5)
		dropdown114	=	6	,	-- CIVx				(1 - 21)
		dropdown115	=	11	,	-- LEOx				(1 - 21)
		dropdown116	=	21	,	-- MILx				(1 - 31)
		dropdown117	=	5	,	-- SECx				(1 - 21)
		dropdown118	=	11	,	-- HNTx				(1 - 21)
		dropdown119	=	5	,	-- SURx				(1 - 21)
		box120		=	true	,	-- CIVammo			(true or false)
		box121		=	true	,	-- LEOammo			(true or false)
		box122		=	true	,	-- MILammo			(true or false)
		box123		=	true	,	-- SECammo			(true or false)
		box124		=	true	,	-- HNTammo			(true or false)
		box125		=	true	,	-- SURammo			(true or false)
		dropdown126	=	1	,	-- MIL REGION 			(1 to 10)
							
	},						
	names = {						
		box1	 = "Show Hit Damage",				
		box2	 = "Show Range/Hit%",				
		dropdown3	 = "Show Weapon Info",				
		box4	 = "Show Ammunition",				
		box5	 = "Movement Gauge",				
		box6	 = "Dynamic Recoil System",				
		dropdown7	 = "Dynamic Range System",				
		box8	 = "Reset Sight Picture",				
		dropdown9	 = "Firearm Jam Frequency",				
		box10	 = "Firearms Never Break",				
		dropdown11	 = "Attachment Break on Melee",				
		dropdown12	 = "Attachment Break on Fire",				
		dropdown13	 = "Suppression Level",				
		dropdown14	 = "Base Sound Level",				
		dropdown15	 = "Launcher Range Multiplier",				
		box16	 = "Vehicle Penalty",				
		dropdown17	 = "Debug Confirmation Level",				
		box18	 = "Use Vanilla Shot Sounds (Not Brita's)",				
		dropdown19	 = "Eject Spent Shells",				
		dropdown20	 = "Type (Bow / Crossbow)",				
		dropdown21	 = "Type (Flame Thrower)",				
		dropdown22	 = "Type (Grenade Launcher)",				
		dropdown23	 = "Type (Mini-Gun)",				
		dropdown24	 = "Type (Light Machinegun)",				
		dropdown25	 = "Type (Semi-Automatic)",				
		dropdown26	 = "Type (Rifle Caliber Automatic)",				
		dropdown27	 = "Type (Pistol Caliber Automatic)",				
		dropdown28	 = "Type (Lever- Action)",				
		dropdown29	 = "Type (Revolver)",				
		dropdown30	 = "Type (Pump-Action)",				
		dropdown31	 = "Type (Bolt-Action)",				
		dropdown32	 = "Type (Break-Barrel / Single-Shot)",				
		dropdown33	 = "Origin (UNITED STATES)",				
		dropdown34	 = "Origin (SOVIET UNION)",				
		dropdown35	 = "Origin (REPUBLIC OF KOREA)",				
		dropdown36	 = "Origin (PACIFIC RIM)",				
		dropdown37	 = "Origin (CZECH REPUBLIC)",				
		dropdown38	 = "Origin (EUROPE)",				
		dropdown39	 = "Origin (ISREAL)",				
		dropdown40	 = "Origin (REST OF WORLD)",				
		dropdown41	 = "Caliber (.50 BMG/MAG)",				
		dropdown42	 = "Caliber (4g SHOT)",				
		dropdown43	 = "Caliber (10g SHOT)",				
		dropdown44	 = "Caliber (12g SHOT)",				
		dropdown45	 = "Caliber (20g SHOT)",				
		dropdown46	 = "Caliber (.30-06 SPG)",				
		dropdown47	 = "Caliber (.308 Win)",				
		dropdown48	 = "Caliber (7.62x54mm R)",				
		dropdown49	 = "Caliber (5.45x39mm)",				
		dropdown50	 = "Caliber (7.62x39mm)",				
		dropdown51	 = "Caliber (5.56x45mm)",				
		dropdown52	 = "Caliber (.223 REM)",				
		dropdown53	 = "Caliber (.45 COLT / .410g)",				
		dropdown54	 = "Caliber (.45-70 GOV)",				
		dropdown55	 = "Caliber (.44 MAG)",				
		dropdown56	 = "Caliber (.45 ACP)",				
		dropdown57	 = "Caliber (.38  Spc /.357 MAG)",				
		dropdown58	 = "Caliber (9x19mm LUG)",				
		dropdown59	 = "Caliber (5.7x28mm)",				
		dropdown60	 = "Caliber (.380 ACP)",				
		dropdown61	 = "Caliber (.22 LR)",				
		dropdown62	 = "Caliber (.177 BB)",				
		dropdown63	 = "Random Gun-Cases & CCW Zombies",				
		dropdown64	 = "Attachment (Suppressors)",				
		dropdown65	 = "Attachment (Optics & Scopes)",				
		dropdown66	 = "Attachment (Lights & Lasers)",				
		dropdown67	 = "Attachment (ALL Other Parts)",				
		dropdown68	 = "Ammunition (Canister)",				
		dropdown69	 = "Ammunition (Box)",				
		dropdown70	 = "Magazine (Standard)",				
		dropdown71	 = "Magazine (Extended)",				
		dropdown72	 = "Magazine (Drum)",				
		dropdown73	 = "Poly Canister (Magazines)",				
		dropdown74	 = "Melee Knife (Small)",				
		dropdown75	 = "Melee Knife (Large)",				
		dropdown76	 = "Melee Sword",				
		dropdown77	 = "Melee Axe",				
		dropdown78	 = "Melee Blunt",				
		dropdown79	 = "Melee Spear",				
		dropdown80	 = "Armor (Brita's Armor Pack & USMC Armory)",				
		dropdown81	 = "Weapons Produced after 1992",				
		dropdown82	 = "Police   items in CIV locations",				
		dropdown83	 = "Military items in CIV locaions",				
		dropdown84	 = "Civilian items in LEO locations",				
		dropdown85	 = "Military items in LEO locations",				
		dropdown86	 = "NON-Military items in MIL locations",				
		dropdown87	 = "NON-Security items in SEC locations",				
		dropdown88	 = "NON-Hunting items in HNT locations",				
		dropdown89	 = "NON-Surplus items in SUR locations",				
		dropdown90	 = "GUN-STORE Roll (GUNS)",				
		dropdown91	 = "(AMMO)",				
		dropdown92	 = "(PARTS)",				
		dropdown93	 = "(ARMOR)",				
		dropdown94	 = "POLICE Roll (GUNS / PARTS / MAGS / AMMO)",				
		dropdown95	 = "(AMMO / MAGS)",				
		dropdown96	 = "(NOT USED)",				
		dropdown97	 = "(ARMOR)",				
		dropdown98	 = "MILITARY Roll (GUNS / PARTS / MAGS / AMMO)",				
		dropdown99	 = "(AMMO / MAGS)",				
		dropdown100	 = "(NOT USED)",				
		dropdown101	 = "(ARMOR)",				
		dropdown102	 = "SECURITY Roll (GUNS / PARTS / MAGS / AMMO)",				
		dropdown103	 = "(AMMO / MAGS)",				
		dropdown104	 = "(NOT USED)",				
		dropdown105	 = "(ARMOR)",				
		dropdown106	 = "SURPLUS Roll (GUNS)",				
		dropdown107	 = "(AMMO)",				
		dropdown108	 = "(PARTS)",				
		dropdown109	 = "(ARMOR)",				
		dropdown110	 = "HUNTING Roll (GUNS)",				
		dropdown111	 = "(AMMO)",				
		dropdown112	 = "(PARTS)",				
		dropdown113	 = "(ARMOR)",				
		dropdown114	 = "CIV Trim (+) Increase",				
		dropdown115	 = "LEO Trim (+) Increase",				
		dropdown116	 = "MIL Trim (+) Increase",				
		dropdown117	 = "SEC Trim (+) Increase",				
		dropdown118	 = "HNT Trim (+) Increase",				
		dropdown119	 = "SUR Trim (+) Increase",				
		box120	 = "CIV Spawn Associated Ammo",				
		box121	 = "LEO Spawn Associated Ammo",				
		box122	 = "MIL Spawn Associated Ammo",				
		box123	 = "SEC Spawn Associated Ammo",				
		box124	 = "HNT Spawn Associated Ammo",				
		box125	 = "SUR Spawn Associated Ammo",				
		dropdown126	 = "REGIONAL MILITARY (Use MIL Trim to Re-Balance)",				
	},						
	mod_id = "Arsenal(26)GunFighter",						
	mod_shortname= "GunFighter Options",						
}							
							
-- Connecting the options to the menu, so user can change and save them.							
if ModOptions and ModOptions.getInstance then							
	ModOptions:getInstance(SETTINGS)						
							
	local opt1 = SETTINGS.options_data.box1						
	local opt2 = SETTINGS.options_data.box2						
	local drop3 = SETTINGS.options_data.dropdown3						
	drop3[1] = ("OFF")						
	drop3[2] = ("Firearms")						
	drop3[3] = ("Firearms + Melee")						
	local opt4 = SETTINGS.options_data.box4						
	local opt5 = SETTINGS.options_data.box5						
	local opt6 = SETTINGS.options_data.box6						
	local drop7 = SETTINGS.options_data.dropdown7						
	drop7[1] = ("0% --- No Penalty")						
	drop7[2] = ("25% -- Low Penalty")						
	drop7[3] = ("50% -- Med Penalty")						
	drop7[4] = ("75% -- High Penalty")						
	drop7[5] = ("100% - Max Penalty")						
	local opt8 = SETTINGS.options_data.box8						
	local drop9 = SETTINGS.options_data.dropdown9						
	drop9[1] = ("100% - Default")						
	drop9[2] = ("75% -- Less often")						
	drop9[3] = ("50% -- Rare")						
	drop9[4] = ("25% -- Hardly Ever")						
	drop9[5] = ("0% --- NEVER")						
	local opt10 = SETTINGS.options_data.box10						
	local drop11 = SETTINGS.options_data.dropdown11						
	drop11[1] = ("100% - Default")						
	drop11[2] = ("75% -- Less often")						
	drop11[3] = ("50% -- Rare")						
	drop11[4] = ("25% -- Hardly Ever")						
	drop11[5] = ("0% --- NEVER")						
	local drop12 = SETTINGS.options_data.dropdown12						
	drop12[1] = ("100% - Default")						
	drop12[2] = ("75% -- Less often")						
	drop12[3] = ("50% -- Rare")						
	drop12[4] = ("25% -- Hardly Ever")						
	drop12[5] = ("0% --- NEVER")						
	local drop13 = SETTINGS.options_data.dropdown13						
	drop13[1] = ("150% - Loudest")						
	drop13[2] = ("125% - Louder")						
	drop13[3] = ("100% - Default")						
	drop13[4] = ("75% -- Quiet")						
	drop13[5] = ("50% -- Whisper")						
	drop13[6] = ("25% -- MouseFart")						
	local drop14 = SETTINGS.options_data.dropdown14						
	drop14[1] =  ("+0 --- No Boost")						
	drop14[2] =  ("+10 -- Linear Adjust")						
	drop14[3] =  ("+20 -- Linear Adjust")						
	drop14[4] =  ("+30 -- Linear Adjust")						
	drop14[5] =  ("+40 -- Linear Adjust")						
	drop14[6] =  ("+50 -- Linear Adjust")						
	drop14[7] =  ("+60 -- Linear Adjust")						
	drop14[8] =  ("+70 -- Linear Adjust")						
	drop14[9] =  ("+80 -- Linear Adjust")						
	drop14[10] = ("+90 -- Linear Adjust")						
	drop14[11] = ("+100 -- Linear Adjust")						
	drop14[12] = ("+110 - Linear Adjust")						
	drop14[13] = ("+120 - Linear Adjust")						
	drop14[14] = ("+130 - Linear Adjust")						
	drop14[15] = ("+140 - Linear Adjust")						
	drop14[16] = ("+150 - Linear Adjust")						
	drop14[17] = ("+160 - Linear Adjust")						
	drop14[18] = ("+170 - Linear Adjust")						
	drop14[19] = ("+180 - Linear Adjust")						
	drop14[20] = ("+190 - Linear Adjust")						
	drop14[21] = ("+200 - Linear Adjust")						
	local drop15 = SETTINGS.options_data.dropdown15						
	drop15[1] = ("100% - Default")						
	drop15[2] = ("150% - Farther")						
	drop15[3] = ("200% - Farther")						
	drop15[4] = ("250% - Farther")						
	drop15[5] = ("300% - Farther")						
	local opt16 = SETTINGS.options_data.box16						
	local drop17 = SETTINGS.options_data.dropdown17						
	drop17[1] = ("OFF")						
	drop17[2] = ("Normal Info")						
	drop17[3] = ("Debug Info")						
	drop17[4] = ("Temp Test Info")						
	local opt18 = SETTINGS.options_data.box18						
	local drop19 = SETTINGS.options_data.dropdown19						
	drop19[1]	 = ("NONE")					
	drop19[2]	 = ("10%")					
	drop19[3]	 = ("20%")					
	drop19[4]	 = ("30%")					
	drop19[5]	 = ("40%")					
	drop19[6]	 = ("50%")					
	drop19[7]	 = ("60%")					
	drop19[8]	 = ("70%")					
	drop19[9]	 = ("80%")					
	drop19[10]	 = ("90%")					
	drop19[11]	 = ("100%")					
	local drop20 = SETTINGS.options_data.dropdown20						
	drop20[1]	 = ("REMOVE")					
	drop20[2]	 = ("10%")					
	drop20[3]	 = ("20%")					
	drop20[4]	 = ("30%")					
	drop20[5]	 = ("40%")					
	drop20[6]	 = ("50%")					
	drop20[7]	 = ("60%")					
	drop20[8]	 = ("70%")					
	drop20[9]	 = ("80%")					
	drop20[10]	 = ("90%")					
	drop20[11]	 = ("100%")					
	local drop21 = SETTINGS.options_data.dropdown21						
	drop21[1]	 = ("REMOVE")					
	drop21[2]	 = ("10%")					
	drop21[3]	 = ("20%")					
	drop21[4]	 = ("30%")					
	drop21[5]	 = ("40%")					
	drop21[6]	 = ("50%")					
	drop21[7]	 = ("60%")					
	drop21[8]	 = ("70%")					
	drop21[9]	 = ("80%")					
	drop21[10]	 = ("90%")					
	drop21[11]	 = ("100%")					
	local drop22 = SETTINGS.options_data.dropdown22						
	drop22[1]	 = ("REMOVE")					
	drop22[2]	 = ("10%")					
	drop22[3]	 = ("20%")					
	drop22[4]	 = ("30%")					
	drop22[5]	 = ("40%")					
	drop22[6]	 = ("50%")					
	drop22[7]	 = ("60%")					
	drop22[8]	 = ("70%")					
	drop22[9]	 = ("80%")					
	drop22[10]	 = ("90%")					
	drop22[11]	 = ("100%")					
	local drop23 = SETTINGS.options_data.dropdown23						
	drop23[1]	 = ("REMOVE")					
	drop23[2]	 = ("10%")					
	drop23[3]	 = ("20%")					
	drop23[4]	 = ("30%")					
	drop23[5]	 = ("40%")					
	drop23[6]	 = ("50%")					
	drop23[7]	 = ("60%")					
	drop23[8]	 = ("70%")					
	drop23[9]	 = ("80%")					
	drop23[10]	 = ("90%")					
	drop23[11]	 = ("100%")					
	local drop24 = SETTINGS.options_data.dropdown24						
	drop24[1]	 = ("REMOVE")					
	drop24[2]	 = ("10%")					
	drop24[3]	 = ("20%")					
	drop24[4]	 = ("30%")					
	drop24[5]	 = ("40%")					
	drop24[6]	 = ("50%")					
	drop24[7]	 = ("60%")					
	drop24[8]	 = ("70%")					
	drop24[9]	 = ("80%")					
	drop24[10]	 = ("90%")					
	drop24[11]	 = ("100%")					
	local drop25 = SETTINGS.options_data.dropdown25						
	drop25[1]	 = ("REMOVE")					
	drop25[2]	 = ("10%")					
	drop25[3]	 = ("20%")					
	drop25[4]	 = ("30%")					
	drop25[5]	 = ("40%")					
	drop25[6]	 = ("50%")					
	drop25[7]	 = ("60%")					
	drop25[8]	 = ("70%")					
	drop25[9]	 = ("80%")					
	drop25[10]	 = ("90%")					
	drop25[11]	 = ("100%")					
	local drop26 = SETTINGS.options_data.dropdown26						
	drop26[1]	 = ("REMOVE")					
	drop26[2]	 = ("10%")					
	drop26[3]	 = ("20%")					
	drop26[4]	 = ("30%")					
	drop26[5]	 = ("40%")					
	drop26[6]	 = ("50%")					
	drop26[7]	 = ("60%")					
	drop26[8]	 = ("70%")					
	drop26[9]	 = ("80%")					
	drop26[10]	 = ("90%")					
	drop26[11]	 = ("100%")					
	local drop27 = SETTINGS.options_data.dropdown27						
	drop27[1]	 = ("REMOVE")					
	drop27[2]	 = ("10%")					
	drop27[3]	 = ("20%")					
	drop27[4]	 = ("30%")					
	drop27[5]	 = ("40%")					
	drop27[6]	 = ("50%")					
	drop27[7]	 = ("60%")					
	drop27[8]	 = ("70%")					
	drop27[9]	 = ("80%")					
	drop27[10]	 = ("90%")					
	drop27[11]	 = ("100%")					
	local drop28 = SETTINGS.options_data.dropdown28						
	drop28[1]	 = ("REMOVE")					
	drop28[2]	 = ("10%")					
	drop28[3]	 = ("20%")					
	drop28[4]	 = ("30%")					
	drop28[5]	 = ("40%")					
	drop28[6]	 = ("50%")					
	drop28[7]	 = ("60%")					
	drop28[8]	 = ("70%")					
	drop28[9]	 = ("80%")					
	drop28[10]	 = ("90%")					
	drop28[11]	 = ("100%")					
	local drop29 = SETTINGS.options_data.dropdown29						
	drop29[1]	 = ("REMOVE")					
	drop29[2]	 = ("10%")					
	drop29[3]	 = ("20%")					
	drop29[4]	 = ("30%")					
	drop29[5]	 = ("40%")					
	drop29[6]	 = ("50%")					
	drop29[7]	 = ("60%")					
	drop29[8]	 = ("70%")					
	drop29[9]	 = ("80%")					
	drop29[10]	 = ("90%")					
	drop29[11]	 = ("100%")					
	local drop30 = SETTINGS.options_data.dropdown30						
	drop30[1]	 = ("REMOVE")					
	drop30[2]	 = ("10%")					
	drop30[3]	 = ("20%")					
	drop30[4]	 = ("30%")					
	drop30[5]	 = ("40%")					
	drop30[6]	 = ("50%")					
	drop30[7]	 = ("60%")					
	drop30[8]	 = ("70%")					
	drop30[9]	 = ("80%")					
	drop30[10]	 = ("90%")					
	drop30[11]	 = ("100%")					
	local drop31 = SETTINGS.options_data.dropdown31						
	drop31[1]	 = ("REMOVE")					
	drop31[2]	 = ("10%")					
	drop31[3]	 = ("20%")					
	drop31[4]	 = ("30%")					
	drop31[5]	 = ("40%")					
	drop31[6]	 = ("50%")					
	drop31[7]	 = ("60%")					
	drop31[8]	 = ("70%")					
	drop31[9]	 = ("80%")					
	drop31[10]	 = ("90%")					
	drop31[11]	 = ("100%")					
	local drop32 = SETTINGS.options_data.dropdown32						
	drop32[1]	 = ("REMOVE")					
	drop32[2]	 = ("10%")					
	drop32[3]	 = ("20%")					
	drop32[4]	 = ("30%")					
	drop32[5]	 = ("40%")					
	drop32[6]	 = ("50%")					
	drop32[7]	 = ("60%")					
	drop32[8]	 = ("70%")					
	drop32[9]	 = ("80%")					
	drop32[10]	 = ("90%")					
	drop32[11]	 = ("100%")					
	local drop33 = SETTINGS.options_data.dropdown33						
	drop33[1]	 = ("REMOVE")					
	drop33[2]	 = ("10%")					
	drop33[3]	 = ("20%")					
	drop33[4]	 = ("30%")					
	drop33[5]	 = ("40%")					
	drop33[6]	 = ("50%")					
	drop33[7]	 = ("60%")					
	drop33[8]	 = ("70%")					
	drop33[9]	 = ("80%")					
	drop33[10]	 = ("90%")					
	drop33[11]	 = ("100%")					
	local drop34 = SETTINGS.options_data.dropdown34						
	drop34[1]	 = ("REMOVE")					
	drop34[2]	 = ("10%")					
	drop34[3]	 = ("20%")					
	drop34[4]	 = ("30%")					
	drop34[5]	 = ("40%")					
	drop34[6]	 = ("50%")					
	drop34[7]	 = ("60%")					
	drop34[8]	 = ("70%")					
	drop34[9]	 = ("80%")					
	drop34[10]	 = ("90%")					
	drop34[11]	 = ("100%")					
	local drop35 = SETTINGS.options_data.dropdown35						
	drop35[1]	 = ("REMOVE")					
	drop35[2]	 = ("10%")					
	drop35[3]	 = ("20%")					
	drop35[4]	 = ("30%")					
	drop35[5]	 = ("40%")					
	drop35[6]	 = ("50%")					
	drop35[7]	 = ("60%")					
	drop35[8]	 = ("70%")					
	drop35[9]	 = ("80%")					
	drop35[10]	 = ("90%")					
	drop35[11]	 = ("100%")					
	local drop36 = SETTINGS.options_data.dropdown36						
	drop36[1]	 = ("REMOVE")					
	drop36[2]	 = ("10%")					
	drop36[3]	 = ("20%")					
	drop36[4]	 = ("30%")					
	drop36[5]	 = ("40%")					
	drop36[6]	 = ("50%")					
	drop36[7]	 = ("60%")					
	drop36[8]	 = ("70%")					
	drop36[9]	 = ("80%")					
	drop36[10]	 = ("90%")					
	drop36[11]	 = ("100%")					
	local drop37 = SETTINGS.options_data.dropdown37						
	drop37[1]	 = ("REMOVE")					
	drop37[2]	 = ("10%")					
	drop37[3]	 = ("20%")					
	drop37[4]	 = ("30%")					
	drop37[5]	 = ("40%")					
	drop37[6]	 = ("50%")					
	drop37[7]	 = ("60%")					
	drop37[8]	 = ("70%")					
	drop37[9]	 = ("80%")					
	drop37[10]	 = ("90%")					
	drop37[11]	 = ("100%")					
	local drop38 = SETTINGS.options_data.dropdown38						
	drop38[1]	 = ("REMOVE")					
	drop38[2]	 = ("10%")					
	drop38[3]	 = ("20%")					
	drop38[4]	 = ("30%")					
	drop38[5]	 = ("40%")					
	drop38[6]	 = ("50%")					
	drop38[7]	 = ("60%")					
	drop38[8]	 = ("70%")					
	drop38[9]	 = ("80%")					
	drop38[10]	 = ("90%")					
	drop38[11]	 = ("100%")					
	local drop39 = SETTINGS.options_data.dropdown39						
	drop39[1]	 = ("REMOVE")					
	drop39[2]	 = ("10%")					
	drop39[3]	 = ("20%")					
	drop39[4]	 = ("30%")					
	drop39[5]	 = ("40%")					
	drop39[6]	 = ("50%")					
	drop39[7]	 = ("60%")					
	drop39[8]	 = ("70%")					
	drop39[9]	 = ("80%")					
	drop39[10]	 = ("90%")					
	drop39[11]	 = ("100%")					
	local drop40 = SETTINGS.options_data.dropdown40						
	drop40[1]	 = ("REMOVE")					
	drop40[2]	 = ("10%")					
	drop40[3]	 = ("20%")					
	drop40[4]	 = ("30%")					
	drop40[5]	 = ("40%")					
	drop40[6]	 = ("50%")					
	drop40[7]	 = ("60%")					
	drop40[8]	 = ("70%")					
	drop40[9]	 = ("80%")					
	drop40[10]	 = ("90%")					
	drop40[11]	 = ("100%")					
	local drop41 = SETTINGS.options_data.dropdown41						
	drop41[1]	 = ("REMOVE")					
	drop41[2]	 = ("10%")					
	drop41[3]	 = ("20%")					
	drop41[4]	 = ("30%")					
	drop41[5]	 = ("40%")					
	drop41[6]	 = ("50%")					
	drop41[7]	 = ("60%")					
	drop41[8]	 = ("70%")					
	drop41[9]	 = ("80%")					
	drop41[10]	 = ("90%")					
	drop41[11]	 = ("100%")					
	local drop42 = SETTINGS.options_data.dropdown42						
	drop42[1]	 = ("REMOVE")					
	drop42[2]	 = ("10%")					
	drop42[3]	 = ("20%")					
	drop42[4]	 = ("30%")					
	drop42[5]	 = ("40%")					
	drop42[6]	 = ("50%")					
	drop42[7]	 = ("60%")					
	drop42[8]	 = ("70%")					
	drop42[9]	 = ("80%")					
	drop42[10]	 = ("90%")					
	drop42[11]	 = ("100%")					
	local drop43 = SETTINGS.options_data.dropdown43						
	drop43[1]	 = ("REMOVE")					
	drop43[2]	 = ("10%")					
	drop43[3]	 = ("20%")					
	drop43[4]	 = ("30%")					
	drop43[5]	 = ("40%")					
	drop43[6]	 = ("50%")					
	drop43[7]	 = ("60%")					
	drop43[8]	 = ("70%")					
	drop43[9]	 = ("80%")					
	drop43[10]	 = ("90%")					
	drop43[11]	 = ("100%")					
	local drop44 = SETTINGS.options_data.dropdown44						
	drop44[1]	 = ("REMOVE")					
	drop44[2]	 = ("10%")					
	drop44[3]	 = ("20%")					
	drop44[4]	 = ("30%")					
	drop44[5]	 = ("40%")					
	drop44[6]	 = ("50%")					
	drop44[7]	 = ("60%")					
	drop44[8]	 = ("70%")					
	drop44[9]	 = ("80%")					
	drop44[10]	 = ("90%")					
	drop44[11]	 = ("100%")					
	local drop45 = SETTINGS.options_data.dropdown45						
	drop45[1]	 = ("REMOVE")					
	drop45[2]	 = ("10%")					
	drop45[3]	 = ("20%")					
	drop45[4]	 = ("30%")					
	drop45[5]	 = ("40%")					
	drop45[6]	 = ("50%")					
	drop45[7]	 = ("60%")					
	drop45[8]	 = ("70%")					
	drop45[9]	 = ("80%")					
	drop45[10]	 = ("90%")					
	drop45[11]	 = ("100%")					
	local drop46 = SETTINGS.options_data.dropdown46						
	drop46[1]	 = ("REMOVE")					
	drop46[2]	 = ("10%")					
	drop46[3]	 = ("20%")					
	drop46[4]	 = ("30%")					
	drop46[5]	 = ("40%")					
	drop46[6]	 = ("50%")					
	drop46[7]	 = ("60%")					
	drop46[8]	 = ("70%")					
	drop46[9]	 = ("80%")					
	drop46[10]	 = ("90%")					
	drop46[11]	 = ("100%")					
	local drop47 = SETTINGS.options_data.dropdown47						
	drop47[1]	 = ("REMOVE")					
	drop47[2]	 = ("10%")					
	drop47[3]	 = ("20%")					
	drop47[4]	 = ("30%")					
	drop47[5]	 = ("40%")					
	drop47[6]	 = ("50%")					
	drop47[7]	 = ("60%")					
	drop47[8]	 = ("70%")					
	drop47[9]	 = ("80%")					
	drop47[10]	 = ("90%")					
	drop47[11]	 = ("100%")					
	local drop48 = SETTINGS.options_data.dropdown48						
	drop48[1]	 = ("REMOVE")					
	drop48[2]	 = ("10%")					
	drop48[3]	 = ("20%")					
	drop48[4]	 = ("30%")					
	drop48[5]	 = ("40%")					
	drop48[6]	 = ("50%")					
	drop48[7]	 = ("60%")					
	drop48[8]	 = ("70%")					
	drop48[9]	 = ("80%")					
	drop48[10]	 = ("90%")					
	drop48[11]	 = ("100%")					
	local drop49 = SETTINGS.options_data.dropdown49						
	drop49[1]	 = ("REMOVE")					
	drop49[2]	 = ("10%")					
	drop49[3]	 = ("20%")					
	drop49[4]	 = ("30%")					
	drop49[5]	 = ("40%")					
	drop49[6]	 = ("50%")					
	drop49[7]	 = ("60%")					
	drop49[8]	 = ("70%")					
	drop49[9]	 = ("80%")					
	drop49[10]	 = ("90%")					
	drop49[11]	 = ("100%")					
	local drop50 = SETTINGS.options_data.dropdown50						
	drop50[1]	 = ("REMOVE")					
	drop50[2]	 = ("10%")					
	drop50[3]	 = ("20%")					
	drop50[4]	 = ("30%")					
	drop50[5]	 = ("40%")					
	drop50[6]	 = ("50%")					
	drop50[7]	 = ("60%")					
	drop50[8]	 = ("70%")					
	drop50[9]	 = ("80%")					
	drop50[10]	 = ("90%")					
	drop50[11]	 = ("100%")					
	local drop51 = SETTINGS.options_data.dropdown51						
	drop51[1]	 = ("REMOVE")					
	drop51[2]	 = ("10%")					
	drop51[3]	 = ("20%")					
	drop51[4]	 = ("30%")					
	drop51[5]	 = ("40%")					
	drop51[6]	 = ("50%")					
	drop51[7]	 = ("60%")					
	drop51[8]	 = ("70%")					
	drop51[9]	 = ("80%")					
	drop51[10]	 = ("90%")					
	drop51[11]	 = ("100%")					
	local drop52 = SETTINGS.options_data.dropdown52						
	drop52[1]	 = ("REMOVE")					
	drop52[2]	 = ("10%")					
	drop52[3]	 = ("20%")					
	drop52[4]	 = ("30%")					
	drop52[5]	 = ("40%")					
	drop52[6]	 = ("50%")					
	drop52[7]	 = ("60%")					
	drop52[8]	 = ("70%")					
	drop52[9]	 = ("80%")					
	drop52[10]	 = ("90%")					
	drop52[11]	 = ("100%")					
	local drop53 = SETTINGS.options_data.dropdown53						
	drop53[1]	 = ("REMOVE")					
	drop53[2]	 = ("10%")					
	drop53[3]	 = ("20%")					
	drop53[4]	 = ("30%")					
	drop53[5]	 = ("40%")					
	drop53[6]	 = ("50%")					
	drop53[7]	 = ("60%")					
	drop53[8]	 = ("70%")					
	drop53[9]	 = ("80%")					
	drop53[10]	 = ("90%")					
	drop53[11]	 = ("100%")					
	local drop54 = SETTINGS.options_data.dropdown54						
	drop54[1]	 = ("REMOVE")					
	drop54[2]	 = ("10%")					
	drop54[3]	 = ("20%")					
	drop54[4]	 = ("30%")					
	drop54[5]	 = ("40%")					
	drop54[6]	 = ("50%")					
	drop54[7]	 = ("60%")					
	drop54[8]	 = ("70%")					
	drop54[9]	 = ("80%")					
	drop54[10]	 = ("90%")					
	drop54[11]	 = ("100%")					
	local drop55 = SETTINGS.options_data.dropdown55						
	drop55[1]	 = ("REMOVE")					
	drop55[2]	 = ("10%")					
	drop55[3]	 = ("20%")					
	drop55[4]	 = ("30%")					
	drop55[5]	 = ("40%")					
	drop55[6]	 = ("50%")					
	drop55[7]	 = ("60%")					
	drop55[8]	 = ("70%")					
	drop55[9]	 = ("80%")					
	drop55[10]	 = ("90%")					
	drop55[11]	 = ("100%")					
	local drop56 = SETTINGS.options_data.dropdown56						
	drop56[1]	 = ("REMOVE")					
	drop56[2]	 = ("10%")					
	drop56[3]	 = ("20%")					
	drop56[4]	 = ("30%")					
	drop56[5]	 = ("40%")					
	drop56[6]	 = ("50%")					
	drop56[7]	 = ("60%")					
	drop56[8]	 = ("70%")					
	drop56[9]	 = ("80%")					
	drop56[10]	 = ("90%")					
	drop56[11]	 = ("100%")					
	local drop57 = SETTINGS.options_data.dropdown57						
	drop57[1]	 = ("REMOVE")					
	drop57[2]	 = ("10%")					
	drop57[3]	 = ("20%")					
	drop57[4]	 = ("30%")					
	drop57[5]	 = ("40%")					
	drop57[6]	 = ("50%")					
	drop57[7]	 = ("60%")					
	drop57[8]	 = ("70%")					
	drop57[9]	 = ("80%")					
	drop57[10]	 = ("90%")					
	drop57[11]	 = ("100%")					
	local drop58 = SETTINGS.options_data.dropdown58						
	drop58[1]	 = ("REMOVE")					
	drop58[2]	 = ("10%")					
	drop58[3]	 = ("20%")					
	drop58[4]	 = ("30%")					
	drop58[5]	 = ("40%")					
	drop58[6]	 = ("50%")					
	drop58[7]	 = ("60%")					
	drop58[8]	 = ("70%")					
	drop58[9]	 = ("80%")					
	drop58[10]	 = ("90%")					
	drop58[11]	 = ("100%")					
	local drop59 = SETTINGS.options_data.dropdown59						
	drop59[1]	 = ("REMOVE")					
	drop59[2]	 = ("10%")					
	drop59[3]	 = ("20%")					
	drop59[4]	 = ("30%")					
	drop59[5]	 = ("40%")					
	drop59[6]	 = ("50%")					
	drop59[7]	 = ("60%")					
	drop59[8]	 = ("70%")					
	drop59[9]	 = ("80%")					
	drop59[10]	 = ("90%")					
	drop59[11]	 = ("100%")					
	local drop60 = SETTINGS.options_data.dropdown60						
	drop60[1]	 = ("REMOVE")					
	drop60[2]	 = ("10%")					
	drop60[3]	 = ("20%")					
	drop60[4]	 = ("30%")					
	drop60[5]	 = ("40%")					
	drop60[6]	 = ("50%")					
	drop60[7]	 = ("60%")					
	drop60[8]	 = ("70%")					
	drop60[9]	 = ("80%")					
	drop60[10]	 = ("90%")					
	drop60[11]	 = ("100%")					
	local drop61 = SETTINGS.options_data.dropdown61						
	drop61[1]	 = ("REMOVE")					
	drop61[2]	 = ("10%")					
	drop61[3]	 = ("20%")					
	drop61[4]	 = ("30%")					
	drop61[5]	 = ("40%")					
	drop61[6]	 = ("50%")					
	drop61[7]	 = ("60%")					
	drop61[8]	 = ("70%")					
	drop61[9]	 = ("80%")					
	drop61[10]	 = ("90%")					
	drop61[11]	 = ("100%")					
	local drop62 = SETTINGS.options_data.dropdown62						
	drop62[1]	 = ("REMOVE")					
	drop62[2]	 = ("10%")					
	drop62[3]	 = ("20%")					
	drop62[4]	 = ("30%")					
	drop62[5]	 = ("40%")					
	drop62[6]	 = ("50%")					
	drop62[7]	 = ("60%")					
	drop62[8]	 = ("70%")					
	drop62[9]	 = ("80%")					
	drop62[10]	 = ("90%")					
	drop62[11]	 = ("100%")					
	local drop63 = SETTINGS.options_data.dropdown63						
	drop63[1]	 = ("REMOVE")					
	drop63[2]	 = ("10%")					
	drop63[3]	 = ("20%")					
	drop63[4]	 = ("30%")					
	drop63[5]	 = ("40%")					
	drop63[6]	 = ("50%")					
	drop63[7]	 = ("60%")					
	drop63[8]	 = ("70%")					
	drop63[9]	 = ("80%")					
	drop63[10]	 = ("90%")					
	drop63[11]	 = ("100%")					
	local drop64 = SETTINGS.options_data.dropdown64						
	drop64[1]	 = ("REMOVE")					
	drop64[2]	 = ("10%")					
	drop64[3]	 = ("20%")					
	drop64[4]	 = ("30%")					
	drop64[5]	 = ("40%")					
	drop64[6]	 = ("50%")					
	drop64[7]	 = ("60%")					
	drop64[8]	 = ("70%")					
	drop64[9]	 = ("80%")					
	drop64[10]	 = ("90%")					
	drop64[11]	 = ("100%")					
	local drop65 = SETTINGS.options_data.dropdown65						
	drop65[1]	 = ("REMOVE")					
	drop65[2]	 = ("10%")					
	drop65[3]	 = ("20%")					
	drop65[4]	 = ("30%")					
	drop65[5]	 = ("40%")					
	drop65[6]	 = ("50%")					
	drop65[7]	 = ("60%")					
	drop65[8]	 = ("70%")					
	drop65[9]	 = ("80%")					
	drop65[10]	 = ("90%")					
	drop65[11]	 = ("100%")					
	local drop66 = SETTINGS.options_data.dropdown66						
	drop66[1]	 = ("REMOVE")					
	drop66[2]	 = ("10%")					
	drop66[3]	 = ("20%")					
	drop66[4]	 = ("30%")					
	drop66[5]	 = ("40%")					
	drop66[6]	 = ("50%")					
	drop66[7]	 = ("60%")					
	drop66[8]	 = ("70%")					
	drop66[9]	 = ("80%")					
	drop66[10]	 = ("90%")					
	drop66[11]	 = ("100%")					
	local drop67 = SETTINGS.options_data.dropdown67						
	drop67[1]	 = ("REMOVE")					
	drop67[2]	 = ("10%")					
	drop67[3]	 = ("20%")					
	drop67[4]	 = ("30%")					
	drop67[5]	 = ("40%")					
	drop67[6]	 = ("50%")					
	drop67[7]	 = ("60%")					
	drop67[8]	 = ("70%")					
	drop67[9]	 = ("80%")					
	drop67[10]	 = ("90%")					
	drop67[11]	 = ("100%")					
	local drop68 = SETTINGS.options_data.dropdown68						
	drop68[1]	 = ("REMOVE")					
	drop68[2]	 = ("10%")					
	drop68[3]	 = ("20%")					
	drop68[4]	 = ("30%")					
	drop68[5]	 = ("40%")					
	drop68[6]	 = ("50%")					
	drop68[7]	 = ("60%")					
	drop68[8]	 = ("70%")					
	drop68[9]	 = ("80%")					
	drop68[10]	 = ("90%")					
	drop68[11]	 = ("100%")					
	local drop69 = SETTINGS.options_data.dropdown69						
	drop69[1]	 = ("REMOVE")					
	drop69[2]	 = ("10%")					
	drop69[3]	 = ("20%")					
	drop69[4]	 = ("30%")					
	drop69[5]	 = ("40%")					
	drop69[6]	 = ("50%")					
	drop69[7]	 = ("60%")					
	drop69[8]	 = ("70%")					
	drop69[9]	 = ("80%")					
	drop69[10]	 = ("90%")					
	drop69[11]	 = ("100%")					
	local drop70 = SETTINGS.options_data.dropdown70						
	drop70[1]	 = ("REMOVE")					
	drop70[2]	 = ("10%")					
	drop70[3]	 = ("20%")					
	drop70[4]	 = ("30%")					
	drop70[5]	 = ("40%")					
	drop70[6]	 = ("50%")					
	drop70[7]	 = ("60%")					
	drop70[8]	 = ("70%")					
	drop70[9]	 = ("80%")					
	drop70[10]	 = ("90%")					
	drop70[11]	 = ("100%")					
	local drop71 = SETTINGS.options_data.dropdown71						
	drop71[1]	 = ("REMOVE")					
	drop71[2]	 = ("10%")					
	drop71[3]	 = ("20%")					
	drop71[4]	 = ("30%")					
	drop71[5]	 = ("40%")					
	drop71[6]	 = ("50%")					
	drop71[7]	 = ("60%")					
	drop71[8]	 = ("70%")					
	drop71[9]	 = ("80%")					
	drop71[10]	 = ("90%")					
	drop71[11]	 = ("100%")					
	local drop72 = SETTINGS.options_data.dropdown72						
	drop72[1]	 = ("REMOVE")					
	drop72[2]	 = ("10%")					
	drop72[3]	 = ("20%")					
	drop72[4]	 = ("30%")					
	drop72[5]	 = ("40%")					
	drop72[6]	 = ("50%")					
	drop72[7]	 = ("60%")					
	drop72[8]	 = ("70%")					
	drop72[9]	 = ("80%")					
	drop72[10]	 = ("90%")					
	drop72[11]	 = ("100%")					
	local drop73 = SETTINGS.options_data.dropdown73						
	drop73[1]	 = ("REMOVE")					
	drop73[2]	 = ("10%")					
	drop73[3]	 = ("20%")					
	drop73[4]	 = ("30%")					
	drop73[5]	 = ("40%")					
	drop73[6]	 = ("50%")					
	drop73[7]	 = ("60%")					
	drop73[8]	 = ("70%")					
	drop73[9]	 = ("80%")					
	drop73[10]	 = ("90%")					
	drop73[11]	 = ("100%")					
	local drop74 = SETTINGS.options_data.dropdown74						
	drop74[1]	 = ("REMOVE")					
	drop74[2]	 = ("10%")					
	drop74[3]	 = ("20%")					
	drop74[4]	 = ("30%")					
	drop74[5]	 = ("40%")					
	drop74[6]	 = ("50%")					
	drop74[7]	 = ("60%")					
	drop74[8]	 = ("70%")					
	drop74[9]	 = ("80%")					
	drop74[10]	 = ("90%")					
	drop74[11]	 = ("100%")					
	local drop75 = SETTINGS.options_data.dropdown75						
	drop75[1]	 = ("REMOVE")					
	drop75[2]	 = ("10%")					
	drop75[3]	 = ("20%")					
	drop75[4]	 = ("30%")					
	drop75[5]	 = ("40%")					
	drop75[6]	 = ("50%")					
	drop75[7]	 = ("60%")					
	drop75[8]	 = ("70%")					
	drop75[9]	 = ("80%")					
	drop75[10]	 = ("90%")					
	drop75[11]	 = ("100%")					
	local drop76 = SETTINGS.options_data.dropdown76						
	drop76[1]	 = ("REMOVE")					
	drop76[2]	 = ("10%")					
	drop76[3]	 = ("20%")					
	drop76[4]	 = ("30%")					
	drop76[5]	 = ("40%")					
	drop76[6]	 = ("50%")					
	drop76[7]	 = ("60%")					
	drop76[8]	 = ("70%")					
	drop76[9]	 = ("80%")					
	drop76[10]	 = ("90%")					
	drop76[11]	 = ("100%")					
	local drop77 = SETTINGS.options_data.dropdown77						
	drop77[1]	 = ("REMOVE")					
	drop77[2]	 = ("10%")					
	drop77[3]	 = ("20%")					
	drop77[4]	 = ("30%")					
	drop77[5]	 = ("40%")					
	drop77[6]	 = ("50%")					
	drop77[7]	 = ("60%")					
	drop77[8]	 = ("70%")					
	drop77[9]	 = ("80%")					
	drop77[10]	 = ("90%")					
	drop77[11]	 = ("100%")					
	local drop78 = SETTINGS.options_data.dropdown78						
	drop78[1]	 = ("REMOVE")					
	drop78[2]	 = ("10%")					
	drop78[3]	 = ("20%")					
	drop78[4]	 = ("30%")					
	drop78[5]	 = ("40%")					
	drop78[6]	 = ("50%")					
	drop78[7]	 = ("60%")					
	drop78[8]	 = ("70%")					
	drop78[9]	 = ("80%")					
	drop78[10]	 = ("90%")					
	drop78[11]	 = ("100%")					
	local drop79 = SETTINGS.options_data.dropdown79						
	drop79[1]	 = ("REMOVE")					
	drop79[2]	 = ("10%")					
	drop79[3]	 = ("20%")					
	drop79[4]	 = ("30%")					
	drop79[5]	 = ("40%")					
	drop79[6]	 = ("50%")					
	drop79[7]	 = ("60%")					
	drop79[8]	 = ("70%")					
	drop79[9]	 = ("80%")					
	drop79[10]	 = ("90%")					
	drop79[11]	 = ("100%")					
	local drop80 = SETTINGS.options_data.dropdown80						
	drop80[1]	 = ("DO NOT OVERRIDE DISTRO")					
	drop80[2]	 = ("10%")					
	drop80[3]	 = ("20%")					
	drop80[4]	 = ("30%")					
	drop80[5]	 = ("40%")					
	drop80[6]	 = ("50%")					
	drop80[7]	 = ("60%")					
	drop80[8]	 = ("70%")					
	drop80[9]	 = ("80%")					
	drop80[10]	 = ("90%")					
	drop80[11]	 = ("100%")					
	drop80[12]	 = ("110%")					
	drop80[13]	 = ("120%")					
	drop80[14]	 = ("130%")					
	drop80[15]	 = ("140%")					
	drop80[16]	 = ("150%")					
	drop80[17]	 = ("160%")					
	drop80[18]	 = ("170%")					
	drop80[19]	 = ("180%")					
	drop80[20]	 = ("190%")					
	drop80[21]	 = ("200%")					
	local drop81 = SETTINGS.options_data.dropdown81					-- EXCLUSIONARY	
	drop81[1]	 = ("REMOVE")					
	drop81[2]	 = ("25%")					
	drop81[3]	 = ("50%")					
	drop81[4]	 = ("75%")					
	drop81[5]	 = ("ALLOW")					
	local drop82 = SETTINGS.options_data.dropdown82						
	drop82[1]	 = ("REMOVE")					
	drop82[2]	 = ("25%")					
	drop82[3]	 = ("50%")					
	drop82[4]	 = ("75%")					
	drop82[5]	 = ("ALLOW")					
	local drop83 = SETTINGS.options_data.dropdown83						
	drop83[1]	 = ("REMOVE")					
	drop83[2]	 = ("25%")					
	drop83[3]	 = ("50%")					
	drop83[4]	 = ("75%")					
	drop83[5]	 = ("ALLOW")					
	local drop84 = SETTINGS.options_data.dropdown84						
	drop84[1]	 = ("REMOVE")					
	drop84[2]	 = ("25%")					
	drop84[3]	 = ("50%")					
	drop84[4]	 = ("75%")					
	drop84[5]	 = ("ALLOW")					
	local drop85 = SETTINGS.options_data.dropdown85						
	drop85[1]	 = ("REMOVE")					
	drop85[2]	 = ("25%")					
	drop85[3]	 = ("50%")					
	drop85[4]	 = ("75%")					
	drop85[5]	 = ("ALLOW")					
	local drop86 = SETTINGS.options_data.dropdown86						
	drop86[1]	 = ("REMOVE")					
	drop86[2]	 = ("25%")					
	drop86[3]	 = ("50%")					
	drop86[4]	 = ("75%")					
	drop86[5]	 = ("ALLOW")					
	local drop87 = SETTINGS.options_data.dropdown87						
	drop87[1]	 = ("REMOVE")					
	drop87[2]	 = ("25%")					
	drop87[3]	 = ("50%")					
	drop87[4]	 = ("75%")					
	drop87[5]	 = ("ALLOW")					
	local drop88 = SETTINGS.options_data.dropdown88						
	drop88[1]	 = ("REMOVE")					
	drop88[2]	 = ("25%")					
	drop88[3]	 = ("50%")					
	drop88[4]	 = ("75%")					
	drop88[5]	 = ("ALLOW")					
	local drop89 = SETTINGS.options_data.dropdown89						
	drop89[1]	 = ("REMOVE")					
	drop89[2]	 = ("25%")					
	drop89[3]	 = ("50%")					
	drop89[4]	 = ("75%")					
	drop89[5]	 = ("ALLOW")					
	local drop90 = SETTINGS.options_data.dropdown90					-- CONTAINER ROLL MODIFIERS	
	drop90[1]	 = ("1")					
	drop90[2]	 = ("2")					
	drop90[3]	 = ("3")					
	drop90[4]	 = ("4")					
	drop90[5]	 = ("5")					
	local drop91 = SETTINGS.options_data.dropdown91						
	drop91[1]	 = ("1")					
	drop91[2]	 = ("2")					
	drop91[3]	 = ("3")					
	drop91[4]	 = ("4")					
	drop91[5]	 = ("5")					
	local drop92 = SETTINGS.options_data.dropdown92						
	drop92[1]	 = ("1")					
	drop92[2]	 = ("2")					
	drop92[3]	 = ("3")					
	drop92[4]	 = ("4")					
	drop92[5]	 = ("5")					
	local drop93 = SETTINGS.options_data.dropdown93						
	drop93[1]	 = ("1")					
	drop93[2]	 = ("2")					
	drop93[3]	 = ("3")					
	drop93[4]	 = ("4")					
	drop93[5]	 = ("5")					
	local drop94 = SETTINGS.options_data.dropdown94						
	drop94[1]	 = ("1")					
	drop94[2]	 = ("2")					
	drop94[3]	 = ("3")					
	drop94[4]	 = ("4")					
	drop94[5]	 = ("5")					
	local drop95 = SETTINGS.options_data.dropdown95						
	drop95[1]	 = ("1")					
	drop95[2]	 = ("2")					
	drop95[3]	 = ("3")					
	drop95[4]	 = ("4")					
	drop95[5]	 = ("5")					
	local drop96 = SETTINGS.options_data.dropdown96						
	drop96[1]	 = ("1")					
	drop96[2]	 = ("2")					
	drop96[3]	 = ("3")					
	drop96[4]	 = ("4")					
	drop96[5]	 = ("5")					
	local drop97 = SETTINGS.options_data.dropdown97						
	drop97[1]	 = ("1")					
	drop97[2]	 = ("2")					
	drop97[3]	 = ("3")					
	drop97[4]	 = ("4")					
	drop97[5]	 = ("5")					
	local drop98 = SETTINGS.options_data.dropdown98						
	drop98[1]	 = ("1")					
	drop98[2]	 = ("2")					
	drop98[3]	 = ("3")					
	drop98[4]	 = ("4")					
	drop98[5]	 = ("5")					
	local drop99 = SETTINGS.options_data.dropdown99						
	drop99[1]	 = ("1")					
	drop99[2]	 = ("2")					
	drop99[3]	 = ("3")					
	drop99[4]	 = ("4")					
	drop99[5]	 = ("5")					
	local drop100 = SETTINGS.options_data.dropdown100						
	drop100[1]	 = ("1")					
	drop100[2]	 = ("2")					
	drop100[3]	 = ("3")					
	drop100[4]	 = ("4")					
	drop100[5]	 = ("5")					
	local drop101 = SETTINGS.options_data.dropdown101						
	drop101[1]	 = ("1")					
	drop101[2]	 = ("2")					
	drop101[3]	 = ("3")					
	drop101[4]	 = ("4")					
	drop101[5]	 = ("5")					
	local drop102 = SETTINGS.options_data.dropdown102						
	drop102[1]	 = ("1")					
	drop102[2]	 = ("2")					
	drop102[3]	 = ("3")					
	drop102[4]	 = ("4")					
	drop102[5]	 = ("5")					
	local drop103 = SETTINGS.options_data.dropdown103						
	drop103[1]	 = ("1")					
	drop103[2]	 = ("2")					
	drop103[3]	 = ("3")					
	drop103[4]	 = ("4")					
	drop103[5]	 = ("5")					
	local drop104 = SETTINGS.options_data.dropdown104						
	drop104[1]	 = ("1")					
	drop104[2]	 = ("2")					
	drop104[3]	 = ("3")					
	drop104[4]	 = ("4")					
	drop104[5]	 = ("5")					
	local drop105 = SETTINGS.options_data.dropdown105						
	drop105[1]	 = ("1")					
	drop105[2]	 = ("2")					
	drop105[3]	 = ("3")					
	drop105[4]	 = ("4")					
	drop105[5]	 = ("5")					
	local drop106 = SETTINGS.options_data.dropdown106						
	drop106[1]	 = ("1")					
	drop106[2]	 = ("2")					
	drop106[3]	 = ("3")					
	drop106[4]	 = ("4")					
	drop106[5]	 = ("5")					
	local drop107 = SETTINGS.options_data.dropdown107						
	drop107[1]	 = ("1")					
	drop107[2]	 = ("2")					
	drop107[3]	 = ("3")					
	drop107[4]	 = ("4")					
	drop107[5]	 = ("5")					
	local drop108 = SETTINGS.options_data.dropdown108						
	drop108[1]	 = ("1")					
	drop108[2]	 = ("2")					
	drop108[3]	 = ("3")					
	drop108[4]	 = ("4")					
	drop108[5]	 = ("5")					
	local drop109 = SETTINGS.options_data.dropdown109						
	drop109[1]	 = ("1")					
	drop109[2]	 = ("2")					
	drop109[3]	 = ("3")					
	drop109[4]	 = ("4")					
	drop109[5]	 = ("5")					
	local drop110 = SETTINGS.options_data.dropdown110						
	drop110[1]	 = ("1")					
	drop110[2]	 = ("2")					
	drop110[3]	 = ("3")					
	drop110[4]	 = ("4")					
	drop110[5]	 = ("5")					
	local drop111 = SETTINGS.options_data.dropdown111						
	drop111[1]	 = ("1")					
	drop111[2]	 = ("2")					
	drop111[3]	 = ("3")					
	drop111[4]	 = ("4")					
	drop111[5]	 = ("5")					
	local drop112 = SETTINGS.options_data.dropdown112						
	drop112[1]	 = ("1")					
	drop112[2]	 = ("2")					
	drop112[3]	 = ("3")					
	drop112[4]	 = ("4")					
	drop112[5]	 = ("5")					
	local drop113 = SETTINGS.options_data.dropdown113						
	drop113[1]	 = ("1")					
	drop113[2]	 = ("2")					
	drop113[3]	 = ("3")					
	drop113[4]	 = ("4")					
	drop113[5]	 = ("5")					
	local drop114 = SETTINGS.options_data.dropdown114					-- STORE PROBABILITY TRIM	
	drop114[1]	 = ("+ 0%")					
	drop114[2]	 = ("+ 10%")					
	drop114[3]	 = ("+ 20%")					
	drop114[4]	 = ("+ 30%")					
	drop114[5]	 = ("+ 40%")					
	drop114[6]	 = ("+ 50%")					
	drop114[7]	 = ("+ 60%")					
	drop114[8]	 = ("+ 70%")					
	drop114[9]	 = ("+ 80%")					
	drop114[10]	 = ("+ 90%")					
	drop114[11]	 = ("+ 100%")					
	drop114[12]	 = ("+ 110%")					
	drop114[13]	 = ("+ 120%")					
	drop114[14]	 = ("+ 130%")					
	drop114[15]	 = ("+ 140%")					
	drop114[16]	 = ("+ 150%")					
	drop114[17]	 = ("+ 160%")					
	drop114[18]	 = ("+ 170%")					
	drop114[19]	 = ("+ 180%")					
	drop114[20]	 = ("+ 190%")					
	drop114[21]	 = ("+ 200%")					
	local drop115 = SETTINGS.options_data.dropdown115						
	drop115[1]	 = ("+ 0%")					
	drop115[2]	 = ("+ 10%")					
	drop115[3]	 = ("+ 20%")					
	drop115[4]	 = ("+ 30%")					
	drop115[5]	 = ("+ 40%")					
	drop115[6]	 = ("+ 50%")					
	drop115[7]	 = ("+ 60%")					
	drop115[8]	 = ("+ 70%")					
	drop115[9]	 = ("+ 80%")					
	drop115[10]	 = ("+ 90%")					
	drop115[11]	 = ("+ 100%")					
	drop115[12]	 = ("+ 110%")					
	drop115[13]	 = ("+ 120%")					
	drop115[14]	 = ("+ 130%")					
	drop115[15]	 = ("+ 140%")					
	drop115[16]	 = ("+ 150%")					
	drop115[17]	 = ("+ 160%")					
	drop115[18]	 = ("+ 170%")					
	drop115[19]	 = ("+ 180%")					
	drop115[20]	 = ("+ 190%")					
	drop115[21]	 = ("+ 200%")					
	local drop116 = SETTINGS.options_data.dropdown116						
	drop116[1]	 = ("+ 0%")					
	drop116[2]	 = ("+ 10%")					
	drop116[3]	 = ("+ 20%")					
	drop116[4]	 = ("+ 30%")					
	drop116[5]	 = ("+ 40%")					
	drop116[6]	 = ("+ 50%")					
	drop116[7]	 = ("+ 60%")					
	drop116[8]	 = ("+ 70%")					
	drop116[9]	 = ("+ 80%")					
	drop116[10]	 = ("+ 90%")					
	drop116[11]	 = ("+ 100%")					
	drop116[12]	 = ("+ 110%")					
	drop116[13]	 = ("+ 120%")					
	drop116[14]	 = ("+ 130%")					
	drop116[15]	 = ("+ 140%")					
	drop116[16]	 = ("+ 150%")					
	drop116[17]	 = ("+ 160%")					
	drop116[18]	 = ("+ 170%")					
	drop116[19]	 = ("+ 180%")					
	drop116[20]	 = ("+ 190%")					
	drop116[21]	 = ("+ 200%")					
	drop116[22]	 = ("+ 210%")					
	drop116[23]	 = ("+ 220%")					
	drop116[24]	 = ("+ 230%")					
	drop116[25]	 = ("+ 240%")					
	drop116[26]	 = ("+ 250%")					
	drop116[27]	 = ("+ 260%")					
	drop116[28]	 = ("+ 270%")					
	drop116[29]	 = ("+ 280%")					
	drop116[30]	 = ("+ 290%")					
	drop116[31]	 = ("+ 300%")					
	local drop117 = SETTINGS.options_data.dropdown117						
	drop117[1]	 = ("+ 0%")					
	drop117[2]	 = ("+ 10%")					
	drop117[3]	 = ("+ 20%")					
	drop117[4]	 = ("+ 30%")					
	drop117[5]	 = ("+ 40%")					
	drop117[6]	 = ("+ 50%")					
	drop117[7]	 = ("+ 60%")					
	drop117[8]	 = ("+ 70%")					
	drop117[9]	 = ("+ 80%")					
	drop117[10]	 = ("+ 90%")					
	drop117[11]	 = ("+ 100%")					
	drop117[12]	 = ("+ 110%")					
	drop117[13]	 = ("+ 120%")					
	drop117[14]	 = ("+ 130%")					
	drop117[15]	 = ("+ 140%")					
	drop117[16]	 = ("+ 150%")					
	drop117[17]	 = ("+ 160%")					
	drop117[18]	 = ("+ 170%")					
	drop117[19]	 = ("+ 180%")					
	drop117[20]	 = ("+ 190%")					
	drop117[21]	 = ("+ 200%")					
	local drop118 = SETTINGS.options_data.dropdown118						
	drop118[1]	 = ("+ 0%")					
	drop118[2]	 = ("+ 10%")					
	drop118[3]	 = ("+ 20%")					
	drop118[4]	 = ("+ 30%")					
	drop118[5]	 = ("+ 40%")					
	drop118[6]	 = ("+ 50%")					
	drop118[7]	 = ("+ 60%")					
	drop118[8]	 = ("+ 70%")					
	drop118[9]	 = ("+ 80%")					
	drop118[10]	 = ("+ 90%")					
	drop118[11]	 = ("+ 100%")					
	drop118[12]	 = ("+ 110%")					
	drop118[13]	 = ("+ 120%")					
	drop118[14]	 = ("+ 130%")					
	drop118[15]	 = ("+ 140%")					
	drop118[16]	 = ("+ 150%")					
	drop118[17]	 = ("+ 160%")					
	drop118[18]	 = ("+ 170%")					
	drop118[19]	 = ("+ 180%")					
	drop118[20]	 = ("+ 190%")					
	drop118[21]	 = ("+ 200%")					
	local drop119 = SETTINGS.options_data.dropdown119						
	drop119[1]	 = ("+ 0%")					
	drop119[2]	 = ("+ 10%")					
	drop119[3]	 = ("+ 20%")					
	drop119[4]	 = ("+ 30%")					
	drop119[5]	 = ("+ 40%")					
	drop119[6]	 = ("+ 50%")					
	drop119[7]	 = ("+ 60%")					
	drop119[8]	 = ("+ 70%")					
	drop119[9]	 = ("+ 80%")					
	drop119[10]	 = ("+ 90%")					
	drop119[11]	 = ("+ 100%")					
	drop119[12]	 = ("+ 110%")					
	drop119[13]	 = ("+ 120%")					
	drop119[14]	 = ("+ 130%")					
	drop119[15]	 = ("+ 140%")					
	drop119[16]	 = ("+ 150%")					
	drop119[17]	 = ("+ 160%")					
	drop119[18]	 = ("+ 170%")					
	drop119[19]	 = ("+ 180%")					
	drop119[20]	 = ("+ 190%")					
	drop119[21]	 = ("+ 200%")					
	local opt120 = SETTINGS.options_data.box120						
	local opt121 = SETTINGS.options_data.box121						
	local opt122 = SETTINGS.options_data.box122						
	local opt123 = SETTINGS.options_data.box123						
	local opt124 = SETTINGS.options_data.box124						
	local opt125 = SETTINGS.options_data.box125						
	local drop126 = SETTINGS.options_data.dropdown126						
	drop126[1]	 = ("United States (recommeded MIL Trim 150+)")					
	drop126[2]	 = ("Soviet Union (recommended MIL Trim 260+)")					
	drop126[3]	 = ("Czech Republic (recommended MIL Trim 280+)")					
	drop126[4]	 = ("Republic of Korea (recommended MIL Trim 180+)")					
	drop126[5]	 = ("China / Pac-Rim (recommended MIL Trim 220+)")					
	drop126[6]	 = ("European Nations (recommended MIL Trim 160+)")					
	drop126[7]	 = ("Israel (recommended MIL Trim 170+)")					
	drop126[8]	 = ("None (recommended MIL Trim 50+)")					
	drop126[9]	 = ("None (recommended MIL Trim 50+)")					
	drop126[10]	 = ("None (recommended MIL Trim 50+)")

	if isClient() then

--	opt1.sandbox_path = "worldOptions"						
--	opt2.sandbox_path = "worldOptions"						
--	drop3.sandbox_path = "worldOptions"						
--	opt4.sandbox_path = "worldOptions"						
--	opt5.sandbox_path = "worldOptions"						
	opt6.sandbox_path = "worldOptions"						
	drop7.sandbox_path = "worldOptions"						
	opt8.sandbox_path = "worldOptions"						
	drop9.sandbox_path = "worldOptions"						
	opt10.sandbox_path = "worldOptions"						
	drop11.sandbox_path = "worldOptions"						
	drop12.sandbox_path = "worldOptions"						
	drop13.sandbox_path = "worldOptions"						
	drop14.sandbox_path = "worldOptions"						
	drop15.sandbox_path = "worldOptions"						
	opt16.sandbox_path = "worldOptions"						
--	drop17.sandbox_path = "worldOptions"						
	opt18.sandbox_path = "worldOptions"						
	drop19.sandbox_path = "worldOptions"						
	drop20.sandbox_path = "worldOptions"						
	drop21.sandbox_path = "worldOptions"						
	drop22.sandbox_path = "worldOptions"						
	drop23.sandbox_path = "worldOptions"						
	drop24.sandbox_path = "worldOptions"						
	drop25.sandbox_path = "worldOptions"						
	drop26.sandbox_path = "worldOptions"						
	drop27.sandbox_path = "worldOptions"						
	drop28.sandbox_path = "worldOptions"						
	drop29.sandbox_path = "worldOptions"						
	drop30.sandbox_path = "worldOptions"						
	drop31.sandbox_path = "worldOptions"						
	drop32.sandbox_path = "worldOptions"						
	drop33.sandbox_path = "worldOptions"						
	drop34.sandbox_path = "worldOptions"						
	drop35.sandbox_path = "worldOptions"						
	drop36.sandbox_path = "worldOptions"						
	drop37.sandbox_path = "worldOptions"						
	drop38.sandbox_path = "worldOptions"						
	drop39.sandbox_path = "worldOptions"						
	drop40.sandbox_path = "worldOptions"						
	drop41.sandbox_path = "worldOptions"						
	drop42.sandbox_path = "worldOptions"						
	drop43.sandbox_path = "worldOptions"						
	drop44.sandbox_path = "worldOptions"						
	drop45.sandbox_path = "worldOptions"						
	drop46.sandbox_path = "worldOptions"						
	drop47.sandbox_path = "worldOptions"						
	drop48.sandbox_path = "worldOptions"						
	drop49.sandbox_path = "worldOptions"						
	drop50.sandbox_path = "worldOptions"						
	drop51.sandbox_path = "worldOptions"						
	drop52.sandbox_path = "worldOptions"						
	drop53.sandbox_path = "worldOptions"						
	drop54.sandbox_path = "worldOptions"						
	drop55.sandbox_path = "worldOptions"						
	drop56.sandbox_path = "worldOptions"						
	drop57.sandbox_path = "worldOptions"						
	drop58.sandbox_path = "worldOptions"						
	drop59.sandbox_path = "worldOptions"						
	drop60.sandbox_path = "worldOptions"						
	drop61.sandbox_path = "worldOptions"						
	drop62.sandbox_path = "worldOptions"						
	drop63.sandbox_path = "worldOptions"						
	drop64.sandbox_path = "worldOptions"						
	drop65.sandbox_path = "worldOptions"						
	drop66.sandbox_path = "worldOptions"						
	drop67.sandbox_path = "worldOptions"						
	drop68.sandbox_path = "worldOptions"						
	drop69.sandbox_path = "worldOptions"						
	drop70.sandbox_path = "worldOptions"						
	drop71.sandbox_path = "worldOptions"						
	drop72.sandbox_path = "worldOptions"						
	drop73.sandbox_path = "worldOptions"						
	drop74.sandbox_path = "worldOptions"						
	drop75.sandbox_path = "worldOptions"						
	drop76.sandbox_path = "worldOptions"						
	drop77.sandbox_path = "worldOptions"						
	drop78.sandbox_path = "worldOptions"						
	drop79.sandbox_path = "worldOptions"						
	drop80.sandbox_path = "worldOptions"						
	drop81.sandbox_path = "worldOptions"						
	drop82.sandbox_path = "worldOptions"						
	drop83.sandbox_path = "worldOptions"						
	drop84.sandbox_path = "worldOptions"						
	drop85.sandbox_path = "worldOptions"						
	drop86.sandbox_path = "worldOptions"						
	drop87.sandbox_path = "worldOptions"						
	drop88.sandbox_path = "worldOptions"						
	drop89.sandbox_path = "worldOptions"						
	drop90.sandbox_path = "worldOptions"						
	drop91.sandbox_path = "worldOptions"						
	drop92.sandbox_path = "worldOptions"						
	drop93.sandbox_path = "worldOptions"						
	drop94.sandbox_path = "worldOptions"						
	drop95.sandbox_path = "worldOptions"						
	drop96.sandbox_path = "worldOptions"						
	drop97.sandbox_path = "worldOptions"						
	drop98.sandbox_path = "worldOptions"						
	drop99.sandbox_path = "worldOptions"						
	drop100.sandbox_path = "worldOptions"						
	drop101.sandbox_path = "worldOptions"						
	drop102.sandbox_path = "worldOptions"						
	drop103.sandbox_path = "worldOptions"						
	drop104.sandbox_path = "worldOptions"						
	drop105.sandbox_path = "worldOptions"						
	drop106.sandbox_path = "worldOptions"						
	drop107.sandbox_path = "worldOptions"						
	drop108.sandbox_path = "worldOptions"						
	drop109.sandbox_path = "worldOptions"						
	drop110.sandbox_path = "worldOptions"						
	drop111.sandbox_path = "worldOptions"						
	drop112.sandbox_path = "worldOptions"						
	drop113.sandbox_path = "worldOptions"						
	drop114.sandbox_path = "worldOptions"						
	drop115.sandbox_path = "worldOptions"						
	drop116.sandbox_path = "worldOptions"						
	drop117.sandbox_path = "worldOptions"						
	drop118.sandbox_path = "worldOptions"						
	drop119.sandbox_path = "worldOptions"						
	opt120.sandbox_path = "worldOptions"						
	opt121.sandbox_path = "worldOptions"						
	opt122.sandbox_path = "worldOptions"						
	opt123.sandbox_path = "worldOptions"						
	opt124.sandbox_path = "worldOptions"						
	opt125.sandbox_path = "worldOptions"						
	drop126.sandbox_path = "worldOptions"						
	end
							
							
	function opt1:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt2:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop3:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt4:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt5:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt6:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop7:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt8:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop9:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt10:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop11:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop12:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop13:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop14:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop15:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt16:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop17:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt18:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop19:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop20:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop21:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop22:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop23:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop24:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop25:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop26:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop27:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop28:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop29:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop30:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop31:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop32:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop33:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop34:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop35:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop36:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop37:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop38:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop39:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop40:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop41:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop42:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop43:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop44:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop45:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop46:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop47:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop48:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop49:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop50:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop51OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop52OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop53OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop54OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop55:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop56:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop57:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop58:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop59:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop60:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop61:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop62:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop63:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop64:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop65:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop66:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop67:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop68:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop69:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop70:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop71:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop72:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop73:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop74:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop75:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop76:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop77:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop78:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop79:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop80:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop81:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop82:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop83:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop84:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop85:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop86:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop87:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop88:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop89:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop90:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop91:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop92:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop93:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop94:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop95:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop96:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop97:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop98:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop99:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop100:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop101:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop102:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop103:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop104:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop105:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop106:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop107:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop108:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop109:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop110:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop111:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop112:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop113:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop114:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop115:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop116:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop117:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop118:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop119:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt120:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt121:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt122:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt123:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt124:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function opt125:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end						
	function drop126:OnApplyInGame(val)						
		print('Option is updated!', self.id, val)					
	end
							
	GUNFIGHTER = {} 				-- global variable (pick another name!)		
	GUNFIGHTER.OPTIONS = SETTINGS

	if	isClient() then
		print("SERVER_SETTINGS - IS CLIENT FORCE SAVE INI")
		ModOptions:saveIniData(SETTINGS)
	--	print("SERVER_SETTINGS - IS CLIENT FORCE LOAD INI")
	--	ModOptions:loadIniData(SETTINGS)
	else	print("SERVER_SETTINGS - IS HOST NO SAVE INI")
	end

end