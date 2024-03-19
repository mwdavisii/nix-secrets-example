{ lib, pkgs, config, userConf, ... }:

let
  cfg = config.secrets;
in {
  options.config.secrets = {
    enable = lib.mkEnableOption "secrets";
  };

  config = lib.mkIf cfg.enable {
    age.secrets.awsconfig = {
      symlink = true;
      file = ./encrypted/aws.config.age;
      mode = "770";
      path =  "/home/${userConf.userName}/.aws/config";
      owner = "${userConf.userName}";
    };
  };
}