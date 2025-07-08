{ pkgs, lib, settings, ... }:
{
	imports = [
		./hardware-configuration.nix

		../../system/hardware/sound.nix
		#../../system/hardware/bluetooth.nix
		#../../system/hardware/desktop/boot.nix
		../../system/hardware/desktop/drivers.nix
		../../system/software/hyprland.nix
	];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    users.users.${settings.username} = {
        isNormalUser = true;
        shell = settings.shellPkg;
        description = "Kaitlyn Cancio-Newton";
        extraGroups = [ "networkmanager" "wheel" ];
		home = "/home/ktlyn";
    };

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking = {
		hostName = "neotech-pc";
		networkmanager.enable = true;
	};

	programs.${settings.shell}.enable = true;

    time.timeZone = settings.timezone;

	i18n = {
		defaultLocale = settings.locale;
		extraLocaleSettings = {
			LC_ALL = settings.locale;
		};
	};

	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;

	environment.systemPackages = with pkgs; [
		home-manager
		git
		vim
		ntfs3g
	];

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	system.stateVersion = "24.11";
}
