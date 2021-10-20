-- TODO:
--    + Proper OSC not that mpv crap (do not take that as an insult);
--    + Cropping the image would be cool;
--    + Blurring runtime would be cool;
--    + Collection project.
--
require 'mp'
require 'mp.options'

local prop_get = mp.get_property_native
local prop_set = mp.set_property_native
local evnt_set = mp.register_event
local bind_key = mp.add_key_binding
local exec_cmd = mp.command
local osc_msgs = mp.osd_message

-- This is an helper function designed to allow the user to load a table of
-- options with a single function call. This only accepts tables that are built
-- like this: property = "value", it won't rely on any index and also it won't
-- update the value of the properties.
local function loadOptions(options)
   if options ~= nil then
      for index, _ in ipairs(options) do
         prop_set(options[index][1], options[index][2])
      end
   end
end

-- Short function to update a property and eventually display a message
local function update(opt, update, msg)
   prop_set(opt, prop_get(opt) + update)

   if msg ~= nil then osc_msgs(msg) end
end

-- Really can't figure out how to make a decent zoom
local function zoom(msg, value)
   osc_msgs(msg)
   local m = prop_get("mouse-pos")
   local w = prop_get("osd-dimensions")

   local x_offset = (m["x"] - w["w"]/2)/w["w"]
   local y_offset = (m["y"] - w["h"]/2)/w["h"]
   prop_set("video-pan-x", -x_offset)
   prop_set("video-pan-y", -y_offset)
   update("video-zoom", value)
end

local resetOptions = {
   {"video-zoom", "0"},
   {"video-pan-x", "0"},
   {"video-pan-y", "0"}
}

-- When reading an image mpv will just open the file and close it immediately
-- after. This function will be called avery time a file gets loaded and if it's
-- an images it will set the `pause` option.
evnt_set("file-loaded", (function(event)
   -- Getting the name of the file
   local name = string.lower(prop_get("path"))

   if name:match(".+(.png)") or name:match(".+(.jpg)") then
      loadOptions({{"pause", "yes"}, {"osc","no" }})
      osc_msgs(prop_get("filename"))

      -- Initiating the viewer
      -- Mapping hl to move through the playlist using `playlist-next and
      -- playlist-prev`
      bind_key('l', (function() mp.command("playlist-next") end))
      bind_key('h', (function() mp.command("playlist-prev") end))

      -- Configuring mpv with some image-viewer related functions like:
      --    + Zooming-in using '+';
      --    + Zooming-out using '-';
      --    + Deafult zoom value using '='.
      bind_key('=', (function() loadOptions(resetOptions) end))
      bind_key('+', (function() update("video-zoom",  0.1, "Zooming-in")  end))
      bind_key('-', (function() update("video-zoom", -0.1, "Zooming-out") end))
      bind_key('WHEEL_UP',   (function() zoom("Zooming-in",   0.05) end))
      bind_key('WHEEL_DOWN', (function() zoom("Zooming-out", -0.05) end))

      -- Mapping HJKL to move through the zoomed image using `video-pan-x` and
      -- `video-pan-y`.
      bind_key('H', (function() update("video-pan-x",  0.01) end))
      bind_key('L', (function() update("video-pan-x", -0.01) end))
      bind_key('J', (function() update("video-pan-y", -0.01) end))
      bind_key('K', (function() update("video-pan-y",  0.01) end))
   end
end))
