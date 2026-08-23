cask "pixelbot" do
  version "1.7.8"
  sha256 "0185d287291b1606d275145888b7238308cf480c0b2027ec1704de67ed7566d2"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.8/PixelBot-StudioPro-1.7.8-macOS-arm64.dmg"
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
    "~/Library/Application Support/pixelbot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
