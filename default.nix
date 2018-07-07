with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "shell";
  buildInputs = [ gnumake parallel emem ];
}
