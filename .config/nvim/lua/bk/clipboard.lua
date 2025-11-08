vim.g.clipboard = {
  name = "wl-clipboard",
  cache_enabled = 0,
  copy = {
    ["+"] = function(lines, _)
      local text = table.concat(lines, "\n")
      local job_id = vim.fn.jobstart({"wl-copy"}, {
        stdin = "pipe",
      })
      if job_id > 0 then
        vim.fn.chansend(job_id, text)
        vim.fn.chanclose(job_id, "stdin")
      end
    end,
    ["*"] = function(lines, _)
      local text = table.concat(lines, "\n")
      local job_id = vim.fn.jobstart({"wl-copy"}, {
        stdin = "pipe",
      })
      if job_id > 0 then
        vim.fn.chansend(job_id, text)
        vim.fn.chanclose(job_id, "stdin")
      end
    end,
  },
  paste = {
    ["+"] = function()
      return vim.fn.systemlist("wl-paste --no-newline")
    end,
    ["*"] = function()
      return vim.fn.systemlist("wl-paste --no-newline")
    end,
  },
}

