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

      -- Initiating the veiwer
      -- Mapping hl to move through the playlist using `playlist-next and
      -- playlist-prev`
      bind_key('l', (function() mp.command("playlist-next") end))
      bind_key('h', (function() mp.command("playlist-prev") end))

      -- Configuring mpv with some image-viewer related functions like:
      --    + Zooming-in using '+';
      --    + Zooming-out using '-';
      --    + Deafult zoom value using '='.
      bind_key('=', (function() prop_set("video-zoom", "0") end))
      bind_key('+', (function()
                        prop_set("video-zoom", (prop_get("video-zoom") + 0.1))
                        osc_msgs("Zooming-in")
                     end))
      bind_key('-', (function()
                        prop_set("video-zoom", (prop_get("video-zoom") - 0.1))
                        osc_msgs("Zooming-out")
                     end))

      -- Mapping HJKL to move through the zoomed image using `video-pan-x` and
      -- `video-pan-y`.
      bind_key('H', (function()
                        prop_set("video-pan-x",
                                    (prop_get("video-pan-x") + 0.01))
                     end))
      bind_key('L', (function()
                        prop_set("video-pan-x",
                                    (prop_get("video-pan-x") - 0.01))
                     end))
      bind_key('J', (function()
                        prop_set("video-pan-y",
                                    (prop_get("video-pan-y") - 0.01))
                     end))
      bind_key('K', (function()
                        prop_set("video-pan-y",
                                    (prop_get("video-pan-y") + 0.01))
                     end))
   end
end))
