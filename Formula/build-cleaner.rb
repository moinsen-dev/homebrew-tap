class BuildCleaner < Formula
  desc "Clean build artifacts and caches across multiple ecosystems"
  homepage "https://github.com/moinsen-dev/build_cleaner"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.3.0/build-cleaner-aarch64-apple-darwin.tar.gz"
      sha256 "9cbe2d3f737768bb60215aad28244d8a4cda3b354e8f487beac2bd14346bb02a"
    end
    on_intel do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.3.0/build-cleaner-x86_64-apple-darwin.tar.gz"
      sha256 "8e71b4925b4dfe2bf0946f2c73d8a3f1511425107c0c322f821c32f455150cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.3.0/build-cleaner-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cc1c2376788e10f7771424b486c7e8f8564e606c9ea1ab059e15376bbd6e6ea"
    end
    on_intel do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.3.0/build-cleaner-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c98da37b1f7e257540aa9503d3604c86c9443d069592d4586bca444ae2106901"
    end
  end

  def install
    bin.install "build-cleaner"
  end

  test do
    system "#{bin}/build-cleaner", "--version"
  end
end
