class BuildCleaner < Formula
  desc "Clean build artifacts and caches across multiple ecosystems"
  homepage "https://github.com/moinsen-dev/build_cleaner"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.4.0/build-cleaner-aarch64-apple-darwin.tar.gz"
      sha256 "eb4a4373210212ce7e949a96229a4585babef7142079d9b50acbc242a8bff59c"
    end
    on_intel do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.4.0/build-cleaner-x86_64-apple-darwin.tar.gz"
      sha256 "c1c06815d8dde619ea260e71d89d2a80abf30accc1682bf6562ed25fc21d58a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.4.0/build-cleaner-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bd6ac380f9aecc62979e8000dbd24a1d12f85a6c92514452c2ab5b06eb0c50e"
    end
    on_intel do
      url "https://github.com/moinsen-dev/build_cleaner/releases/download/v0.4.0/build-cleaner-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82ae70ce3413ac45035d87be533458f914f4c956db61bc8e7078fe45d559619b"
    end
  end

  def install
    bin.install "build-cleaner"
  end

  test do
    system "#{bin}/build-cleaner", "--version"
  end
end
