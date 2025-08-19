{ pkgs, lib, settings, ... }:
{
	imports = [
		./hardware-configuration.nix

		../../system/hardware/sound.nix
		#../../system/hardware/bluetooth.nix
		#../../system/hardware/desktop/boot.nix
		../../system/hardware/desktop/drivers.nix
	
		#../../software/wm/hyprland.nix
	
		#../../themes/stylix.nix
		../../system/software/shells/ssh.nix
	];

	boot.initrd.availableKernelModules = [
		"nvidia_drm" "nvidia_modeset" "nvidia" "nvidia_uvm"
	];
	
  	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.cudaSupport = true;

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
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	hardware.bluetooth.enable = true; # enables support for Bluetooth
  	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	services.blueman.enable = true;

	programs.hyprland.enable = true;

	time.timeZone = settings.timezone;

  	networking.firewall.allowedTCPPorts = [ 22 ];
  	networking.firewall.allowedUDPPorts = [ 22 ];

	i18n = {
		defaultLocale = settings.locale;
		extraLocaleSettings = {
			LC_ALL = settings.locale;
		};
	};

   	virtualisation.virtualbox.host.enable = true;
   	users.extraGroups.vboxusers.members = [ settings.username ];
	
	services.xserver.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;

	programs.wireshark = {
		enable = true;
		dumpcap.enable = true;
		usbmon.enable = true;
	};


	services.gvfs.enable = true;
	services.udisks2.enable = true;

	programs.gnome-disks.enable = true;

	environment.systemPackages = with pkgs; [
		home-manager
		git
		vim
		ntfs3g
		exfat
		libva
		libva-utils
		zulu24
    	wineWowPackages.stable
	
    	# support 32-bit only
    	wine
	
    	# support 64-bit only
    	(wine.override { wineBuild = "wine64"; })
	
    	# support 64-bit only
    	wine64
	
    	# wine-staging (version with experimental features)
    	wineWowPackages.staging
	
    	# winetricks (all versions)
    	winetricks
	
    	# native wayland support (unstable)
    	wineWowPackages.waylandFull
	];

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	system.stateVersion = "25.05";
}
