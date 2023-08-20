{ pkgs, ... }:{
	# Placeholder
	systemd.user = {
		services = {
			home-manager-gc = {
				Unit = {
					Description = "Service that garbage collects the home-manager setup for my user";
					After = "nix-gc.service";
				};
				Service = {
					ExecStart = "${pkgs.home-manager-gc-start}/bin/home-manager-gc-start";
				};
			};
		};
		timers = {
			home-manager-gc = {
				Unit = {
					Description = "Weekly timer for home-manager-gc";
				};
				Timer = {
					OnCalendar = "sunday";
					Persistent = true;
					RandomizedDelaySec = 0;
				};
			};
		};
	};

}