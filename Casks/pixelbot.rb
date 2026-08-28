cask "pixelbot" do
  version "1.12.2"
  sha256 "0fdb1c5c205cf3c26a6e8cc20aeed36754877606b48ede1a7d9487dc5fbe4b8b"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.12.2/PixelBot-1.12.2-macOS-arm64.dmg"
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
