cask "pixelbot" do
  version "1.10.1"
  sha256 "bb45d98a62734688eb22dacfa1495be55807fea0c550770b248a823cf66a6f26"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.10.1/PixelBot-StudioPro-1.10.1-macOS-arm64.dmg"
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
