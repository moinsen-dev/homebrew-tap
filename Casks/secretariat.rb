cask "secretariat" do
  version "1.20.0"
  sha256 "1cb14e85dad550b13af44b2fe847468f2dd1dae16a3fbdde9da261e213fcd757"

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
