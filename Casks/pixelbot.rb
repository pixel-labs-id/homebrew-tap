cask "pixelbot" do
  version "1.8.1"
  sha256 "b270c22f74358a4bcc56f0dfbb2ab9ee78b07d86c9f3332602a5f5be82dd8761"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.8.1/PixelBot-StudioPro-1.8.1-macOS-arm64.dmg"
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
