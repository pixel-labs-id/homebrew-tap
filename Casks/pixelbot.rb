cask "pixelbot" do
  version "1.11.0"
  sha256 "997f2a923aa5d6f039f3965ba775dfcd0338bf8b059bd7b4f7a1feff82c3b596"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.11.0/PixelBot-StudioPro-1.11.0-macOS-arm64.dmg"
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
