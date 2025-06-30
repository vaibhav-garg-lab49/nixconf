nixos:
	sudo nixos-rebuild switch --flake .#nixos && home-manager switch --flake .#nixos -b backup

hm:
	home-manager switch --flake .#nixos -b backup
