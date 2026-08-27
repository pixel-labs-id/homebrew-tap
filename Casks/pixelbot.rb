cask "pixelbot" do
  version "1.11.0"
  sha256 "1f991fda86e29a5d335773302f0c06cd2a5a03196eca7e6e3b5832d799b3cb09"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.11.0/PixelBot-1.11.0-macOS-arm64.dmg"
  name "PixelBot"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"

  app "PixelBot.app"
  binary "#{appdir}/PixelBot.app/Contents/MacOS/pixelbot-gui", target: "pixelbot"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/PixelBot.app"]
  end

  zap trash: [
    "~/Library/Application Support/PixelBot",
    "~/Library/Application Support/pixelbot",
    "~/Library/Logs/PixelBot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
