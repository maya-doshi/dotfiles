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

# Set up Zoxide [cd alternative]
# zoxide init fish | source

## ALIASES

# Colorful Nerd Font ls
alias ls="lsd"
alias lsa="lsd -a"
alias tree="lsd --tree"

# Helix Text editor (arch package doesnt name binary hx :[)
alias hx="helix"

# Compat ssh: Fixes weird ssh behaviour on foot
alias cssh="TERM=xterm-256color ssh"

# Git Commands
alias gap="git add -p"
alias gaa="git add ."
alias gic="git commit"
alias gip="git push"

# PDF Reader forks off automatically and shorter command
alias za="zathura --fork"

# Code auto launches in Wayland, for some reason config files dont work
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"

# Directory Shortcuts
alias cmu="cd ~/Documents/CMU/Spring23/"
alias projects="cd ~/Documents/Projects/"
