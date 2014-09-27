require "defines"

gt = game.gettext
print = function(text) game.player.print(text) end

remote.addinterface("cheater", { show = function()
		local cheatUIFrame = game.player.gui.center.add{type = "frame", name = "cheatUIFrame",caption = gt("cheatUIFrame"), direction = "vertical"}
		cheatUIFrame.add{type = "flow", name = "cheatUIFlow", direction = "horizontal"}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_playercheats", caption = gt("btn_playercheats")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_worldcheats", caption = gt("btn_worldcheats")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_Giveitems", caption = gt("btn_Giveitems")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_cheatUIclose", caption = gt("close")}
end
})

function showCheatUI()
		local cheatUIFrame = game.player.gui.center.add{type = "frame",name = "cheatUIFrame",caption = gt("cheatUIFrame"),direction = "vertical"}
		cheatUIFrame.add{type = "flow", name = "cheatUIFlow", direction = "horizontal"}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_playercheats", caption = gt("btn_playercheats")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_worldcheats", caption = gt("btn_worldcheats")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_Giveitems", caption = gt("btn_Giveitems")}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_cheatUIclose", caption = gt("close")}
end

function showPlayerMenu()
	local PlayerMenu = game.player.gui.center.add{type = "frame", name = "PlayerMenuFrame", caption = gt("PlayerMenuFrame"), direction = "vertical" }
	PlayerMenu.add{ type = "flow", name = "PlayerMenuFlow1", direction = "horizontal"}
	
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_miningspeed", caption = gt("btn_miningspeed")}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_craftingspeed", caption = gt("btn_craftingspeed")}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_playermenuclose", caption = gt("close")}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_playermenuback", caption = gt("back")}
end

function showPlayerMiningSpeed()
    local actmisp = game.player.force.manualminingspeedmodifier
	if actmisp < 1 then actmisp = 1 end
	local miningSpeed = game.player.gui.center.add{type = "frame", name = "miningspeedframe", caption = gt("miningspeedframe").." "..actmisp, direction = "vertical"}
	miningSpeed.add{type = "flow", name = "miningspeedflow", direction = "horizontal"}
	local msf = miningSpeed.miningspeedflow
	
	msf.add{type="button", name="btn_misp1",caption=gt("normal")}
	msf.add{type="button", name="btn_misp2",caption=gt("double")}
	msf.add{type="button", name="btn_misp3",caption=gt("threefold")}
	msf.add{type="button", name="btn_misp4",caption=gt("fourfold")}
	msf.add{type="button", name="btn_misp5",caption=gt("fivefold")}
	msf.add{type="button", name="btn_misp10",caption=gt("tenfold")}
	msf.add{type="button", name="btn_misp20",caption=gt("twentyfold")}
	msf.add{type="button", name="btn_misp100",caption=gt("hundredfold")}
	msf.add{type="button", name="btn_misp500",caption=gt("fivehundredfold")}
		
end

function showPlayerCraftingSpeed()
	local actgasp = game.player.force.manualcraftingspeedmodifier
	local craftingSpeed = game.player.gui.center.add{type = "frame", name = "craftingspeedframe", caption = gt("craftingspeedframe").." "..actgasp, direction = "vertical"}
	craftingSpeed.add{type = "flow", name = "craftingspeedflow", direction = "horizontal"}
	local csf = craftingSpeed.craftingspeedflow
	
	csf.add{type="button", name="btn_crasp1",caption=gt("normal")}
	csf.add{type="button", name="btn_crasp2",caption=gt("double")}
	csf.add{type="button", name="btn_crasp3",caption=gt("threefold")}
	csf.add{type="button", name="btn_crasp4",caption=gt("fourfold")}
	csf.add{type="button", name="btn_crasp5",caption=gt("fivefold")}
	csf.add{type="button", name="btn_crasp10",caption=gt("tenfold")}
	csf.add{type="button", name="btn_crasp20",caption=gt("twentyfold")}
	csf.add{type="button", name="btn_crasp100",caption=gt("hundredfold")}	
end

