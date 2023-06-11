pkgs:
    with pkgs;
    	mkShell {
		name = "hello-mkshell";
		packages = [ pkgs.gnumake pkgs.cowsay ];
		inputsFrom = [ pkgs.hello pkgs.gnutar ];

	}
