{ pkgs, lib, settings, ... }:
{
	imports = [
		./hardware-configuration.nix
	];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    users.users.${settings.username} = {
        isNormalUser = true;
        shell = settings.shellPkg;
        description = settings.username;
        extraGroups = [ "wheel" "gamemode" ];
    };

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking = {
		hostname = "neotech-pc";
		networkmanager.enable = true;
	};

	programs.${settings.shell}.enable = true;

    time.timeZone = settings.timezone;

	i18n = {
		defaultLocale = settings.locale;
		extraLocaleSettings = {
			LC_ALL = settings.localte;
		};
	};

	environment.systemPackages = with pkgs; [
		home-manager
		git
		vim
		steam
	];

	system.stateVersion = "24.11";
}