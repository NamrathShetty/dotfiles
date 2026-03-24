return {
    "zbirenbaum/copilot.lua",
    opts = {
        panel = {
            enabled = true,
            keymap = {
                open = "<M-CR>",
                accept = "<CR>",
                jump_prev = "[[",
                jump_next = "]]",
                refresh = "gr",
            },
        },
        suggestion = {
            enabled = false,
            auto_trigger = false,
            keymap = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
    },
    config = function(_, opts)
        require("copilot").setup(opts)
    end,
}