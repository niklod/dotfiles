if status is-interactive
    set -l onedark_options '-b'

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options "-256"
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title; true; end
        set onedark_options "-256"
    end

    set_onedark $onedark_options
end

set PATH $GOROOT/bin:/usr/local/go /usr/local/go/bin $PATH
set PATH $HOME/bin /usr/local/bin $PATH
set PATH $GOROOT/bin /usr/local/go /usr/local/go/bin $PATH
set PATH $GOBIN $PATH

set GOPATH $HOME/code
set GOBIN $GOPATH/bin

set VISUAL nvim
set EDITOR nvim

# Aliases
alias vim='/usr/local/bin/nvim'
alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'
alias l='ls -lah'
