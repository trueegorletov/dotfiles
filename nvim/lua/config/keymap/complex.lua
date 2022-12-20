--
--
-- Global complex-declared mappings configuration
--
--

local keymap = require('config.keymap.keymap')

local common = require('config.keymap.common')
local ctrl = require('config.keymap.ctrl')
local space = require('config.keymap.space')


local M = {};


-- Route LSP mappings
M.lsp_on_attach = function (client, bufnr)
    local bufopts = keymap.default { buffer = bufnr }

    common.lsp(bufopts)
    ctrl.lsp(bufopts)
    space.lsp(bufopts)

end


-- Route nvim-cmp mappings
M.cmp = {}
common.cmp(M.cmp)
ctrl.cmp(M.cmp)


-- NvimTree mappings
M.nvim_tree = {
    { key = { "<cr>", "o", "<2-leftmouse>" }, action = "edit" },
    { key = "<c-e>",                          action = "edit_in_place" },
    { key = "O",                              action = "edit_no_picker" },
    { key = { "<C-]>", "<2-rightmouse>" },    action = "cd" },
    { key = "w",                              action = "vsplit" },
    { key = "W",                              action = "split" },
    { key = "t",                              action = "tabnew" },
    { key = "<",                              action = "prev_sibling" },
    { key = ">",                              action = "next_sibling" },
    { key = "P",                              action = "parent_node" },
    { key = "<bs>",                           action = "close_node" },
    { key = "<tab>",                          action = "preview" },
    { key = "K",                              action = "first_sibling" },
    { key = "J",                              action = "last_sibling" },
    { key = "I",                              action = "toggle_git_ignored" },
    { key = "H",                              action = "toggle_dotfiles" },
    { key = "U",                              action = "toggle_custom" },
    { key = "R",                              action = "refresh" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "remove" },
    { key = "D",                              action = "trash" },
    { key = "r",                              action = "rename" },
    { key = "<c-r>",                          action = "full_rename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "y",                              action = "copy_name" },
    { key = "Y",                              action = "copy_path" },
    { key = "gy",                             action = "copy_absolute_path" },
    { key = "[c",                             action = "prev_git_item" },
    { key = "]c",                             action = "next_git_item" },
    { key = "-",                              action = "dir_up" },
    { key = "s",                              action = "system_open" },
    { key = "f",                              action = "live_filter" },
    { key = "F",                              action = "clear_live_filter" },
    { key = "q",                              action = "close" },
    { key = "<c-bs>",                         action = "collapse_all" },
    { key = "E",                              action = "expand_all" },
    { key = "S",                              action = "search_node" },
    { key = ".",                              action = "run_file_command" },
    { key = "<c-i>",                          action = "toggle_file_info" },
    { key = "g?",                             action = "toggle_help" },
}



return M
