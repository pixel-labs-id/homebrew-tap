cask "pixelbot" do
  version "1.15.0"
  sha256 "5601f05c6cc99a8ddd205e50f5f20e8e8fc3c66df9b00f6e463c5ea5a9b17133"

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
