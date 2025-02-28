local M = {}

function M.invert(tbl)
	local res = {}
	for key, value in pairs(tbl) do
		res[value] = key
	end
	return res
end

return M
