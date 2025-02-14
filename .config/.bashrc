# ~/.bashrc


# ---- Environments ----
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.config/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_SESSION_TYPE=wayland
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"
export VISUAL="${EDITOR}"
export WLR_NO_HARDWARE_CURSORS=1
export ACCESSIBILITY_ENABLED=1
export GTK_MODULES=gail:atk-bridge
export OOO_FORCE_DESKTOP=gnome
export GNOME_ACCESSIBILITY=1
export QT_ACCESSIBILITY=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
# Evals
eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"


# ---- Settings ----
[[ $- != *i* ]] && return
HISTSIZE=5000
HISTFILE=$HOME/.config/bashist
SAVEHIST=$HISTSIZE
HISTDUP=erase


# ---- Alias ----
alias cd='z'
alias cat='bat'
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions -la'
alias grep='grep --color=auto'
alias vi='nvim'
alias neovim='nvim'
alias bf='clear; bunnyfetch'
alias boottime='systemd-analyze'
alias grep='grep --color=auto'
alias .bashrc='nvim $HOME/.config/.bashrc'
alias init.lua='nvim $HOME/.config/nvim/init.lua'
alias init.remap='nvim $HOME/.config/nvim/plugin/remap.lua'
alias init.plugin='nvim $HOME/.config/nvim/plugin/init.lua'

alias mem='free --mega'
alias memory='free --mega'
alias disk='echo -e "Filesystem      Size  Used Avail Use% Mounted on"; df -h | grep /boot; df -h | grep /home'
gitup (){
    choice=$1
    lastcommit=$(git show --summary | awk 'NR==5' | sed 's/    //')
    git add $choice
    echo ""
    echo "Last Commit: $lastcommit"
    read -p "+Commit msg: " commitmsg
    git commit -m \""$commitmsg"\"
    echo ""
    read -p "Branch to push: " branches
    git push -u origin $branches
}

PS1='[\u@\h \W]\$ '
bunnyfetch


# ---- Fzf Setup -----
export FZF_DEFAULT_OPTS='
  --color fg:#5d6466,bg:#1e2527
  --color bg+:#ef7d7d,fg+:#2c2f30
  --color hl:#dadada,hl+:#26292a,gutter:#1e2527
  --color pointer:#373d49,info:#606672
  --border
  --color border:#1e2527
  --height 13'
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}
_fzf_comprun() {
    local command=$1
    shift
    case "$command" in
        cd)             fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset)   fzf --preview "eval 'echo \$' {}"       "$@" ;;
        ssh)            fzf --preview 'dig {}'                  "$@" ;;
        *)              fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
    esac
}

# ---- Bat Setup ----
export BAT_THEME=Everblush
