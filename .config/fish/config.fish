if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV VARIABLES:
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux MOZ_USE_XINPUT2 1
set -Ux GDK_BACKEND wayland
set -Ux AMD_VULKAN_ICD RADV
set -Ux QT_QPA_PLATFORM wayland-egl
set -Ux EDITOR nvim
set -Ux RUSTC_WRAPPER /home/maya/.cargo/bin/sccache
# fish_add_path -m ~/Documents/Apps/gcc-arm-none-eabi-10.3-2021.10/bin/
# fish_add_path -m ~/.cargo/bin

# Set up Zoxide [cd alternative]
zoxide init fish | source

## ALIASES

# Colorful Nerd Font ls
alias ls="lsd"
alias lsa="lsd -a"
alias tree="lsd --tree"

# Neovim
alias vim="nvim"

# Compat ssh: Fixes weird ssh behaviour on foot
alias cssh="TERM=xterm-256color ssh"

# Git Commands
alias gap="git add -p"
alias gic="git commit"
alias gip="git push"

# PDF Reader forks off automatically and shorter command
alias za="zathura --fork"

# cat with syntax
# alias realcat="cat"
# alias cat="bat"

# emacs terminal
alias emacs="emacs -nw"
alias doom="~/.config/emacs/bin/doom"
