# ---- Setup ----
isi="
# ~/.bashrc
. $HOME/.config/.bashrc
"
check=$(cat $HOME/.bashrc)
if [[ "$check" != "$isi" ]]; then
    cp $HOME/.bashrc $HOME/.bashrc.bak
    echo "$isi" > $HOME/.bashrc
fi
