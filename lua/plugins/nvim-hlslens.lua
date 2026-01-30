return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup({
      -- we override [3n/5]
      override_lens = function(render, posList, nearest, idx, relIdx)
        local total = #posList
        local text = (' [%d/%d]'):format(idx, total)
        local chunks
        if nearest then
          chunks = {{text, 'HlSearchLensNear'}}
        else
          chunks = {{text, 'HlSearchLens'}}
        end
        local lnum, col = unpack(posList[idx])
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    })

    local kopts = {noremap = true, silent = true}
    vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
    -- vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    -- vim.keymap.set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    -- vim.keymap.set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    -- vim.keymap.set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  end
}
