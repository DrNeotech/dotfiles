{ config, pkgs, ...}:
{pkgs, ...}: {
  	home.packages = with pkgs; [
    	(retroarch.withCores (cores:
      		with cores; [
				np2kai
      		]
		))
  	];
}