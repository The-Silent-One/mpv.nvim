local M = {}
local state = {
	playing = false,
	jobid = nil,
}

M.play_song = function(query, title)
	if not state.playing then
		local filename = string.format("./videos/%s.mkv", title)
		local localfile = vim.api.nvim_get_runtime_file(filename, false)[1]
		local command = {}
		if localfile then
			command = {
				"mpv",
				string.format("--title=%s", title),
				"--geometry=15%+100%+5",
				"--ontop",
				filename,
			}
		else
			command = {
				"mpv",
				string.format("--title=%s", title),
				"--geometry=15%+100%+5",
				"--ontop",
				string.format("--record-file=%s", filename),
				query,
			}
		end
		state.jobid = vim.fn.jobstart(command, {
			pty = true,
			on_exit = function()
				state.playing = false
			end,
		})
		state.playing = true
	end
end

vim.api.nvim_create_user_command("Pedro", function()
	M.play_song("https://youtu.be/F2YpXC1itEE", "Pedro")
end, { desc = "Pedro" })

vim.api.nvim_create_user_command("Lich", function()
	M.play_song("https://youtu.be/Uh80C5cmkXU", "Lich")
end, { desc = "Lich" })

vim.keymap.set("n", "<leader>W", function()
	M.play_song("https://youtu.be/dQw4w9WgXcQ", "Rickroll")
end, {})

return M
