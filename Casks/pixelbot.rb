cask "pixelbot" do
  version "1.12.0"
  sha256 "9a8b61e50eac3790bacfbcaed6e9702b1acd8ec193391b26abf50a51ab2fefd8"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.12.0/PixelBot-1.12.0-macOS-arm64.dmg"
  name "PixelBot"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"

  app "PixelBot.app"
  binary "#{appdir}/PixelBot.app/Contents/MacOS/pixelbot-gui", target: "pixelbot"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/PixelBot.app"]
  end

  zap trash: [
    "~/Library/Application Support/PixelBot",
    "~/Library/Application Support/pixelbot",
    "~/Library/Logs/PixelBot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
