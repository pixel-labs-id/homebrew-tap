cask "pixelbot" do
  version "1.7.5"
  sha256 "af147974532427e29272162c6383ee1ffa49d51650fc78e16a84b9bb868eb1ba"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.5/PixelBot-StudioPro-1.7.5-macOS-arm64.dmg"
  name "PixelBot Studio"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://fotoyu.com"

  app "PixelBot Studio.app"

  zap trash: [
    "~/Library/Application Support/pixelbot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
