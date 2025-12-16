class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.1.0/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "3f5f72c6bc4d1fafa8aaf26cd28f46d0c71370e560559e93f454b5284d2a50b9"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.1.0/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "7936c88cade225fe2b1ee6e692badd6544198313ce467c6f8c7f41a41160b6b1"
    end
  end

  def install
    bin.install "devhub"
  end

  def caveats
    <<~EOS
      To start devhub daemon automatically:
        brew services start devhub

      Or run manually:
        devhub daemon

      Dashboard available at: http://localhost:9876
    EOS
  end

  service do
    run [opt_bin/"devhub", "daemon"]
    keep_alive true
    log_path var/"log/devhub.log"
    error_log_path var/"log/devhub.log"
  end

  test do
    system "#{bin}/devhub", "--version"
  end
end
