-- VIM Options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = " "
vim.g.tex_flavor = "latex"



-- Boostrap lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {import = "plugins"}
})



-- Snippets
require("luasnip")
require("luasnip").config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})



-- Completion
local cmp = require'cmp'
cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  --{ name = 'vsnip' }, -- For vsnip users.
  { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})



-- lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.lsp.config("pyright", {capabilities = capabilities, filetypes={"python"}})
vim.lsp.enable("pyright")
vim.lsp.config("fortls", {capabilities = capabilities, filetypes={"fortran"}})
vim.lsp.enable("fortls")
vim.lsp.config("clangd", {capabilities = capabilities, filetypes={"cpp"}})
vim.lsp.enable("clangd")
vim.lsp.config("lua-language-server", {capabilities = capabilities, filetypes={"lua"}})
vim.lsp.enable("lua-language-server")
require("mason").setup()

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {ensure_installed = { "pyright" }}
mason_lspconfig.setup {ensure_installed = { "fortls" }}
mason_lspconfig.setup {ensure_installed = { "clangd" }}
mason_lspconfig.setup {ensure_installed = { "texlab" }}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



-- Nvim tree
require("nvim-tree").setup()
require("nvim-web-devicons").refresh()



-- Yazi
require("yazi")



-- Keymaps
vim.keymap.set('n', '<leader>sub', '/subroutine<CR>', {})
vim.keymap.set('n', '<leader>def', '/def<CR>', {})
vim.keymap.set('n', '<leader>cls', '/class<CR>', {})

vim.keymap.set('n', '<leader>l', '10<C-w>>', {})
vim.keymap.set('n', '<leader>h', '10<C-w><', {})
vim.keymap.set('n', '<leader>j', '10<C-w>-', {})
vim.keymap.set('n', '<leader>k', '10<C-w>+', {})
vim.keymap.set('n', '<leader>=', '10<C-w>=', {})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle .<CR>', {})

vim.keymap.set('n', '<leader>g', ':LazyGit <CR>', {})




-- Startup commands
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[set termguicolors]])
vim.cmd([[set cc=72]])
vim.cmd([[set foldmethod=indent]])
vim.cmd([[set nowrap]])
vim.cmd([[set noswapfile]])
vim.cmd([[set spell spelllang=en_us]])
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
-- vim.cmd([[NvimTreeOpen]])
