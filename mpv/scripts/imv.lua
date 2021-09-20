require 'mp'
require 'mp.options'

local prop_get = mp.get_property
local prop_set = mp.set_property
local evnt_set = mp.register_event
local bind_key = mp.add_key_binding

-- When reading an image mpv will just open the file and close it immediately
-- after. This function will be called avery time a file gets loaded and if it's
-- an images it will set the `pause` option.
evnt_set("file-loaded", (function(event)
   -- Getting the name of the file
   local name = string.lower(prop_get("path"))

   if name:match(".+(.png)") or name:match(".+(.jpg)") then
      prop_set("pause", "yes")
   end
end))

-- Mapping hl to move through the playlist using `playlist-next and
-- playlist-prev`
bind_key('l', (function() mp.command("playlist-next") end))
bind_key('h', (function() mp.command("playlist-prev") end))
