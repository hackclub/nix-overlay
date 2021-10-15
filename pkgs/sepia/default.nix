{ buildGoModule
, fetchFromGithub
}:

buildGoModule rec = {
  pname = "sepia";
  version = "0.1";

  src = fetchFromGithub {
    owner = "rishiosaur";
    repo = "sepiago";
    rev = "v${version}";
    sha256 = "00000000000000";
  };

  vendorSha256 = "000000";

  runVend = true;

  meta = with lib; {
    description = "A minimal functional programming language";
    homepage = "https://github.com/rishiosaur/sepiago";
    license = licences.asl20;
    platforms = platforms.linux ++ platforms.darwin;
  };
};



