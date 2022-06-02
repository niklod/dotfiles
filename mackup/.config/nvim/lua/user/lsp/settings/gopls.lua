return {
	cmd = {'gopls'},
    settings = {
      gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            fieldalignment = true,
            nilness = true,
            shadow = true,
            unusedwrite = true,
            assign = true,
            atomic = true
         },
         staticcheck = true,
        },
    },
}

