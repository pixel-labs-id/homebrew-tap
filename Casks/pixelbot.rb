cask "pixelbot" do
  version "1.9.5"
  sha256 "a0013af99139fd2f5af89357c7342cf9142e53fdf049cf17eb63fc36199391de"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.9.5/PixelBot-StudioPro-1.9.5-macOS-arm64.dmg"
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
