--
--
-- Keyboard mappings configuration file
--
--


local M = {}

-- Returns default options with merged opts
function M.default(opts)
    local def = {
        silent = true,
        noremap = true,
    }

    for k, v in pairs(opts or {}) do
        def[k] = v
    end

    return def
end

local def = M.default()

function M.map(modes, lhs, rhs, opts)
    local mapfunc =
    type(rhs) == 'function'
    and function(m, l, r, o) vim.keymap.set(m, l, r, o) end
    or function(m, l, r, o) vim.api.nvim_set_keymap(m, l, r, o) end

    opts = opts or def

    local avaliable_modes = { 'n', 'v', 'x', 's', 'o', 'i', 'l', 'c', 't' }

    for _,mode in ipairs(avaliable_modes) do
        if string.find(modes, mode) then
            mapfunc(mode, lhs, rhs, opts)
        end
    end
end

-- Shortcuts for non-usual options

function M.log(opts)
    local def = M.default(opts)
    def.silent = false
    return def
end

function M.remap(opts)
    local def = M.default(opts)
    def.noremap = false
    return def
end

function M.expr(opts)
    local def = M.default(opts)
    def.expr = false
    return def
end


return M
