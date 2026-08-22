cask "pixelbot" do
  version "1.4.4"
  sha256 :no_check

  url "https://github.com/pixel-labs-id/pixelbot/releases/download/v1.4.4/PixelBot_#{version}_darwin_universal.dmg"
  name "PixelBot"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://fotoyu.com"

  app "PixelBot.app"

  zap trash: [
    "~/Library/Application Support/pixelbot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
