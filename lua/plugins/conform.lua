return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "blue")
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = function(bufnr)
          -- Function to check if .no-black exists in any parent directory
          local function blackOrBlue()
            local path = vim.api.nvim_buf_get_name(bufnr)
            -- Check if the path is already the root
            local function isRootDir(p)
              return p == "/" or string.match(p, "^[A-Za-z]:\\$")
            end
            local function isProjectRoot(p)
              return vim.fn.isdirectory(p .. "/.git") ~= 0 or vim.fn.filereadable(p .. "/pyproject.toml") ~= 0
            end
            local function hasBlueTool(p)
              if vim.fn.filereadable(p .. "/pyproject.toml") then
                for line in io.lines(p .. "/pyproject.toml") do
                  if line == "[tool.blue]" then
                    return true
                  end
                end
              end
              return false
            end
            while path and not isRootDir(path) do
              if isProjectRoot(path) then
                if hasBlueTool(path) then
                  return { "blue" }
                elseif vim.fn.filereadable(path .. "/.no-black") ~= 0 then
                  return {}
                end
                break
              end
              local newPath = vim.fn.fnamemodify(path, ":h")
              -- Avoid infinite loop
              if newPath == path then
                break
              end
              path = newPath
            end
            return { "black" }
          end

          -- Check if .no-black exists, then choose the formatter
          return blackOrBlue()
        end,
      },
    },
  },
}
