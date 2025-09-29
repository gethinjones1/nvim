-- lua/plugins/mason-natls.lua
return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.registries = opts.registries
      or {
        -- keep the default registry first
        "github:mason-org/mason-registry",
      }
    -- add Adrian’s registry that includes natls
    table.insert(opts.registries, "github:awilkins/mason-registry")
  end,
}
