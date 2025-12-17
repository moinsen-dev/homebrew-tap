class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.3.0/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "f5618ab1235468bb90751feb23cbbf837e6747306ed6490deed68b36721f87d2"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.3.0/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "07b2fad0436de5f80dbfddc18e14863ec758e9fe80565a427d8ecc3d6ddf96be"
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
