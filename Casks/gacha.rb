cask "gacha" do
  version "0.2.0"
  sha256 "8eb156af8b1a35b3764b3493f414dbd6997f2d441f6e391d424d9f01a770d92a"

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
