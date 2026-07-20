cask "cachewatch" do
  version "0.2.0"
  sha256 "e0687e4ed0bc9fdd44ae95c0c992cf6aec7f8e906f471ceedae1e2ceab43918c"

  url "https://github.com/fyzanshaik/cachewatch/releases/download/v#{version}/Cachewatch-#{version}-macos-arm64.zip"
  name "Cachewatch"
  desc "Fleet monitor for Claude Code sessions"
  homepage "https://github.com/fyzanshaik/cachewatch"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Cachewatch.app"
  binary "#{appdir}/Cachewatch.app/Contents/MacOS/Cachewatch", target: "cachewatch"

  zap trash: [
    "~/.cachewatch",
    "~/Library/Application Support/Cachewatch",
  ]

  caveats <<~EOS
    Launch Cachewatch once and approve it if Gatekeeper asks:
      open -a Cachewatch

    Then connect it to Claude Code's statusline (idempotent and backed up):
      cachewatch setup
  EOS
end
