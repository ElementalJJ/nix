{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "joshua";
  home.homeDirectory = "/Users/joshua";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # All
    fira-code-nerdfont
    starship
    bun
    lunarvim
    bat
    cargo
    nixfmt
    lazygit

    # MacOS
    rectangle
    appcleaner
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".zshrc" = { source = ./.zshrc; };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/joshua/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "lvim"; };

  xdg.enable = true;

  programs = {
    zsh.enable = true;

    kitty = {
      enable = true;
      theme = "Dracula";
      font.name = "FiraCode Nerd Font Mono";
      font.size = 18;
      settings = {
        background_opacity = "0.8";
        background_blur = 16;
      };
    };

    git = {
      enable = true;
      userName = "ElementalJJ";
      userEmail = "63523035+ElementalJJ@users.noreply.github.com";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
