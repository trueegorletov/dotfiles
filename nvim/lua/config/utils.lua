local M = {}

function M.is_module_available(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == 'function' then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

function M.create_if_needed(dir)
    if not vim.fn.isdirectory(dir) then
        vim.cmd('silent !mkdir -p ' .. dir)
    end
    return dir
end

function M.reload_config()
    require('plenary.reload').reload_module('config')
    vim.cmd [[ :source $MYVIMRC ]]

    vim.cmd [[ :echo "Neovim config was reloaded" ]]
end

return M
