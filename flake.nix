{
  description = "Bun development environment with custom version";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Specify the Bun version you want to use
        bunVersion = "1.0.30"; # Adjust this to your desired version
        
        # Define the overlay that provides the custom Bun version
        overlays = [
          (final: prev: {
            bun = prev.bun.overrideAttrs (oldAttrs: rec {
              version = bunVersion;
              src = 
                if final.stdenv.hostPlatform.system == "x86_64-linux" then
                  final.fetchurl {
                    url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
                    # You'll need to replace this with the actual hash for your version
                    # Use `nix-prefetch-url URL` to get the hash
                    sha256 = "sha256-FSDcWHcB31x8XKmC0rHDHYALBIjIx+QYlxASMBdLXcU=";
                  }
                else if final.stdenv.hostPlatform.system == "aarch64-linux" then
                  final.fetchurl {
                    url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-aarch64.zip";
                    sha256 = "sha256-uAGIlWBaGnkGLXEHnGJEqKmXzaD7q+EkNZUkEr6kXuE=";
                  }
                else if final.stdenv.hostPlatform.system == "x86_64-darwin" then
                  final.fetchurl {
                    url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-darwin-x64.zip";
                    sha256 = "sha256-jLxRuhPp0YiZiYZV/1YSU1z7SvM5QY/qrKFTFIGNPpI=";
                  }
                else if final.stdenv.hostPlatform.system == "aarch64-darwin" then
                  final.fetchurl {
                    url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-darwin-aarch64.zip";
                    sha256 = "sha256-8S8fC7t7aRstWDvhlJe2gsYWaAvZJZqINv1sMyvmWsE=";
                  }
                else
                  throw "Unsupported system: ${final.stdenv.hostPlatform.system}";
            });
          })
        ];

        # Apply the overlay to nixpkgs
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.bun
            # Add other dependencies as needed
            pkgs.nodejs_20
            pkgs.git
          ];

          shellHook = ''
            echo "🥟 Bun development environment loaded!"
            echo "📦 Bun version: $(bun --version)"
            echo "📂 Project directory: $PWD"
            echo "🚀 To initialize a new project: bun init"
          '';
        };
      }
    );
}