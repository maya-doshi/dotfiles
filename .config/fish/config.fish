if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ENV VARIABLES:
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux MOZ_USE_XINPUT2 1
set -Ux GDK_BACKEND wayland

# Set up Zoxide [cd alternative]
zoxide init fish | source

# ALIASES
alias ls="lsd"
alias tree="lsd --tree"
alias hx="helix"
