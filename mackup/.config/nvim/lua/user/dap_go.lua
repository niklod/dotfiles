local ok, dap = pcall(require, "dap")
if not ok then
  return
end

  dap.adapters.go = {
      type = 'server';
      host = '127.0.0.1';
      port = 38697;
      enrich_config = function(config, on_config)
        local final_config = vim.deepcopy(config)

        local t = {}
        t["test_env"] = "test_value"

        vim.tbl_extend(final_config.env, t)

        on_config(final_config)
      end;
    }
  dap.configurations.go = {
  {
    type = "go",
    name = "Debug file",
    request = "launch",
    program = "${file}",
    mode = "debug",
    showLog = true,
    dlvToolPath = vim.fn.exepath "dlv",
  },
  {
    type = "go",
    name = "Debug package",
    request = "launch",
    program = "${fileDirname}",
    mode = "debug",
    showLog = true,
    dlvToolPath = vim.fn.exepath "dlv",
  },
}
