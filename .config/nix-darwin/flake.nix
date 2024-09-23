{
  description = "Kade's Nix-Darwin Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-bundle = {
        url = "github:homebrew/homebrew-bundle";
        flake = false;
    };
    hombrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
    };
    homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
    };
# Disk partitioning
    # disko = {
    #     url = "github:nix-community/disko";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };
# Secrets
    # secrets = {
    #     url = "git+ssh://git@github.com/dustinlyons/nix-secrets.git";
    #     flake = false;
    # };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Kades-MacBook-Air
    darwinConfigurations."Kades-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Kades-MacBook-Air".pkgs;
  };
}
