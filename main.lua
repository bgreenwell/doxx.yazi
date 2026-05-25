local M = {}

function M:peek(job)
	local child, err = Command("doxx")
		:arg({ tostring(job.file.url), "--export", "ansi" })
		:stdout(Command.PIPED)
		:stderr(Command.PIPED)
		:spawn()

	if not child then
		ya.err("doxx.yazi: failed to spawn doxx (" .. tostring(err) .. ")")
		return
	end

	local limit = job.area.h
	local i, lines = 0, ""
	repeat
		local next, event = child:read_line()
		if event ~= 0 then
			break
		end
		i = i + 1
		if i > job.skip then
			lines = lines .. next
		end
	until i >= job.skip + limit

	child:start_kill()

	if job.skip > 0 and i < job.skip + limit then
		ya.mgr_emit("peek", {
			math.max(0, i - limit),
			only_if = job.file.url,
			upper_bound = true,
		})
	else
		ya.preview_widget(job, ui.Text.parse(lines):area(job.area))
	end
end

function M:seek(job)
	local h = cx.active.current.hovered
	if h and h.url == job.file.url then
		ya.mgr_emit("peek", {
			math.max(0, cx.active.preview.skip + job.units),
			only_if = job.file.url,
		})
	end
end

return M
