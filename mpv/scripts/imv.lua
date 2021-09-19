require 'mp'
require 'mp.options'

local prop_get = mp.get_property
local prop_set = mp.set_property
local evnt_set = mp.register_event

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
