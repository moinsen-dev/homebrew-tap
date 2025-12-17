class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.4.0/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "836cd426a98f83805349ce313081f63ad33aba0b316cf42267a142395bea18c7"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.4.0/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "48e347d1fba6585767bd48dc09079d51db1fa19cd7dd0f1022fdadd407b01583"
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
