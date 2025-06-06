local colors = require("colors")
local settings = require("settings")
local icons = require("icons")

local icon_color = colors.red
local icon_string = "?"

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = { drawing = false },
	label = {
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		label = {
			string = env.INFO,
		},
	})
end)
