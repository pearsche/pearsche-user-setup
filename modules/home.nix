{ config, pkgs, installPath, ... }:

{
	imports = [
	];
	home = {
		username = "pearsche";
		homeDirectory = "/home/pearsche";
		packages = with pkgs; [
			
			# TODO: Organize better

			# Cryptocurrency
			monero-gui xmrig-mo
			# Need to report it so it gets fixed
			#oxen
			
			# Zrythm bug https://github.com/NixOS/nixpkgs/issues/184839
			libsForQt5.breeze-icons

			# System monitoring, managing & benchmarking tools
			intel-gpu-tools libva-utils mesa-demos vulkan-tools lm_sensors htop gtop clinfo s-tui neofetch compsize smartmontools nvme-cli btop pciutils usbutils gnome.gnome-power-manager powertop btrfs-progs file stress-ng nvtop powerstat iotop smem
			
      # System management
      
      # Virtualization and containerization
			distrobox gnome.gnome-boxes
			
			# Requires nixos/nixpkgs newer than 22.11
			toolbox

			# Password management
			bitwarden bitwarden-cli 
			
			# File compressors
			rar p7zip
			
			# Miscellanous Gnome apps
			gnome-icon-theme gnome.gnome-tweaks gnome-extension-manager metadata-cleaner warp wike gnome-solanum newsflash 
	
			# Miscellanous cli apps
			xorg.xeyes maigret bc xdg-utils

			# Miscellanous stuff...
			open-in-mpv

			# Font management
			fontforge font-manager
			
			# Windows related stuff
			wineWowPackages.stagingFull dxvk  winetricks proton-caller bottles


			## Software development
			# Compilers, configurers
			patchelf

			# Terminals
			blackbox-terminal

			# Nix tooling
			rnix-lsp nix-prefetch-scripts niv nixd nil

			# Debuggers
			gdb valgrind

			# Code editors/IDEs
			netbeans micro 

			# Documentation tools
			
			# Java libraries
			commonsIo

			# Internet tools
			curl wget aria fragments giara megacmd
			
			# VPN
			protonvpn-gui
			
			# Text editors
			nano gnome-text-editor
			
			# Office and LaTeX
			libreoffice-fresh onlyoffice-bin_latest gnome-latex 
			# bug https://github.com/NixOS/nixpkgs/issues/249946
			# apostrophe 
			
			# QTWebkit shit
			#mendeley
			
			# Games & Fun
			# minecraft (official launcher) https://github.com/NixOS/nixpkgs/issues/179323
			waifu2x-converter-cpp minecraft prismlauncher xonotic protontricks sl vintagestory stuntrally tome4
			
			# Emulators
			dolphin-emu-beta ppsspp-sdl-wayland citra-nightly
			# Multimedia Libs (commenting out because supposedly we're not supposed to install libs here)
			# gnome-video-effects gst_all_1.gstreamer gst_all_1.gst-libav gst_all_1.gst-vaapi gst_all_1.gst-plugins-bad gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly 
			
			# Multimedia

			# Image encoders
			libjxl libavif

			# Gstreamer programs
			gst_all_1.gstreamer

			# Digital books (epubs, manga)
			foliate
			
			# Music/Audio file management
			# Adding both normal ffmpeg and ffmpeg_5 because at time of writing (14-oct-22) default ffmpeg is 4.4.2
			wavpack mac fdk-aac-encoder lame flac freac opusTools opustags flacon easytag spek
			
			# General multimedia tools
			mediainfo  ffmpeg-fuller handbrake-pearsche

			# Digital media players/readers/streamers
			celluloid clapper amberol quodlibet rhythmbox spotify gthumb syncplay
			
			# Screen/Video recorders
			obs-studio-with-plugins simplescreenrecorder kooha

			# Music production: DAWs
			audacity ardour qpwgraph
			# zrythm

			# Music production: plugins
			dragonfly-reverb distrho lsp-plugins x42-plugins chowmatrix auburn-sounds-graillon-2 tal-reverb-4 calf CHOWTapeModel zam-plugins gxplugins-lv2
			
			# Video Production & manipulation
			kdenlive mkvtoolnix davinci-resolve pitivi olive-editor
			
			# Web Browsers
			google-chrome vivaldi vivaldi-ffmpeg-codecs 
			
			# Ask for it to be fixed someday
			#vivaldi-widevine 

			# Chat apps
			element-desktop cinny-desktop tdesktop  discord gnome.polari dino session-desktop mumble fractal
			
			# Fediverse apps
			whalebird
			
			# Image creation and manipulation
			# imagemagickBig is the one that includes ghostscript
			drawing gimp-with-plugins imagemagickBig realesrgan-ncnn-vulkan gnome-obfuscate eyedropper

			# Phone stuff
			scrcpy

			# Computer Graphics
			blender

			# Gamedev
			unityhub godot3-mono godot3-mono-export-templates
			## This is for godot's C# support
			msbuild

			# Spellchecking dictionaries
			#TODO: Write about this in the future NixOS article I wanna write.
			hunspellDicts.en_US hunspellDicts.es_PE aspellDicts.en aspellDicts.es aspellDicts.en-science aspellDicts.en-computers
		];
		
		# Broken https://github.com/nix-community/home-manager/issues/3417
		# environment.localBinInPath for configuration.nix exists anyway.
		#sessionPath = [
		#	"$HOME/.local/bin"
		#];
		
		file."current-hm".source = ./.;
		# Symlink configuration files for programs that modify their settings at runtime/exit
		# https://github.com/nix-community/home-manager/issues/3514
		file.".config/btop".source = config.lib.file.mkOutOfStoreSymlink "${installPath}/to-symlink/btop";
		file.".config/htop".source = config.lib.file.mkOutOfStoreSymlink "${installPath}/to-symlink/htop";
		file.".config/easyeffects".source = config.lib.file.mkOutOfStoreSymlink "${installPath}/to-symlink/easyeffects";
		file.".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink "${installPath}/to-symlink/neofetch";
		file.".config/xmrig-mo".source = config.lib.file.mkOutOfStoreSymlink "${installPath}/to-symlink/xmrig-mo";
		# Version that the installed home-manager is compatible with.
    # Update notes talk about it.
		stateVersion = "22.11";
	};
}
