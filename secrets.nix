let
  ed255_Pubkey = "ssh-ed25519 some-key-here";
  userKeys = [ed255_Pubkey];
  #ssh machine public keys
  macbook   = "ssh-ed25519 some-machine-key-here";
  systemKeys = [ macbook ];
in
{
  "aws.config.age".publicKeys = userKeys ++ systemKeys;
}
