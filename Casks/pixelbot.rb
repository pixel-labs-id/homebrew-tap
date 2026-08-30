cask "pixelbot" do
  version "1.13.0"
  sha256 "6b2e06ae4a89572402b899181217173d2dd845e2afb66883412011f6148db9a6"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.13.0/PixelBot-1.13.0-macOS-arm64.dmg"
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
