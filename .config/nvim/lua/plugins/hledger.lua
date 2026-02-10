return {
    -- :TSInstall ledger
    "davidhelbig/hledger.nvim",
    config = function()
        vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
            pattern = { "*.ledger", "*.journal" },
            callback = function()
                local hledger = require("hledger")
                hledger.check { strict = true }
            end,
        })
    end
}
