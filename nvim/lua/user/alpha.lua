local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[           u]],
  [[      .  x!X]],
  [[    ."X M~~>]],
  [[   d~~XX~~~k    .u.xZ `\ \ "%]],
  [[  d~~~M!~~~?..+"~~~~~?:  "    h]],
  [[ '~~~~~~~~~~~~~~~~~~~~~?      `]],
  [[ 4~~~~~~~~~~~~~~~~~~~~~~>     ']],
  [[ ':~~~~~~~~~~(X+"" X~~~~>    xHL]],
  [[  %~~~~~(X="      'X"!~~% :RMMMRMRs]],
  [[   ^"*f`          ' (~~~~~MMMMMMMMMMMx]],
  [[     f     /`   %   !~~~~~MMMMMMMMMMMMMc]],
  [[     F    ?      '  !~~~~~!MMMMMMMMMMMMMM.]],
  [[    ' .  :": "   :  !X""(~~?MMMMMMMMMMMMMMh]],
  [[    'x  .~  ^-+="   ? "f4!*  #MMMMMMMMMMMMMM.]],
  [[     /"               .."     `MMMMMMMMMMMMMM]],
  [[     h ..             '         #MMMMMMMMMMMM]],
  [[    f                '          @MMMMMMMMMMM]],
  [[  :         .:=""     >       dMMMMMMMMMMMMM]],
  [[   "+mm+=~("           RR     @MMMMMMMMMMMMM"]],
  [[           %          (MMNmHHMMMMMMMMMMMMMMF]],
  [[          uR5         @MMMMMMMMMMMMMMMMMMMF]],
  [[        dMRMM>       dMMMMMMMMMMMMMMMMMMMF]],
  [[       RM$MMMF=x..=" RMRM$MMMMMMMMMMMMMMF]],
  [[      MMMMMMM       'MMMMMMMMMMMMMMMMMMF]],
  [[     dMMRMMMK       'MMMMMMMMMMMMMMMMM"]],

}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "Make Cool Stuff!"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
