require "defines"

items = game.itemprototypes

remote.addinterface("cheater", {
  show = function(nickname)
    if #game.players == 1 then
      showCheatUI(1)
      return
    end
    if nickname and type(nickname) == "string" then
      local index = indexFromNickname(nickname)
      if not index then
        printToAll({"nameErrorWithName", nickname})
        return
      end
      showCheatUI(index)
    else
      -- error
        printToAll({"nameError"})
    end 
  end
})

function printToAll(msg)
  for _, player in ipairs(game.players) do
    player.print(msg)
  end
end

function indexFromNickname(name)
  for index, player in ipairs(game.players) do
    if player.name == name then return index end
  end
  return nil
end

function showCheatUI(playerindex)
  if not game.players[playerindex].gui.center.cheatUIFrame then
		local cheatUIFrame = game.players[playerindex].gui.center.add{type = "frame", name = "cheatUIFrame", caption = {"cheatUIFrame"}, direction = "vertical"}
		cheatUIFrame.add{type = "flow", name = "cheatUIFlow", direction = "horizontal"}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_playercheats", caption = {"btn_playercheats"}}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_worldcheats", caption = {"btn_worldcheats"}}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_Giveitems", caption = {"btn_Giveitems"}}
		cheatUIFrame.cheatUIFlow.add{type = "button", name = "btn_cheatUIclose", caption = {"close"}}
  end
end

function showPlayerMenu(playerindex)
	local PlayerMenu = game.players[playerindex].gui.center.add{type = "frame", name = "PlayerMenuFrame", caption = {"PlayerMenuFrame"}, direction = "vertical" }
	PlayerMenu.add{ type = "flow", name = "PlayerMenuFlow1", direction = "horizontal"}
	
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_miningspeed", caption = {"btn_miningspeed"}}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_craftingspeed", caption = {"btn_craftingspeed"}}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_playermenuclose", caption = {"close"}}
	PlayerMenu.PlayerMenuFlow1.add{type = "button", name = "btn_playermenuback", caption = {"back"}}
end

function showPlayerMiningSpeed(playerindex)
  local player = game.players[playerindex]
  local actmisp = player.force.manualminingspeedmodifier
	if actmisp < 1 then actmisp = 1 end
	local miningSpeed = player.gui.center.add{type = "frame", name = "miningspeedframe", caption = {"miningspeedframe", " ", actmisp}, direction = "vertical"}
	miningSpeed.add{type = "flow", name = "miningspeedflow", direction = "horizontal"}
	local msf = miningSpeed.miningspeedflow
	
	msf.add{type="button", name="btn_misp1", caption={"foldx", 1}}
	msf.add{type="button", name="btn_misp2", caption={"foldx", 2}}
	msf.add{type="button", name="btn_misp3", caption={"foldx", 3}}
	msf.add{type="button", name="btn_misp4", caption={"foldx", 4}}
	msf.add{type="button", name="btn_misp5", caption={"foldx", 5}}
	msf.add{type="button", name="btn_misp10", caption={"foldx", 10}}
	msf.add{type="button", name="btn_misp20", caption={"foldx", 20}}
	msf.add{type="button", name="btn_misp100", caption={"foldx", 100}}
	msf.add{type="button", name="btn_misp500", caption={"foldx", 500}}
end

function showPlayerCraftingSpeed(playerindex)
  local player = game.players[playerindex]
	local actgasp = player.force.manualcraftingspeedmodifier
	local craftingSpeed = player.gui.center.add{type = "frame", name = "craftingspeedframe", caption = {"craftingspeedframe", " ", actgasp}, direction = "vertical"}
	craftingSpeed.add{type = "flow", name = "craftingspeedflow", direction = "horizontal"}
	local csf = craftingSpeed.craftingspeedflow
	
	csf.add{type="button", name="btn_crasp1", caption={"foldx", 1}}
	csf.add{type="button", name="btn_crasp2", caption={"foldx", 2}}
	csf.add{type="button", name="btn_crasp3", caption={"foldx", 3}}
	csf.add{type="button", name="btn_crasp4", caption={"foldx", 4}}
	csf.add{type="button", name="btn_crasp5", caption={"foldx", 5}}
	csf.add{type="button", name="btn_crasp10", caption={"foldx", 10}} 
	csf.add{type="button", name="btn_crasp20", caption={"foldx", 20}} 
	csf.add{type="button", name="btn_crasp100", caption={"foldx", 100}}
