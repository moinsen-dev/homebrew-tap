cask "secretariat" do
  version "1.21.0"
  sha256 "a18b957059339666b51d113995a60319e5b5c033ed00635de0eb405a9cdabc44"

  url "https://secretariat.moinsen.dev/Secretariat-#{version}.zip"
  name "Secretariat"
  desc "Keeps API keys for coding agents: they use your keys without reading them"
  homepage "https://secretariat.moinsen.dev/"

  livecheck do
    url "https://secretariat.moinsen.dev/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Secretariat.app"
  binary "#{appdir}/Secretariat.app/Contents/MacOS/Secretariat", target: "secretariat"

  caveats <<~EOS
    Open Secretariat once to set it up. The command line tool is `secretariat`;
    Claude Code and Codex start your programs with `secretariat run PROFILE -- COMMAND`.
    14 days to try everything, then a license: https://secretariat.moinsen.dev/#pricing
  EOS
end
