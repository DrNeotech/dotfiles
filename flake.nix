{
	description = "ktlyn NixOS";

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        settings = import (./. + "/settings.nix") {inherit pkgs inputs;};
        pkgs = import nixpkgs {system = settings.system;};
	in {
		nixosConfigurations = {
            ${settings.hostname} = nixpkgs.lib.nixosSystem {
                modules = [
                    inputs.stylix.nixosModules.stylix
                    (./. + "/profiles" + ("/" + settings.profile) + "/configuration.nix")
                ];
                specialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
        };
		homeConfigurations = {
			${settings.username} = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${settings.system};
                modules = [
                    (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
					          inputs.stylix.homeModules.stylix
                    inputs.nixvim.homeManagerModules.nixvim
                ];
                extraSpecialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
		};
	};

	inputs = {
		nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
            type = "git";
            url = "https://github.com/hyprwm/Hyprland";
            submodules = true;
        };
		nix-colors.url = "github:misterio77/nix-colors";

		stylix.url = "github:danth/stylix";
        swww.url = "github:LGFae/swww";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

	};
}