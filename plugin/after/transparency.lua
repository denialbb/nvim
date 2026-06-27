-- Make highlight groups transparent while preserving their other attributes
local function make_transparent(name)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
	if ok then
		hl.bg = nil
		vim.api.nvim_set_hl(0, name, hl)
	end
end

local function apply_transparency()
	local groups = {
		-- transparent background
		"Normal",
		"NormalFloat",
		"FloatBorder",
		"Pmenu",
		"Terminal",
		"EndOfBuffer",
		"FoldColumn",
		"Folded",
		"SignColumn",
		"LineNr",
		"CursorLineNr",
		"NormalNC",
		"WhichKeyFloat",
		"TelescopeBorder",
		"TelescopeNormal",
		"TelescopePromptBorder",
		"TelescopePromptTitle",
		-- tabline and winbar (nvim titlebar / file name bar)
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"WinBar",
		"WinBarNC",
		"StatusLine",
		"StatusLineNC",
		-- neotree
		"NeoTreeNormal",
		"NeoTreeNormalNC",
		"NeoTreeVertSplit",
		"NeoTreeWinSeparator",
		"NeoTreeEndOfBuffer",
		-- nvim-tree
		"NvimTreeNormal",
		"NvimTreeVertSplit",
		"NvimTreeEndOfBuffer",
		-- notify
		"NotifyINFOBody",
		"NotifyERRORBody",
		"NotifyWARNBody",
		"NotifyTRACEBody",
		"NotifyDEBUGBody",
		"NotifyINFOTitle",
		"NotifyERRORTitle",
		"NotifyWARNTitle",
		"NotifyTRACETitle",
		"NotifyDEBUGTitle",
		"NotifyINFOBorder",
		"NotifyERRORBorder",
		"NotifyWARNBorder",
		"NotifyTRACEBorder",
		"NotifyDEBUGBorder",
	}

	for _, name in ipairs(groups) do
		make_transparent(name)
	end

	-- Dynamically make bufferline and lualine highlights transparent
	for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
		if name:match("^BufferLine") or name:match("^lualine_b") or name:match("^lualine_c") or name:match("^lualine_x") or name:match("^lualine_y") then
			make_transparent(name)
		end
	end
end

-- Apply immediately
apply_transparency()

-- Apply after UI is fully loaded and on color scheme changes, scheduled to run after other event handlers
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
	callback = function()
		vim.schedule(apply_transparency)
	end,
})
