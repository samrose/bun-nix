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
  inputs.bun-env.url = "github:owner/bun-env-flake"; # Replace with your actual repository URL
}
```

2. Enter the development shell:

```bash
nix develop
```

### Direct Usage

You can also use this flake directly without adding it to your project:

```bash
nix develop github:owner/bun-env-flake # Replace with your actual repository URL
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
