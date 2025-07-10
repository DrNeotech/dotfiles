{ pkgs, lib, settings, ... }:
{
	imports = [
		./hardware-configuration.nix

		../../system/hardware/sound.nix
		#../../system/hardware/bluetooth.nix
		#../../system/hardware/desktop/boot.nix
		../../system/hardware/desktop/drivers.nix
    
		../../system/software/wm/hyprland.nix
    
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
	programs.firefox.enable = true;
	programs.steam.enable = true;

  time.timeZone = settings.timezone;

	i18n = {
		defaultLocale = settings.locale;
		extraLocaleSettings = {
			LC_ALL = settings.locale;
		};
	};

	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;

	services.gvfs.enable = true;
	services.udisks2.enable = true;

	programs.gnome-disks.enable = true;

	environment.systemPackages = with pkgs; [
		home-manager
		git
		vim
		ntfs3g
		exfat
	];

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	system.stateVersion = "24.11";
}
