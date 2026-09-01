cask "pixelbot" do
  version "1.16.0"
  sha256 "e322f8b642a5510276188c2e00e030823de9a90455adf002cd0dd77a777747ce"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v#{version}/PixelBot-#{version}-macOS-arm64.dmg"
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
