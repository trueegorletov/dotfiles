function isModuleAvailable(name)
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

function createIfNeeded(dir)
    if not vim.fn.isdirectory(dir) then
        vim.cmd('silent !mkdir -p' .. dir)
    end
    return dir
end
