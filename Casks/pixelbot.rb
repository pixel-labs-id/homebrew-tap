cask "pixelbot" do
  version "1.8.4"
  sha256 "727e682c4cdc965a5f25e86f81560069ea3b46665f84d464c9b91ad82eba8650"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.8.4/PixelBot-StudioPro-1.8.4-macOS-arm64.dmg"
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
