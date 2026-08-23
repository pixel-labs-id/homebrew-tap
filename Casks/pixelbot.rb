cask "pixelbot" do
  version "1.8.3"
  sha256 "571074afdde31a41a98b4de45c17305fbb08a4d6bb4a29f4f9854487a73cf7c5"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.8.3/PixelBot-StudioPro-1.8.3-macOS-arm64.dmg"
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
