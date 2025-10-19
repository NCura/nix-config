{
  buildGoModule,
  cairo,
  cargo-tauri,
  cargo,
  esbuild,
  fetchFromGitHub,
  gdk-pixbuf,
  glib-networking,
  gobject-introspection,
  jq,
  lib,
  libsoup_3,
  makeBinaryWrapper,
  moreutils,
  nodejs,
  openssl,
  pango,
  pkg-config,
  bun,
  rustc,
  rustPlatform,
  stdenv,
  webkitgtk_4_1,
}:

let
  esbuild_21-5 =
    let
      version = "0.21.5";
    in
    esbuild.override {
      buildGoModule =
        args:
        buildGoModule (
          args
          // {
            inherit version;
            src = fetchFromGitHub {
              owner = "evanw";
              repo = "esbuild";
              rev = "v${version}";
              hash = "sha256-FpvXWIlt67G8w3pBKZo/mcp57LunxDmRUaCU/Ne89B8=";
            };
            vendorHash = "sha256-+BfxCyg0KkDQpHt/wycy/8CTG6YBA/VJvJFhhzUnSiQ=";
          }
        );
    };

  # Fetch Bun dependencies as a fixed-output derivation
  bunDeps = stdenv.mkDerivation {
    pname = "surrealist-bun-deps";
    version = "3.5.7";

    src = fetchFromGitHub {
      owner = "surrealdb";
      repo = "surrealist";
      rev = "surrealist-v3.5.7";
      hash = "sha256-5d0HVn4dv2jHt6MB/JCrv9DlH0VsRuU9FHcEkuBktiw=";
    };

    nativeBuildInputs = [
      bun
      nodejs
    ];

    buildPhase = ''
      export HOME=$(mktemp -d)
      bun install --frozen-lockfile --no-progress
    '';

    installPhase = ''
      mkdir -p $out
      cp -r node_modules $out/

      # Patch shebangs in .bin
      if [ -d "$out/node_modules/.bin" ]; then
        patchShebangs $out/node_modules/.bin
      fi
    '';

    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = "sha256-/jHcT1vpQ/2ZubUXmBxrWQHDE+xPM6lGLL+/Nq1s/fE=";
  };

in
stdenv.mkDerivation (finalAttrs: {
  pname = "surrealist";
  version = "3.5.7";

  src = fetchFromGitHub {
    owner = "surrealdb";
    repo = "surrealist";
    rev = "surrealist-v${finalAttrs.version}";
    hash = "sha256-5d0HVn4dv2jHt6MB/JCrv9DlH0VsRuU9FHcEkuBktiw=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) src cargoRoot;
    hash = "sha256-NhgSfiBb4FGEnirpDFWI3MIMElen8frKDFKmCBJlSBY=";
  };

  nativeBuildInputs = [
    bun
    cargo
    cargo-tauri.hook
    gobject-introspection
    jq
    makeBinaryWrapper
    moreutils
    nodejs
    pkg-config
    rustc
    rustPlatform.cargoSetupHook
  ];

  buildInputs = [
    cairo
    gdk-pixbuf
    libsoup_3
    openssl
    pango
    webkitgtk_4_1
  ];

  env = {
    ESBUILD_BINARY_PATH = lib.getExe esbuild_21-5;
    OPENSSL_NO_VENDOR = 1;
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  # Deactivate the upstream update mechanism
  postPatch = ''
    jq '
      .bundle.createUpdaterArtifacts = false |
      .plugins.updater = {"active": false, "pubkey": "", "endpoints": []}
    ' \
    src-tauri/tauri.conf.json | sponge src-tauri/tauri.conf.json
  '';

  preConfigure = ''
    # Use pre-fetched node_modules
    cp -r ${bunDeps}/node_modules .
    chmod -R +w node_modules

    # Patch shebangs in all node_modules (not just .bin, as .bin contains symlinks)
    patchShebangs node_modules

    export HOME=$(mktemp -d)
  '';

  postFixup = ''
    wrapProgram "$out/bin/surrealist" \
      --set GIO_EXTRA_MODULES ${glib-networking}/lib/gio/modules \
      --set WEBKIT_DISABLE_COMPOSITING_MODE 1
  '';

  meta = with lib; {
    description = "Visual management of your SurrealDB database";
    homepage = "https://surrealdb.com/surrealist";
    license = licenses.mit;
    mainProgram = "surrealist";
    maintainers = with maintainers; [ frankp ];
    platforms = platforms.linux;
  };
})
