all:
	sudo nixos-rebuild -I nixos-config=./work-vm.nix switch

upgrade:
	sudo nixos-rebuild -I nixos-config=./work-vm.nix switch --upgrade

xserver:
	sudo systemctl start display-manager.service
