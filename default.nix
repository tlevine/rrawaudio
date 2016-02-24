with import <nixpkgs> {}; {
  rrawaudioEnv = stdenv.mkDerivation {
    name = "rrawaudio";
    buildInputs = [
      rPackages.devtools
    ];
    R_LIBS = "${rPackages.devtools}/library";
  };  
}
