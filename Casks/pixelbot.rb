cask "pixelbot" do
  version "1.9.0"
  sha256 "9483d422c9f6054e4144c24e3745d4f06a5d15dc777904ae337ec5d4148f07cb"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.0/PixelBot-StudioPro-1.9.0-macOS-arm64.dmg"
  name "PixelBot Studio"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"

  app "PixelBot Studio.app"
  binary "#{appdir}/PixelBot Studio.app/Contents/MacOS/pixelbot-gui", target: "pixelbot"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/PixelBot Studio.app"]
  end

  zap trash: [
    "~/Library/Application Support/PixelBot",
    "~/Library/Application Support/pixelbot",
    "~/Library/Logs/PixelBot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
