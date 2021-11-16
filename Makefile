all:
	sudo -E nixos-rebuild -I nixos-config=./work-vm.nix switch

upgrade:
	sudo -E nixos-rebuild -I nixos-config=./work-vm.nix switch --upgrade

xserver:
	sudo systemctl start display-manager.service
