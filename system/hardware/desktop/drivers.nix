{ config, pkgs, ... }:
{
	services.xserver.videoDrivers = ["nvidia"];
	
	hardware.nvidia = {
    	modesetting.enable = true;
	    powerManagement.enable = false;
    	powerManagement.finegrained = false;
	    open = true;
    	nvidiaSettings = true;
    	package = config.boot.kernelPackages.nvidiaPackages.stable;
  	};

	hardware.graphics = {
		enable = true;
		extraPackages = with pkgs; [
		    #vulkan-loader
    		#vulkan-validation-layers
    		#vulkan-extension-layer
		];
	};

	services.xserver.xkb = {
    	layout = "us";
    	variant = "";
  	};

	hardware.openrazer.enable = true;
  	hardware.openrazer.users = ["ktlyn"];
}