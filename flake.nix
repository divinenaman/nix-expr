{
	inputs = {
          mypkgs.url = "path:./flakes/hello-flake";
	  nixpkgs.url = "github:nixos/nixpkgs";
	  flake-utils = "github:numtide/flake-utils";
	};

	outputs = { self, mypkgs, nixpkgs, flake-utils }:
 	  flake-utils.lib.eachDefaultSystem (sys: 
	    let pkgs = mypkgs.packages.${sys};
	    in {
	    	packages.hello = pkgs.hello;
	    }
	  );
}
