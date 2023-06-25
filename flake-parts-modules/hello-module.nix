{ self, ... }: 
	{
		perSystem = { self', pkgs, ... } : {
			packages.flake-parts-hello = pkgs.hello;
		} ;
	}
	