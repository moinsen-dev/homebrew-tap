# Homebrew Tap for Moinsen Dev

This repository contains Homebrew formulae for Moinsen Dev projects.

## Installation

```bash
brew tap moinsen-dev/tap
brew install devhub
```

## Available Formulae

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
