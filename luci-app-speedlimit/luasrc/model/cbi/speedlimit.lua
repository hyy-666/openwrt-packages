local sys = require "luci.sys"
--Author: wulishui <wulishui@gmail.com>
local button = ""
local state_msg = ""
local m,s,n
local running=(luci.sys.call("[ `(tc qdisc show dev br-lan|head -1) 2>/dev/null|grep -c 'default' 2>/dev/null` -gt 0 ] > /dev/null") == 0)

if running then
        state_msg = "<b><font color=\"green\">" .. translate("Running") .. "</font></b>"
else
        state_msg = "<b><font color=\"red\">" .. translate("Not running") .. "</font></b>"
end

m = Map("speedlimit", translate("Speed Limit"))
m.description = translate("Speed Limit can limit user's speed via MAC or IP or IP range.").. button .. "<br/><br/>" .. translate("Running state").. " : "  .. state_msg .. "<br />"

s = m:section(TypedSection, "usrlimit", translate(""), translate("The denomination is MB/S. You can type in 0 and move the rule to top to unlimit someone to exclude for overlapping IP range, click --custom-- (at the bottom of the MAC list) to type in IP or IP range or IP with mask."))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true
s.sortable  = true

e = s:option(Flag, "enable", translate("Limite"))
e.rmempty = false

usr = s:option(Value, "usr",translate("MAC/IP/IPrange<font color=\"green\">(MAC support the separation is : or - .)</font>"))
sys.net.mac_hints(function(mac, name)
	usr:value(mac, "%s (%s)" %{ mac, name })
end)

dl = s:option(Value, "download", translate("Download<font color=\"green\">(MB/s)</font>"))
dl.rmempty = false

ul = s:option(Value, "upload", translate("Upload<font color=\"green\">(MB/s)</font>"))
ul.rmempty = false

comment = s:option(Value, "comment", translate("Comment"))

return m




