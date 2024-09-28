{
  lib,
  pkgs,
  stdenv,
  autoPatchelfHook,
  dpkg,
  ffmpeg,
  gtk3,
  lttng-ust_2_12,
  ...
}:

stdenv.mkDerivation rec {
  pname = "xdm";
  version = "8.0.29";

  system = "x86_64-linux";

  # Do not forget to update the hash on version change
  # nix-fettch-url https://github.com/subhra74/xdm/releases/download/8.0.29/xdman_gtk_8.0.29_amd64.deb
  src = pkgs.fetchurl {
    url = "https://github.com/subhra74/xdm/releases/download/8.0.29/xdman_gtk_8.0.29_amd64.deb";
    sha256 = "04cydd5i94qbnsi2535mswapng6hbwc567jhzbq8s715n0nvnn9n";
  };

  # Required for compilation
  nativeBuildInputs = [
    autoPatchelfHook # Automatically setup the loader, and do the magic
    dpkg
  ];

  # Required at runtime
  buildInputs = [
    ffmpeg
    gtk3
    lttng-ust_2_12
  ];

  unpackPhase = "true";

  # Extract and copy executable in $out/bin
  # cp -a = copy preserving all attributes, recursively, not following symlinks
  installPhase = ''
    # Extract the deb package into a temporary directory
    mkdir -p $TMPDIR
    dpkg-deb --extract $src $TMPDIR

    # Move the extracted files to the output directory
    mkdir -p $out
    cp -av $TMPDIR/opt/xdman/* $out/
    cp -av $TMPDIR/usr/bin/xdman $out/
    cp -av $TMPDIR/usr/share/applications/xdm-app.desktop $out/

    # Remove unnecessary directories
    rm -rf $TMPDIR/opt
    rm -rf $TMPDIR/usr

    # Update the script to point to the correct path in the Nix store
    sed -i "s|/opt/xdman/xdm-app|$out/xdm-app|g" $out/xdman

    # Update the paths in the xdm-app.desktop file
    sed -i "s|/opt/xdman/xdm-app|$out/xdm-app|g" $out/xdm-app.desktop
    sed -i "s|/opt/xdman/xdm-logo.svg|$out/xdm-logo.svg|g" $out/xdm-app.desktop

    # Set correct permissions (ownership is managed by Nix)
    find $out -type d -exec chmod 755 {} +  # Directories
    find $out -type f -exec chmod 644 {} +  # Regular files

    # Ensure binaries are executable
    chmod +x $out/xdman
    chmod +x $out/xdm-app
    chmod +x $out/xdm-app.desktop
  '';

  meta = with lib; {
    description = "Powerfull download accelerator and video downloader";
    homepage = "https://github.com/subhra74/xdm";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "xdm";
    platforms = platforms.all;
  };
}