function showWorldMenu()
	local worldcheats = game.player.gui.center.add{type = "frame", name = "worldcheatsframe", caption = gt("worldcheatsframe"), direction = "vertical"}
	local wc = worldcheats
	wc.add{type = "flow", name = "worldcheatsspeednegative", direction = "horizontal", caption=gt("worldcheatsspeedneg")}
	wc.add{type = "flow", name = "worldcheatsspeedpositive", direction = "horizontal", caption=gt("worldcheatsspeedpos")}
	wc.add{type = "flow", name = "worldcheatsalwaysday", direction = "horizontal", caption=gt("worldcheatsalwaysday")}
	wc.add{type = "flow", name = "worldcheatspeacefulmode", direction = "horizontal", caption=gt("worldcheatspeacefulmode")}
	wc.add{type = "flow", name = "worldcheatsflowbackclose", direction = "horizontal"}
	wcsn = worldcheats.worldcheatsspeednegative
	wcsp = worldcheats.worldcheatsspeedpositive
	
	wcsn.add{type="label", name="lbl_worldcheat_speed_neg",caption=gt("lbl_worldcheat_speed_neg")}
	for i = 1, 9, 1 do
	    wcsn.add{type="button", name="btn_worldcheat_speed_0"..i,caption=gt("btn_worldcheat_speed_0"..i)}
	end
	wcsn.add{type="button", name="btn_worldcheat_speed_10",caption=gt("btn_worldcheat_speed_10")}
	
	wcsp.add{type="label", name="lbl_worldcheat_speed_pos",caption=gt("lbl_worldcheat_speed_pos")}
	for i = 1.5, 9.5, 0.5 do
	    wcsp.add{type="button", name="btn_worldcheat_speed_"..i,caption=gt("btn_worldcheat_speed_"..i)}
    end
	wcsp.add{type="button", name="btn_worldcheat_speed_100",caption=gt("btn_worldcheat_speed_100")}

	wc.worldcheatsalwaysday.add{type="label", name="lbl_worldcheat_alwaysday",caption=gt("lbl_worldcheat_alwaysday")}
	wc.worldcheatsalwaysday.add{type="button", name="btn_worldcheat_alwaysdayYes",caption=gt("btn_worldcheat_alwaysdayYes")}
	wc.worldcheatsalwaysday.add{type="button", name="btn_worldcheat_alwaysdayNo",caption=gt("btn_worldcheat_alwaysdayNo")}
	
	wc.worldcheatspeacefulmode.add{type="label", name="lbl_worldcheat_peacefulmode",caption=gt("lbl_worldcheat_peacefulmode")}
	wc.worldcheatspeacefulmode.add{type="button", name="btn_worldcheat_peacefulmodeYes",caption=gt("btn_worldcheat_peacefulmodeYes")}
	wc.worldcheatspeacefulmode.add{type="button", name="btn_worldcheat_peacefulmodeNo",caption=gt("btn_worldcheat_peacefulmodeNo")}
	
	wc.worldcheatsflowbackclose.add{type="button", name="btn_worldcheat_back",caption=gt("back")}
	wc.worldcheatsflowbackclose.add{type="button", name="btn_worldcheat_close",caption=gt("close")}
	
end

function showItemsPage1()
	local ItemsmenuP1 = game.player.gui.center.add{type="frame",name="itemframeP1",caption=gt("itemframeP1"), direction="vertical"}
	ItemsmenuP1.add{type="flow", name="row0",direction="horizontal"}
	ItemsmenuP1.add{type="flow", name="row1",direction="horizontal"}
	ItemsmenuP1.add{type="flow", name="row2",direction="horizontal"}
	local r0 = ItemsmenuP1.row0
	local r1 = ItemsmenuP1.row1
	local r2 = ItemsmenuP1.row2
	
	r0.add{type="button",name="btn_item_rawwood",caption=gt("btn_item_rawwood")}
	r0.add{type="button",name="btn_item_coal",caption=gt("btn_item_coal")}
	r0.add{type="button",name="btn_item_stone",caption=gt("btn_item_stone")}
	r0.add{type="button",name="btn_item_copperore",caption=gt("btn_item_copperore")}
	r0.add{type="button",name="btn_item_ironore",caption=gt("btn_item_ironore")}
	
	r1.add{type="button",name="btn_item_wood",caption=gt("btn_item_wood")}
	r1.add{type="button",name="btn_item_copperplate",caption=gt("btn_item_copperplate")}
	r1.add{type="button",name="btn_item_ironplate",caption=gt("btn_item_ironplate")}
	r1.add{type="button",name="btn_item_stonebrick",caption=gt("btn_item_stonebrick")}
	
	r2.add{type="button",name="btn_itemp1_back",caption=gt("back")}
	r2.add{type="button",name="btn_itemp1_close",caption=gt("close")}
	
