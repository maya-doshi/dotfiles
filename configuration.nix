# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  ...
}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "logan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = ( with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
    gnome-console
    epiphany
    gnome.yelp
    gnome.gnome-contacts
    gnome.simple-scan
    gnome.geary
    gnome.gnome-music
    gnome.gnome-characters
    gnome.gnome-maps
    gnome.totem
  ]);

  environment.sessionVariables.NIXOS_OZONE_WL="1";
  environment.sessionVariables.GOPATH="$HOME/.local/share/go";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maya = {
    isNormalUser = true;
    description = "maya";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # code
      vscodium
      lazygit
      gh
      
      # security
      bitwarden
      ## add a 2fa app

      # docs
      qownnotes
      libreoffice
      ## obsidian (package broken)

      # music
      nicotine-plus
      strawberry
      spotifyd
      spotify-player

      # gaming
      steam

      # pdf
      zathura
      sioyek

      # image
      gimp

      # latex
      tectonic

      # communication
      thunderbird
      protonmail-bridge
      telegram-desktop
      signal-desktop
      webcord

      # misc
      trayscale
    ];
  };

  # Install neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      waybar
      sway-contrib.grimshot
      swaynotificationcenter
      fuzzel
      brightnessctl
      pavucontrol
      rofimoji
      swaylock
      wl-clipboard
      nwg-displays
      wdisplays
    ];
  };

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    fira-code
    fira
    cooper-hewitt
    ibm-plex
    jetbrains-mono
    iosevka
    spleen
    fira-code-symbols
    powerline-fonts
    nerdfonts
    noto-fonts-color-emoji
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # web
    firefox

    # terminal
    foot

    # network
    tailscale ## Switch to headscale

    # file management
    syncthing
    rclone

    # theme
    adw-gtk3

    # code
    go
    rustup
    gcc
    python3
    git

    # cli
    fish
    tlrc
    btop
    ripgrep
    fastfetch
    lsd
    wget
    fzf
    zoxide
    tmux

    # media
    mpv
    pulseaudio
    yt-dlp
    mediainfo
    easyeffects
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.syncthing.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
