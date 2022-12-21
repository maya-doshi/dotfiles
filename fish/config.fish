if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV VARIABLES:
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux MOZ_USE_XINPUT2 1
set -Ux GDK_BACKEND wayland
set -Ux AMD_VULKAN_ICD RADV
set -Ux DEVKITPRO /opt/devkitpro/
set -Ux DEVKITARM /opt/devkitpro/devkitARM
set -Ux DEVKITPPC /opt/devkitpro/devkitPPC

# Set up Zoxide [cd alternative]
zoxide init fish | source

# ALIASES
alias ls="lsd"
alias lsa="lsd -a"
alias tree="lsd --tree"
alias hx="helix"
alias alacsh="TERM=xterm-256color ssh"
alias gap="git add -p"
alias gaa="git add ."
alias gic="git commit"
alias gip="git push"
alias za="zathura"
