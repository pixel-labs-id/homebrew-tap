cask "pixelbot" do
  version "1.8.0"
  sha256 "827ddda45cd7967e06f395bd58071567cbe1ff6188bae04004e0e9601195f55c"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.8.0/PixelBot-StudioPro-1.8.0-macOS-arm64.dmg"
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
