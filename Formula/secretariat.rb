class Secretariat < Formula
  desc "Local-first secrets manager — one encrypted vault, all your API keys in one place"
  homepage "https://secretariat.moinsen.dev"
  version "0.1.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/secretariat/releases/download/v0.1.1/secretariat-darwin-arm64.tar.gz"
      sha256 "8000a687a416f8fed3990fcf5bd7c90edfecbab9aa75b0cf3d7edb0cb6af9f67"
    else
      url "https://github.com/moinsen-dev/secretariat/releases/download/v0.1.1/secretariat-darwin-x86_64.tar.gz"
      sha256 "bca90696f9f9307416b644b0145c2723aa94e633ec1ee7900a3cc55cd49a8162"
    end
  end

  def install
    bin.install "secd"
    bin.install "sec"
  end

  def caveats
    <<~EOS
      To get started:

        secret init          # Initialize your vault
        secret set /prod/db  # Store a secret
        secret get /prod/db  # Retrieve a secret

      The daemon runs automatically on demand. For background service:

        brew services start secretariat

      Or manually:

        secd
    EOS
  end

  service do
    run [opt_bin/"secd"]
    keep_alive true
    log_path var/"log/secretariat.log"
    error_log_path var/"log/secretariat.log"
  end

  test do
    system "#{bin}/sec", "--version"
  end
end