end
  
function showWorldMenu(playerindex)
	local wc = game.players[playerindex].gui.center.add{type = "frame", name = "worldcheatsframe", caption = {"worldcheatsframe"}, direction = "vertical"}
	wc.add{type = "flow", name = "worldcheatsspeednegative", direction = "horizontal", caption={"worldcheatsspeedneg"}}
	wc.add{type = "flow", name = "worldcheatsspeedpositive", direction = "horizontal", caption={"worldcheatsspeedpos"}}
	wc.add{type = "flow", name = "worldcheatsalwaysday", direction = "horizontal", caption={"worldcheatsalwaysday"}}
	wc.add{type = "flow", name = "worldcheatspeacefulmode", direction = "horizontal", caption={"worldcheatspeacefulmode"}}
	wc.add{type = "flow", name = "worldcheatsflowbackclose", direction = "horizontal"}
	wcsn = wc.worldcheatsspeednegative
	wcsp = wc.worldcheatsspeedpositive
	
	wcsn.add{type="label", name="lbl_worldcheat_speed_neg", caption={"lbl_worldcheat_speed_neg"}}
	for i = 0.1, 1, 0.1 do
    wcsn.add{type="button", name="btn_worldcheat_speed_"..i, caption={"btn_worldcheat_speed", i}}
	end
	
	wcsp.add{type="label", name="lbl_worldcheat_speed_pos", caption={"lbl_worldcheat_speed_pos"}}
	for i = 1.5, 10, 0.5 do
    wcsp.add{type="button", name="btn_worldcheat_speed_"..i, caption={"btn_worldcheat_speed", i}}
  end

	wc.worldcheatsalwaysday.add{type="label", name="lbl_worldcheat_alwaysday", caption={"lbl_worldcheat_alwaysday"}}
	wc.worldcheatsalwaysday.add{type="button", name="btn_worldcheat_alwaysdayYes", caption={"btn_worldcheat_alwaysdayYes"}}
	wc.worldcheatsalwaysday.add{type="button", name="btn_worldcheat_alwaysdayNo", caption={"btn_worldcheat_alwaysdayNo"}}
	
	wc.worldcheatspeacefulmode.add{type="label", name="lbl_worldcheat_peacefulmode", caption={"lbl_worldcheat_peacefulmode"}}
	wc.worldcheatspeacefulmode.add{type="button", name="btn_worldcheat_peacefulmodeYes", caption={"btn_worldcheat_peacefulmodeYes"}}
	wc.worldcheatspeacefulmode.add{type="button", name="btn_worldcheat_peacefulmodeNo", caption={"btn_worldcheat_peacefulmodeNo"}}
	
	wc.worldcheatsflowbackclose.add{type="button", name="btn_worldcheat_back", caption={"back"}}
	wc.worldcheatsflowbackclose.add{type="button", name="btn_worldcheat_close", caption={"close"}}
	
end

function showItemsPage1(playerindex)
	local ItemsmenuP1 = game.players[playerindex].gui.center.add{type="frame", name="itemframeP1", caption={"itemframeP1"}, direction="vertical"}
	ItemsmenuP1.add{type="flow", name="row0", direction="horizontal"}
	ItemsmenuP1.add{type="flow", name="row1", direction="horizontal"}
	ItemsmenuP1.add{type="flow", name="row2", direction="horizontal"}
	local r0 = ItemsmenuP1.row0
	local r1 = ItemsmenuP1.row1
	local r2 = ItemsmenuP1.row2
	
	r0.add{type="button", name="raw-wood", caption=game.getlocaliseditemname("raw-wood")}
	r0.add{type="button", name="coal", caption=game.getlocaliseditemname("coal")}
	r0.add{type="button", name="stone", caption=game.getlocaliseditemname("stone")}
	r0.add{type="button", name="copper-ore", caption=game.getlocaliseditemname("copper-ore")}
	r0.add{type="button", name="iron-ore", caption=game.getlocaliseditemname("iron-ore")}
	
	r1.add{type="button", name="wood", caption=game.getlocaliseditemname("wood")}
	r1.add{type="button", name="copper-plate", caption=game.getlocaliseditemname("copper-plate")}
	r1.add{type="button", name="iron-plate", caption=game.getlocaliseditemname("iron-plate")}
	r1.add{type="button", name="stone-brick", caption=game.getlocaliseditemname("stone-brick")}
	
	r2.add{type="button", name="btn_itemp1_back", caption={"back"}}
	r2.add{type="button", name="btn_itemp1_close", caption={"close"}}
	
