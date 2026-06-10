class AgenticRcMcp < Formula
  desc "MCP server for non-invasive remote control + structured observability"
  homepage "https://github.com/moinsen-dev/agentic_rc_cli"
  url "https://github.com/moinsen-dev/agentic_rc_cli/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "8b6c80b1f33cbd786b93797a45d8bf6ea62a3436ae9abfb441cf241bcc96f010"
  license "MIT"

  depends_on "node"

  def install
    # Install production + dev dependencies (devDeps needed for tsc build)
    system "npm", "install"

    # Build TypeScript → dist/
    system "npm", "run", "build"

    # Remove dev-only files to save space
    rm_rf "test"
    rm_rf "scripts"
    rm_rf "docs"
    rm_rf "flutter_example"
    rm_rf "src"

    # Install everything into libexec
    libexec.install Dir["*"]

    # Create a tiny shell wrapper that calls node + dist/index.js
    (bin/"agentic-rc-mcp").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/index.js" "$@"
    EOS
  end

  test do
    output = shell_output("#{bin}/agentic-rc-mcp --version 2>&1", 1)
    assert_match "agentic-rc-mcp v0.7.1", output
  end
end
