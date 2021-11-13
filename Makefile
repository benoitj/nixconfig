all:
	sudo nixos-rebuild -I nixos-config=./work.nix switch

upgrade:
	sudo nixos-rebuild -I nixos-config=./work.nix switch --upgrade

xserver:
	sudo systemctl start display-manager.service
