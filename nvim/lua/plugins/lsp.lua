return {
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body) -- Replace with your snippet engine.
          end,
        },
      })
    end,
  },

  -- Mason and Mason-LSPConfig
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
		  install_root_dir = vim.fn.stdpath('data') .. '/mason-local',
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
            },
        },
    },
			})
          end,
        },
      })
    end
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    init = function()
      -- Reserve a space in the gutter
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      -- These are just examples. Replace them with the language
      -- servers you have installed in your system
      -- require('lspconfig').gleam.setup({})
      -- require('lspconfig').ocamllsp.setup({})
    end,
  },

}




-- -- return {
-- -- 	{
-- -- 		"neovim/nvim-lspconfig",
-- -- 		'hrsh7th/cmp-nvim-lsp',
-- -- 		'hrsh7th/nvim-cmp',
-- -- 	-- 	config = function()
-- -- 	-- 		-- Reserve a space in the gutter
-- -- 	-- 		vim.opt.signcolumn = 'yes'
-- -- 	--
-- -- 	-- 		--	
-- -- 	-- 		-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- -- 	-- 		-- This should be executed before you configure any language server
-- -- 	-- 		local lspconfig_defaults = require('lspconfig').util.default_config
-- -- 	-- 		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
-- -- 	-- 			'force',
-- -- 	-- 			lspconfig_defaults.capabilities,
-- -- 	-- 			require('cmp_nvim_lsp').default_capabilities()
-- -- 	-- 		)
-- -- 	--
-- -- 	-- 		-- Define LSP keybindings only for active language servers
-- -- 	-- 		vim.api.nvim_create_autocmd('LspAttach', {
-- -- 	-- 			desc = 'LSP actions',
-- -- 	-- 			callback = function(event)
-- -- 	-- 				local opts = { buffer = event.buf }
-- -- 	--
-- -- 	-- 				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
-- -- 	-- 				vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
-- -- 	-- 				vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
-- -- 	-- 			end,
-- -- 	-- 		})
-- -- 	-- 	end,
-- -- 	-- },
-- -- }