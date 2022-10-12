lua <<EOF
	require("nvim-dap-virtual-text").setup()
	require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
EOF
