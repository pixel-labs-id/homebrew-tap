cask "pixelbot" do
  version "1.10.0"
  sha256 "bbc2252cec7e7045bc961ffc6e96de97990daf79a733ddfb136d5077ccb59fb3"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.10.0/PixelBot-StudioPro-1.10.0-macOS-arm64.dmg"
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
