{ pkgs }: {
  deps = [
    pkgs.unzip
    pkgs.wget
    pkgs.android-tools
    pkgs.gradle
    pkgs.openjdk17
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}