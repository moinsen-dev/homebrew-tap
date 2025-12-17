class Devhub < Formula
  desc "Multi-project development environment manager"
  homepage "https://github.com/moinsen-dev/devhub"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.4.0/devhub-aarch64-apple-darwin.tar.gz"
      sha256 "021402d3cf78849bba97e2b796795697a05f05c9cd2f440545065c28e959a9a3"
    else
      url "https://github.com/moinsen-dev/devhub/releases/download/v0.4.0/devhub-x86_64-apple-darwin.tar.gz"
      sha256 "2285772a567413bf84f812740ca94abedaf21544ece5c1f0dc85b805a9a97c65"
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
