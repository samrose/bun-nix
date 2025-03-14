# Bun Development Environment Flake

A Nix flake that provides a development environment with a customizable version of Bun, Node.js 20, and Git. This flake supports multiple platforms including Linux (x86_64, aarch64) and macOS (x86_64, aarch64).

## Features

- Customizable Bun version (currently set to 1.0.30)
- Node.js 20
- Git
- Cross-platform support
- Friendly shell welcome message

## Prerequisites

- Nix with flakes enabled
- Git (for fetching the flake)

## Usage

### Quick Start

1. Add this flake to your project:

```nix
{
  inputs.bun-env.url = "github:samrose/bun-nix"; # Replace with your actual repository URL
}
```

2. Enter the development shell:

```bash
nix develop
```

### Direct Usage

You can also use this flake directly without adding it to your project:

```bash
nix develop github:samrose/bun-nix # Replace with your actual repository URL
```

## Customization

To change the Bun version, modify the `bunVersion` variable in `flake.nix`:

```nix
bunVersion = "1.0.30"; # Change to your desired version
```

## Supported Platforms

- Linux x86_64
- Linux aarch64
- macOS x86_64
- macOS aarch64 (Apple Silicon)

## Updating Bun Version and Hashes

When updating the Bun version, you'll need to update the corresponding SHA256 hashes for each platform. Here's how:

1. First, update the `bunVersion` in `flake.nix`
2. Then, get the new hashes using `nix-prefetch-url`. For example:

```bash
# For Linux x86_64
nix-prefetch-url https://github.com/oven-sh/bun/releases/download/bun-v1.0.30/bun-linux-x64.zip

# For Linux aarch64
nix-prefetch-url https://github.com/oven-sh/bun/releases/download/bun-v1.0.30/bun-linux-aarch64.zip

# For macOS x86_64
nix-prefetch-url https://github.com/oven-sh/bun/releases/download/bun-v1.0.30/bun-darwin-x64.zip

# For macOS aarch64
nix-prefetch-url https://github.com/oven-sh/bun/releases/download/bun-v1.0.30/bun-darwin-aarch64.zip
```

3. Replace the corresponding `sha256` values in `flake.nix` with the new hashes
4. Remember to prefix the hashes with `sha256-` and suffix with `=` in the flake

Example:
```nix
sha256 = "sha256-${hash}=";
```
