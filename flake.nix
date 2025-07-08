{
	description = "ktlyn NixOS";

	outputs = inputs @ {self, nixpkgs, home-manager, ...} : {
		nixosConfigurations = {};
		homeConfigurations = {};
	};

	inputs = {
		nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
	}
	
}