cask "pixelbot" do
  version "1.9.4"
  sha256 "13da975d7a0838631504d11ce46c72ce0743af0f29ce1d08d0e0b428b1c447cd"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.4/PixelBot-StudioPro-1.9.4-macOS-arm64.dmg"
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
