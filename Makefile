all:
	sudo -E nixos-rebuild -I nixos-config=./milhouse.nix switch

upgrade:
	sudo -E nixos-rebuild -I nixos-config=./milhouse.nix switch --upgrade

xserver:
	sudo systemctl start display-manager.service
