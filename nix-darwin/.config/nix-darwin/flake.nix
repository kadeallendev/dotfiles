{
  description = "Kade's Nix-Darwin Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
	# homebrew-core = {
 #      url = "github:homebrew/homebrew-core";
 #      flake = false;
 #    };
 #    homebrew-cask = {
 #      url = "github:homebrew/homebrew-cask";
 #      flake = false;
 #    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.neovim
		  pkgs.tmux
		  pkgs.mkalias
        ];

	  homebrew = {
		enable = true;
		casks = [
		  "firefox"
			"powershell"
		];
	  };

	  fonts.packages = [
		(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
	  ];

	  system.activationScripts.applications.text = let
		env = pkgs.buildEnv {
		  name = "system-applications";
		  paths = config.environment.systemPackages;
		  pathsToLink = "/Applications";
		};
	  in
		pkgs.lib.mkForce ''
		# Set up applications.
		echo "setting up /Applications..." >&2
		rm -rf /Applications/Nix\ Apps
		mkdir -p /Applications/Nix\ Apps
		find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
		while read src; do
		  app_name=$(basename "$src")
		  echo "copying $src" >&2
		  ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
		done
			'';

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
      modules = [
		configuration
		nix-homebrew.darwinModules.nix-homebrew {
		  nix-homebrew = {
			enable = true;
			enableRosetta = true;
			user = "kadeallen";
			autoMigrate = true;
		  };
		}
		];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Kades-MacBook-Air".pkgs;
  };
}
