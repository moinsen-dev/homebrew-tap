# Homebrew Tap for Moinsen Dev

This repository contains Homebrew formulae for Moinsen Dev projects.

## Installation

```bash
brew tap moinsen-dev/tap
brew install devhub
brew install secretariat
brew install agentic-rc-mcp
```

## Available Formulae

### secretariat

Local-first secrets manager — one encrypted vault, all your API keys in one place.

```bash
brew install moinsen-dev/tap/secretariat
```

**Quickstart:**
```bash
secret init              # Create your vault
secret set /prod/db-key  # Store a secret
secret get /prod/db-key  # Retrieve a secret
```

**Features:**
- AES-256-GCM encrypted vault via SQLCipher
- macOS Keychain integration for master key
- TCP daemon (`secd`) with auth-token authentication
- Python, Dart, Node.js, and Rust SDKs
- Import/export from `.env` files

For more information, visit [secretariat.moinsen.dev](https://secretariat.moinsen.dev).

### devhub

Multi-project development environment manager for macOS and Linux.

```bash
brew install moinsen-dev/tap/devhub
```

**Features:**
- Register and manage multiple development projects
- Auto-discover project types (Rust, Node.js, Python, Go, Docker, Flutter)
- Process management with port conflict detection
- Caddy reverse proxy integration
- REST API and SvelteKit dashboard

**Usage:**
```bash
# Start the daemon
devhub daemon

# Or use brew services
brew services start devhub

# Register a project
devhub register

# List projects
devhub list

# Start a project
devhub start myproject
```

For more information, visit [DevHub on GitHub](https://github.com/moinsen-dev/devhub).

### agentic-rc-mcp

MCP server for non-invasive remote control + structured observability of long-running interactive local processes.

```bash
brew install moinsen-dev/tap/agentic-rc-mcp
```

**Features:**
- PTY remote control: start, send keys, read screen, wait for patterns, resize, stop
- Flutter/Dart-VM observability: auto-discover VM service, structured error/log streams, hot reload, read-only eval
- 14 MCP tools, zero code changes in the controlled program

**Usage:**
```bash
# Start as MCP stdio server (default)
agentic-rc-mcp

# CLI inspection
agentic-rc-mcp --help
agentic-rc-mcp --version
agentic-rc-mcp --list-tools
```

For more information, visit [agentic-rc-mcp on GitHub](https://github.com/moinsen-dev/agentic_rc_cli).
