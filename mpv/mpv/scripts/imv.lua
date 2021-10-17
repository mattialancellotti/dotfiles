-- TODO:
--    + Need to create an ImageViewer class so that I can better organize the
--      code, like creating lua tables to map actions like zooming-in/out to
--      keys without rewriting the function every time;
--    + Proper OSC not that mpv crap (do not take that as an insult);
--    + Cropping the image would be cool;
--    + Blurring runtime would be cool;
--    + Collection project.
--
require 'mp'
require 'mp.options'

local prop_get = mp.get_property
local prop_set = mp.set_property
local evnt_set = mp.register_event
local bind_key = mp.add_key_binding
local exec_cmd = mp.command
local osc_msgs = mp.osd_message

-- When reading an image mpv will just open the file and close it immediately
-- after. This function will be called avery time a file gets loaded and if it's
-- an images it will set the `pause` option.
evnt_set("file-loaded", (function(event)
   -- Getting the name of the file
   local name = string.lower(prop_get("path"))

   if name:match(".+(.png)") or name:match(".+(.jpg)") then
      prop_set("pause", "yes")
      prop_set("osc", "no")

      -- Showing filename
      osc_msgs(prop_get("filename"))

      -- Short function to update a property and eventually display a message
      local function update(opt, update, msg)
         prop_set(opt, prop_get(opt) + update)

         if msg ~= nil then osc_msgs(msg) end
      end

      -- Initiating the viewer
      -- Mapping hl to move through the playlist using `playlist-next and
      -- playlist-prev`
      bind_key('l', (function() mp.command("playlist-next") end))
      bind_key('h', (function() mp.command("playlist-prev") end))

      -- Configuring mpv with some image-viewer related functions like:
      --    + Zooming-in using '+';
      --    + Zooming-out using '-';
      --    + Deafult zoom value using '='.
      bind_key('=', (function() prop_set("video-zoom", "0") end))
      bind_key('+', (function() update("video-zoom",  0.1, "Zooming-in")  end))
      bind_key('-', (function() update("video-zoom", -0.1, "Zooming-out") end))
      bind_key('WHEEL_UP',
                    (function() update("video-zoom",  0.1, "Zooming-int") end))

      -- Mapping HJKL to move through the zoomed image using `video-pan-x` and
      -- `video-pan-y`.
      bind_key('H', (function() update("video-pan-x",  0.01) end))
      bind_key('L', (function() update("video-pan-x", -0.01) end))
      bind_key('J', (function() update("video-pan-y", -0.01) end))
      bind_key('K', (function() update("video-pan-y",  0.01) end))
   end
end))