end

--helper functions
function closeCheatGui(playerindex)
  game.players[playerindex].gui.center.cheatUIFrame.destroy()
end

function closePlayerGui(playerindex)
  game.players[playerindex].gui.center.PlayerMenuFrame.destroy()
end

function closeMiningSpeed(playerindex)
  for _, player in ipairs(game.players) do
    game.player.gui.center.miningspeedframe.destroy()
  end
end

function closeCraftingSpeed(playerindex)
  game.players[playerindex].gui.center.craftingspeedframe.destroy()
end

function closeWorldMenu(playerindex)
  game.players[playerindex].gui.center.worldcheatsframe.destroy()
end

function closeItemsPage1(playerindex)
  game.players[playerindex].gui.center.itemframeP1.destroy()
end

game.onevent(defines.events.onguiclick, function(event)
  if event.element.name == "btn_cheatUIclose" then
    closeCheatGui(event.playerindex)
-- world menu things
  elseif event.element.name == "btn_worldcheat_back" then
    closeWorldMenu(event.playerindex)
    showCheatUI(event.playerindex)
  elseif event.element.name == "btn_worldcheat_close" then
    closeWorldMenu(event.playerindex)
  elseif event.element.name == "btn_worldcheats" then
    closeCheatGui(event.playerindex)
    showWorldMenu(event.playerindex)
  elseif event.element.name:find("btn_worldcheat_speed_") then 
    local speed = tonumber(event.element.name:match("btn_worldcheat_speed_([%d.]+)"))
    game.speed = speed
    print({"gamespeed", speed})
-- player menu things
  elseif event.element.name == "btn_playermenuclose" then
    closePlayerGui(event.playerindex)
  elseif event.element.name == "btn_playermenuback" then
    closePlayerGui(event.playerindex)
    showCheatUI(event.playerindex)
  elseif event.element.name == "btn_playercheats" then
    closeCheatGui(event.playerindex)
    showPlayerMenu(event.playerindex)
  elseif event.element.name == "btn_miningspeed" then
    closePlayerGui(event.playerindex)
    showPlayerMiningSpeed(event.playerindex)
  elseif event.element.name == "btn_craftingspeed" then
    closePlayerGui(event.playerindex)
    showPlayerCraftingSpeed(event.playerindex)
  elseif event.element.name:find("btn_crasp") then
    local player = game.players[event.playerindex]
    local speed = tonumber(event.element.name:match("btn_crasp([%d.]+)"))
    player.force.manualcraftingspeedmodifier = speed
    player.print({"mancraftspeed", {"foldx", speed}})
    closeCraftingSpeed(event.playerindex)
    showPlayerMenu(event.playerindex)
  elseif event.element.name:find("btn_misp") then
    local player = game.players[event.playerindex]
    local speed = tonumber(event.element.name:match("btn_misp([%d.]+)"))
    player.force.manualminingspeedmodifier = speed
    player.print({"miningspeed", {"foldx", speed}})
    closeMiningSpeed(event.playerindex)
    showPlayerMenu(event.playerindex)
-- Item pages
  elseif event.element.name == "btn_itemp1_close" then
    closeItemsPage1(event.playerindex)
  elseif event.element.name == "btn_Giveitems" then
    closeCheatGui(event.playerindex)
    showItemsPage1(event.playerindex)
  elseif event.element.name == "btn_itemp1_back" then
    closeItemsPage1(event.playerindex)
    showCheatUI(event.playerindex)
  elseif event.element.name:find("btn_worldcheat_alwaysday") then
    game.alwaysday = event.element.name:find("Yes") or false
  elseif event.element.name:find("btn_worldcheat_peacefulmode") then
    game.peacefulmode = event.element.name:find("Yes") or false
  elseif items[event.element.name] then
    game.players[event.playerindex].insert{name=event.element.name, count=50}
  end
end)
