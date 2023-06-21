{ pkgs, config, options, modulePath }:
{
	hello = pkgs.mkShell {
		name = config.pkgName;
		buildInputs = [ hello ];
	};
}