end

--helper functions
function closeCheatGui() game.player.gui.center.cheatUIFrame.destroy() end
function closePlayerGui() game.player.gui.center.PlayerMenuFrame.destroy() end
function closeMiningSpeed() game.player.gui.center.miningspeedframe.destroy() end
function closeCraftingSpeed() game.player.gui.center.craftingspeedframe.destroy() end
function closeWorldMenu() game.player.gui.center.worldcheatsframe.destroy() end
function closeItemsPage1() game.player.gui.center.itemframeP1.destroy() end

function getitem(item, cnt)	game.player.insert{name=item,count=cnt} end

game.onevent(
	defines.events.onguiclick, function(event)
		if event.element.name == "btn_cheatUIclose" then
			closeCheatGui()
		elseif event.element.name == "btn_testframe" then
			showTest()

-- world menu things
		elseif event.element.name == "btn_worldcheat_back" then
			closeWorldMenu()
			showCheatUI()
		elseif event.element.name == "btn_worldcheat_close" then
			closeWorldMenu()
		elseif event.element.name == "btn_worldcheats" then
			closeCheatGui()
			showWorldMenu()
		elseif event.element.name == "btn_worldcheat_speed_01" then 
			game.speed = 0.1
			print(gt("gamespeed01"))
		elseif event.element.name == "btn_worldcheat_speed_02" then 
			game.speed = 0.2
			print(gt("gamespeed02"))
		elseif event.element.name == "btn_worldcheat_speed_03" then 
			game.speed = 0.3
			print(gt("gamespeed03"))
		elseif event.element.name == "btn_worldcheat_speed_04" then 
			game.speed = 0.4
			print(gt("gamespeed04"))
		elseif event.element.name == "btn_worldcheat_speed_05" then 
			game.speed = 0.5
			print(gt("gamespeed05"))
		elseif event.element.name == "btn_worldcheat_speed_06" then 
			game.speed = 0.6
			print(gt("gamespeed06"))
		elseif event.element.name == "btn_worldcheat_speed_07" then 
			game.speed = 0.7
			print(gt("gamespeed07"))
		elseif event.element.name == "btn_worldcheat_speed_08" then 
			game.speed = 0.8
			print(gt("gamespeed08"))
		elseif event.element.name == "btn_worldcheat_speed_09" then 
			game.speed = 0.9
			print(gt("gamespeed09"))
		elseif event.element.name == "btn_worldcheat_speed_10" then 
			game.speed = 1
			print(gt("gamespeed10"))
		elseif event.element.name == "btn_worldcheat_speed_1.5" then 
			game.speed = 1.5
			print(gt("gamespeed15"))
		elseif event.element.name == "btn_worldcheat_speed_2" then 
			game.speed = 2
			print(gt("gamespeed20"))
		elseif event.element.name == "btn_worldcheat_speed_2.5" then 
			game.speed = 2.5
			print(gt("gamespeed25"))
		elseif event.element.name == "btn_worldcheat_speed_3" then 
			game.speed = 3
			print(gt("gamespeed30"))
		elseif event.element.name == "btn_worldcheat_speed_3.5" then 
			game.speed = 3.5
			print(gt("gamespeed35"))
		elseif event.element.name == "btn_worldcheat_speed_4" then 
			game.speed = 4
			print(gt("gamespeed40"))
		elseif event.element.name == "btn_worldcheat_speed_4.5" then 
			game.speed = 4.5
			print(gt("gamespeed45"))
		elseif event.element.name == "btn_worldcheat_speed_5" then 
			game.speed = 5
			print(gt("gamespeed50"))
		elseif event.element.name == "btn_worldcheat_speed_5.5" then 
			game.speed = 5.5
			print(gt("gamespeed55"))
		elseif event.element.name == "btn_worldcheat_speed_6" then 
			game.speed = 6
			print(gt("gamespeed60"))
		elseif event.element.name == "btn_worldcheat_speed_6.5" then 
			game.speed = 6.5
			print(gt("gamespeed65"))
		elseif event.element.name == "btn_worldcheat_speed_7" then 
			game.speed = 7
			print(gt("gamespeed70"))
		elseif event.element.name == "btn_worldcheat_speed_7.5" then 
			game.speed = 7.5
			print(gt("gamespeed75"))
		elseif event.element.name == "btn_worldcheat_speed_8" then 
			game.speed = 8
			print(gt("gamespeed80"))
		elseif event.element.name == "btn_worldcheat_speed_8.5" then 
			game.speed = 8.5
			print(gt("gamespeed85"))
		elseif event.element.name == "btn_worldcheat_speed_9" then 
			game.speed = 9
			print(gt("gamespeed90"))
		elseif event.element.name == "btn_worldcheat_speed_9.5" then 
			game.speed = 9.5
			print(gt("gamespeed95"))
		elseif event.element.name == "btn_worldcheat_speed_100" then 
			game.speed = 10
			print(gt("gamespeed100"))			
-- player menu things
		elseif event.element.name == "btn_playermenuclose" then
			closePlayerGui()
		elseif event.element.name == "btn_playermenuback" then
			closePlayerGui()
			showCheatUI()
		elseif event.element.name == "btn_playercheats" then
			closeCheatGui()
			showPlayerMenu()
		elseif event.element.name == "btn_miningspeed" then
			closePlayerGui()
			showPlayerMiningSpeed()
		elseif event.element.name == "btn_craftingspeed" then
			closePlayerGui()
			showPlayerCraftingSpeed()
		elseif event.element.name == "btn_crasp1" then
			game.player.force.manualcraftingspeedmodifier=1
			print(gt("mancraftspeednormal"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp2" then
			game.player.force.manualcraftingspeedmodifier=2
			print(gt("mancraftspeeddouble"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp3" then
			game.player.force.manualcraftingspeedmodifier=3
			print(gt("mancraftspeedthreefold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp4" then
			game.player.force.manualcraftingspeedmodifier=4
			print(gt("mancraftspeedfourfold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp5" then
			game.player.force.manualcraftingspeedmodifier=5
			print(gt("mancraftspeedfivefold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp10" then
			game.player.force.manualcraftingspeedmodifier=10
			print(gt("mancraftspeedtenfold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp20" then
			game.player.force.manualcraftingspeedmodifier=20
			print(gt("mancraftspeedtwentyfold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_crasp100" then
			game.player.force.manualcraftingspeedmodifier=100
			print(gt("mancraftspeedhundredfold"))
			closeCraftingSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp1" then
			game.player.force.manualminingspeedmodifier=1
			print(gt("miningspeednormal"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp2" then
			game.player.force.manualminingspeedmodifier=2
			print(gt("miningspeeddouble"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp3" then
			game.player.force.manualminingspeedmodifier=3
			print(gt("miningspeedthreefold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp4" then
			game.player.force.manualminingspeedmodifier=4
			print(gt("miningspeedfourfold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp5" then
			game.player.force.manualminingspeedmodifier=5
			print(gt("miningspeedfivefold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp10" then
			game.player.force.manualminingspeedmodifier=10
			print(gt("miningspeedtenfold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp20" then
			game.player.force.manualminingspeedmodifier=20
			print(gt("miningspeedtwentyfold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp100" then
			game.player.force.manualminingspeedmodifier=100
			print(gt("miningspeedhundredfold"))
			closeMiningSpeed()
			showPlayerMenu()
		elseif event.element.name == "btn_misp500" then
			game.player.force.manualminingspeedmodifier=500
			print(gt("miningspeedfivehundredfold"))
			closeMiningSpeed()
			showPlayerMenu()
-- Item pages
		elseif event.element.name == "btn_itemp1_close" then
			closeItemsPage1()
		elseif event.element.name == "btn_Giveitems" then
			closeCheatGui()
			showItemsPage1()
		elseif event.element.name == "btn_itemp1_back" then
			closeItemsPage1()
			showCheatUI()
		elseif event.element.name == "btn_item_rawwood" then
			getitem("raw-wood",50)
		elseif event.element.name == "btn_item_coal" then
			getitem("coal",50)
		elseif event.element.name == "btn_item_stone" then
			getitem("stone",50)
		elseif event.element.name == "btn_item_copperore" then
			getitem("copper-ore",50)
		elseif event.element.name == "btn_item_ironore" then
			getitem("iron-ore",50)
		elseif event.element.name == "btn_item_wood" then
			getitem("wood",50)
		elseif event.element.name == "btn_item_copperplate" then
			getitem("copper-plate",50)
		elseif event.element.name == "btn_item_ironplate" then
			getitem("iron-plate",50)
		elseif event.element.name == "btn_item_stonebrick" then
			getitem("stone-brick",50)
		end
	end)
