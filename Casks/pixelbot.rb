cask "pixelbot" do
  version "1.9.1"
  sha256 "17c81ff48749d8ab95ec379ac46eb6f7b244ca40bbe7e957f25ac3cccf8a9608"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.1/PixelBot-StudioPro-1.9.1-macOS-arm64.dmg"
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
