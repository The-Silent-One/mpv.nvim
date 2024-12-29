local M = {}
local state = {
	playing = false,
	jobid = nil,
}

M.play_song = function(query, title, save)
	if not state.playing then
		local filename = title .. ".mkv"
		local localfolder = vim.api.nvim_get_runtime_file("./videos/", false)[1]
		local localfile = localfolder .. filename
		local command = {}
		if vim.api.nvim_get_runtime_file("./videos/" .. filename, false)[1] then
			command = {
				"mpv",
				string.format("--title=%s", title),
				"--geometry=15%+100%+5",
				"--ontop",
				localfile,
			}
		else
			command = {
				"mpv",
				string.format("--title=%s", title),
				"--geometry=15%+100%+5",
				"--ontop",
				{ save or true } and string.format("--stream-record=%s", localfile) or "",
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

return M
