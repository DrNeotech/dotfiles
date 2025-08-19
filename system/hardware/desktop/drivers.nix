{ config, pkgs, ... }:
{	
	services.xserver = {
		enable = true;
		videoDrivers = ["nvidia"];
	};

	hardware.nvidia = {
    	modesetting.enable = true;
	    powerManagement.enable = false;
	    open = false;
    	nvidiaSettings = true;
    	package = config.boot.kernelPackages.nvidiaPackages.stable;
  	};

	hardware.graphics = {
		enable = true;
		extraPackages = with pkgs; [
		    vulkan-loader
    		vulkan-validation-layers
    		vulkan-extension-layer
				nvidia-vaapi-driver
		];
	};

	services.xserver.xkb = {
    	layout = "us";
    	variant = "";
  	};

	hardware.openrazer.enable = true;
  	hardware.openrazer.users = ["ktlyn"];
}
