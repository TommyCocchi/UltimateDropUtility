util.require_natives(1660775568)
util.yield(1000)
util.toast("Developed by TommyCocchi#2920 and Lester#4592")
util.toast("UiltimateDropUtility loaded succesfully!")
util.keep_running()
--
--
--
--   __  __ __ __   _                    __         ____                       __  __ __   _  __ _  __
--  / / / // // /_ (_)____ ___   ____ _ / /_ ___   / __ \ _____ ____   ____   / / / // /_ (_)/ /(_)/ /_ __  __
-- / / / // // __// // __ `__ \ / __ `// __// _ \ / / / // ___// __ \ / __ \ / / / // __// // // // __// / / /
--/ /_/ // // /_ / // / / / / // /_/ // /_ /  __// /_/ // /   / /_/ // /_/ // /_/ // /_ / // // // /_ / /_/ /
--\____//_/ \__//_//_/ /_/ /_/ \__,_/ \__/ \___//_____//_/    \____// .___/ \____/ \__//_//_//_/ \__/ \__, /
--                                                                 /_/                               /____/
--
--
--TommyCocchi#2920 and Lester#4592
--
--
-- V1.0 - First release!
--
--I see u snoopin guysz...
menu.divider(menu.my_root(), "UltimateDropUtility")
local const = {
    first = 20,
    second = 15,
    third = 13,
    fourth = 13,
    fifth = 25,
    sixth = 3,
 }
resources = filesystem.resources_dir() .. 'UltimateDropUtility/'
loadimg = directx.create_texture(resources .. 'kiwi.png')
starttime = os.clock()
local colors = {
    green = 184,
    red = 6,
    yellow = 190,
    black = 2,
    white = 1,
    gray = 3,
    pink = 201,
    purple = 49,
    blue = 11
 }
function notification(message)
        HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(2)
        local picture = "CHAR_MP_FM_CONTACT"
        GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
        while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
            util.yield()
        end
        util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
        subtitle = "~c~Notification"
        HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "CHAR_MP_FM_CONTACT", true, 4, "DropUtility", subtitle)
        HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
        util.log("Notification sent!")
end
notification("Thanks for using UltimateDropUtility!\nhttps://discord.gg/5psfeQ7W2k")

local credits_root = menu.list(menu.my_root(), "Credits", {}, "Credits")
menu.hyperlink(menu.my_root(), "Discord Server", "https://discord.gg/5psfeQ7W2k" , "My personal Discord server.")
menu.hyperlink(credits_root, "Discord Server", "https://discord.gg/5psfeQ7W2k" , "My personal Discord server.")
menu.action(credits_root, "#programming", {}, "Anyone who was online and helped me making this script on the #programming channel in Stand's Discord Server.", function ()
end)
menu.action(credits_root, "Bababoiiiii#7176", {}, "Thanks for help man! (Even though I didn't use your code because when I saw it I had already finished the script)", function ()
end)
menu.action(credits_root, "665#1956", {}, "Thanks for helping, even though I didn't use your code because I didn't see it in time.", function ()
end)
menu.action(credits_root, "Lester#4592", {}, "Made delete pickups part, very needed.", function ()
end)
menu.action(credits_root, "Custex#9682", {}, "Initial idea.", function ()
end)
function kickplayer(name) -- Function definition starts here...
    local sender = playername3
    util.toast("Kicked ".. playername3 .." for having a rate lower than 300.") -- toasts the playername
    chat.send_message("Kicked ".. playername3 .." for having a rate lower than 300.", false, true, true) 
    util.yield(500)
    local sender2 = tostring(name)
    util.toast(sender2)
    menu.trigger_commands("kick"..name) --menu.trigger_commands("kick", ..playername..) uses stand's smart kick function which is much better than kicking with natives
    notification("".. sender .." kicked for using rate under 300!")
end-- and it ends here.  
chat.on_message(function (sender, reserved, text, team_chat)
    cmd1, cmd2 = string.partition(text, ' ') -- partitions text to be divided in 2 pieces
    cmd3, cmd4 = string.partition(cmd2, " ") -- partitions the second piece of the first partition in 2 pieces
    starts = string.startswith(text, "!cash")
    ends = string.endswith(text, "299")
    ratenumber = tonumber(cmd2) -- turns the second string of the first partition into a number value
    ratenumber2 = tonumber(cmd4) -- turns the second string of the second partition into a number value
    playername3 = players.get_name(sender) -- gets the sender's name by using his PID
    if ratenumber ~= nil and ratenumber < 300 and cmd1 == "!cash" and ratenumber ~= 0  then -- checks if the ratenumber is lower than 300 and if it is called inside a command
       kickplayer(playername3, sender)
    else if ratenumber2 ~= nil and ratenumber2 < 300 and cmd1 == "!cash" and ratenumber2 ~=	0 then -- checks if the ratenumber is lower than 300 and if it is called inside a command
       kickplayer(playername3, sender)
    end
  end
end)
local delete = true
menu.toggle_loop(menu.my_root(), "Cleanup Entities", {}, "Deletes dropped pickups every 10 seconds.", function()
    if delete then
        local count = 0
    for _, pickup in ipairs(entities.get_all_pickups_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(pickup, false, false)
        for i = 1, 100, 1 do
            entities.delete_by_handle(pickup)
        end
            util.toast("Pickups Cleared!")
        end
        util.yield(10000)
    end
end)

