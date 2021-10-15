{ lib
, pkgs
}:

pkgs.buildGoModule rec  {
  name = "sepia";

  src = pkgs.fetchFromGitHub {
    owner = "rishiosaur";
    rev = "7e23793ca7fc215d0a928b6ebb2628c1c3eb492c";
    repo = "sepiago";
    sha256 = "15216xma5n7lpdapm4crljad7i76b9nq14h7mq61qc72nyfivr7v";
  };

  vendorSha256 = null;

  meta = with lib; {
    description = "A minimal functional programming language";
    homepage = "https://github.com/rishiosaur/sepiago";
    license = licences.asl20;
    platforms = platforms.linux ++ platforms.darwin;
  };
}



