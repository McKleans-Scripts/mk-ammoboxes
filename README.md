# MK-AmmoBoxes by [McKleans-Scripts](https://mckleans-scripts.tebex.io/) | [Discord](https://discord.gg/DEWp9TP7p6) | [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J1LMXYK)

This script allows you to sell bulk ammo. Why not sell a box a box of ammo and have your players unpack their ammo.


## Updated ##
v1.0 - Created by McKleans-Scripts
 - Created May 2023

v1.1 - oosayeroo update
 - Config options
   - You can now add your ammo to the config
 - Cleaned up Client
 - Cleaned up Server
 - Thanks to Oosayeroo for this update


## Dependencies  ##
- [QBCore Framework](https://github.com/qbcore-framework/qb-core)

[Preview](https://youtu.be/Z7QYdG9dJKU)

## Key Features ##
 - McKleans Inspired
 - Bulk Ammo Buying
   + Set Ammo boxes to have set amount of ammo

## To Setup ##
 1. Create a file called `[scripts]` in your resource file
  1a. ensure `[scripts]` in your `server.cfg`
 2. then create a file called `[mckleans]` in your `[scripts]` file
 3. and place `mk-ammoboxes` in your `[mckleans]` file

## Step 4

Add to your Items.lua
```lua
["pistolammobox"]			    = {["name"] = "pistolammobox", 			  	["label"] = "Pistol Ammo Box", 		["weight"] = 200, 		["decay"] = nil,	["type"] = "item", 		["image"] = "919mm_box.png", 			["created"] = nil, 		["delete"] = true,		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Bulk Pistol Ammo" },
["smgammobox"]			    = {["name"] = "smgammobox", 			  	["label"] = "SMG Ammo Box", 		["weight"] = 200, 		["decay"] = nil,	["type"] = "item", 		["image"] = "919mm_box.png", 			["created"] = nil, 		["delete"] = true,		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Bulk SMG Ammo" },
```

## Step 5

Go to jim-shops / qb-shops and add

```lua
		["weapons"] = {
			{ name = "weapon_knife", 	price = 100, amount = 250, },
			{ name = "weapon_bat", 		price = 100, amount = 250, },
			{ name = "weapon_hatchet",	price = 150, amount = 250, },
			{ name = "weapon_pistol", 	price = 2500, amount = 50, requiresLicense = true },
			{ name = "pistol_ammo", 	price = 150, amount = 250, requiresLicense = true },
			{ name = "pistolammobox", 	price = 600, amount = 250, info = { uses = 4 }, requiresLicense = true }, -- < Add this line here
		},
```

## Step 6

Add the following to your `inventory/html/js/app.js` search for harness and apply it there

```lua
		// ---------- mk-ammoboxes vvvv 
        } else if (itemData.name == "pistolammobox") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p>" + itemData.info.uses + " uses left.</p>"
            );
        } else if (itemData.name == "smgammobox") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p>" + itemData.info.uses + " uses left.</p>"
            );
        // ---------- mk-ammoboxes ^^^^
```

## Step 7

Add the following to your `inventory/server/main.lua` search for harness and apply it there

```lua
		---------- mk-ammoboxes vvvv 
        elseif itemData["name"] == "pistolammobox" then
			info.uses = 4
		elseif itemData["name"] == "smgammobox" then
			info.uses = 4
        ---------- mk-ammoboxes ^^^^
```
