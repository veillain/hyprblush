sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/plugin/pm.vim --create-dirs https://git.sr.ht/~bpv/pm/blob/master/pm.vim'

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/doc/pm.txt --create-dirs https://git.sr.ht/~bpv/pm/blob/master/pm.txt'
nvim -c "lua dir = os.getenv('XDG_DATA_HOME') or os.getenv('HOME') .. '/.local/share' ; vim.cmd('helptags ' .. dir .. '/nvim/site/doc') ; vim.cmd(':q!')"
