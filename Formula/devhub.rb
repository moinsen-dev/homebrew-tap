class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.2.0/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "e31190f47dc35fea3e5c80d76eb733d673b306f2c900d0a6596f8b5d9df1ffc1"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.2.0/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "c2b0c4ff58d6e605da24c9245e8b347f1f02f20325b8aab4e7d1fc061bca9295"
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
