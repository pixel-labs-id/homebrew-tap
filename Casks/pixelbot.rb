cask "pixelbot" do
  version "1.7.7"
  sha256 "d08154676f3ea0fca415efd429a9969df04418112c7f28d62b61ce37eb352fed"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.7/PixelBot-StudioPro-1.7.7-macOS-arm64.dmg"
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
