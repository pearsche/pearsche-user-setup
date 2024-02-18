{
	description = "Stereomato's home-manager setup.";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
		nix-index-database = {
			url = "github:Mic92/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixified-ai = {
			url = "github:nixified-ai/flake";
			#inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, nix-vscode-extensions, nix-index-database, ... }@inputs:
		let
			system = "x86_64-linux";
		in {
			homeConfigurations."stereomato" = home-manager.lib.homeManagerConfiguration {
				# https://github.com/nix-community/home-manager/issues/2942
				pkgs = nixpkgs.legacyPackages.${system};

				# Specify your home configuration modules here, for example,
				# the path to your home.nix.
				modules = [ 
					./modules/fonts.nix
					./modules/gtk.nix
					./modules/home.nix
					./modules/nix.nix
					./modules/nixpkgs.nix
					./modules/programs.nix
					./modules/qt.nix
					./modules/services.nix
					./modules/systemd.nix
					nix-index-database.hmModules.nix-index

				];
				extraSpecialArgs = { inherit inputs; installPath = "/home/stereomato/Documents/Software Development/Repositories/Personal/hm-setup"; username = "stereomato"; };
				# Optionally use extraSpecialArgs
				# to pass through arguments to home.nix
			};
		};
}
