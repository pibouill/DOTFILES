-- DEFAULT LAZYVIM CONF
-- 		os.exit(1)
-- 	end
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup({
-- 	spec = {
-- 		-- add lazyvim and import its plugins
-- 		{ "lazyvim/lazyvim", import = "lazyvim.plugins" },
-- 		-- import/override with your plugins
-- 	performance = {
-- 		rtp = {
-- 			-- disable some rtp plugins
-- 			disabled_plugins = {
-- 				"gzip",
-- 				-- "matchit",
-- 				-- "matchparen",
-- 				-- "netrwplugin",
-- 				"tarplugin",
-- 				"tohtml",
-- 				"tutor",
-- 				"zipplugin",
-- 			},
-- 		},
-- 	},
-- })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "failed to clone lazy.nvim:\n", "errormsg" },
			{ out, "warningmsg" },
			{ "\npress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- this is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- setup lazy.nvim
require("lazy").setup({
	spec = {

		{ import = "plugins" },
	},

	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = false, notify = false},
-- 		enabled = true, -- check for plugin updates periodically
-- 		notify = true, -- notify on update
})
