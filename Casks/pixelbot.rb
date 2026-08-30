cask "pixelbot" do
  version "1.14.0"
  sha256 "df7c0c546967a04648fc4e144753f1712b763816b39eb7c5aa685fb9e73f273f"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.14.0/PixelBot-1.14.0-macOS-arm64.dmg"
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
