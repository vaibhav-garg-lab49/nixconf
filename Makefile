nixos:
	sudo nixos-rebuild switch --flake .#nixwsl && home-manager switch --flake .#v -b backup

hm:
	home-manager switch --flake .#v -b backup
