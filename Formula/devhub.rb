class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.3.1/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "78d8ba34b7ee85b7841e1561c10e47bdecb0d0edefde883ee03a4095a7b60578"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.3.1/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "1eebb27852fbf9bda25b37829627347f9273b9d307e36919d23c1ebd6c336de2"
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
