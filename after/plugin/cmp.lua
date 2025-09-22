
-- Better completion experience
vim.o.completeopt = "menu,menuone,noselect"

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

local sources = {
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "buffer" },
}

-- If you installed LuaSnip, enable it:
local ok_snip, luasnip = pcall(require, "luasnip")
if ok_snip then
  require("luasnip.loaders.from_vscode").lazy_load()
  sources = vim.list_extend({ { name = "luasnip" } }, sources)
end

cmp.setup({
  snippet = ok_snip and {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  } or nil,
  mapping = cmp.mapping.preset.insert({
    ["<CR>"]     = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"]     = cmp.mapping.select_next_item(),
    ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
  }),
  sources = sources,
})
