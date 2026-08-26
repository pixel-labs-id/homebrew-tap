cask "pixelbot" do
  version "1.9.2"
  sha256 "f6ba85b814c902ac4280cace8d60f2de67cb312f12e2f9e349caa348360b7835"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.2/PixelBot-StudioPro-1.9.2-macOS-arm64.dmg"
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
