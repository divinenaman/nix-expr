{ pkgs, config, options, modulePath, lib }:
with lib; {

	options = {
		hello = mkOption {
			type = types.package;
			example = "";
			description = "derivation for hello pkg";
		} 
	};
	config.hello = pkgs.mkShell {
		name = "hello";
		buildInputs = [ pkgs.hello ];
	};
}