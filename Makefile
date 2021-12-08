all:
	sudo nixos-rebuild -I nixos-config=./milhouse.nix switch

upgrade:
	sudo nixos-rebuild -I nixos-config=./milhouse.nix switch --upgrade

xserver:
	sudo systemctl start display-manager.service
