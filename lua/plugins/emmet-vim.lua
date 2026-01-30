-- Emmet [HTML & CSS autocomplete]
return {
	"mattn/emmet-vim",
	init = function()
		vim.cmd([[
      let g:user_emmet_mode='n' " only enable normal mode functions
      let g:user_emmet_leader_key=','
      " autocmd FileType html,css,javascript.jsx EmmetInstall
    ]])
	end,
}
