cask "pixelbot" do
  version "1.9.3"
  sha256 "55cfedc8e95f3e4332e9794744d2874e507592a4b06ca8f07141443b1882c472"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.3/PixelBot-StudioPro-1.9.3-macOS-arm64.dmg"
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
