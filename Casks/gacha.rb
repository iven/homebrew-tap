cask "gacha" do
  version "0.2.4"
  sha256 "07aa134d0d5a239f2b96ad8b8569755d1baa7d1af1742b93b7892d9cf5c2f210"

  url "https://github.com/iven/gacha/releases/download/v#{version}/Gacha-#{version}.dmg"
  name "Gacha"
  desc "Memory card app that keeps reviews close without interrupting work"
  homepage "https://github.com/iven/gacha"

  depends_on macos: :sequoia

  app "Gacha.app"
  binary "#{appdir}/Gacha.app/Contents/MacOS/gacha-cli", target: "gacha"

  zap trash: [
    "~/Library/Application Support/Gacha",
    "~/Library/Preferences/com.iven.gacha.plist",
    "~/Library/Preferences/Gacha.plist",
    "~/Library/Saved Application State/Gacha.savedState",
  ]

  caveats <<~EOS
    Gacha is distributed without Apple Developer ID signing or notarization.
    On first launch, macOS may say it cannot verify Gacha and offer to move it
    to the Trash. Choose Done, then open System Settings > Privacy & Security
    and click Open Anyway for Gacha.

    Launch and approve Gacha once before using the bundled CLI.
  EOS
end
