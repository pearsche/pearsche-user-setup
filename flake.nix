{
	description = "Pearsche's home-manager setup.";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
	};

	outputs = { nixpkgs, home-manager, nix-vscode-extensions, ... }@inputs:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			homeConfigurations."pearsche" = home-manager.lib.homeManagerConfiguration {
				# https://github.com/nix-community/home-manager/issues/2942
				pkgs = import nixpkgs {
					inherit system;
					config.allowUnfreePredicate = (pkg: true);
				};

				# Specify your home configuration modules here, for example,
				# the path to your home.nix.
				modules = [ 
					./modules/fonts.nix
					./modules/home.nix
					./modules/nixpkgs.nix
					./modules/programs.nix
					./modules/qt.nix
					./modules/services.nix 
				];
				extraSpecialArgs = {inherit inputs;};
				# Optionally use extraSpecialArgs
				# to pass through arguments to home.nix
			};
		};
}