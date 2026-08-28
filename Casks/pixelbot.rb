cask "pixelbot" do
  version "1.12.2"
  sha256 "dddb160d35fdff2abebd847b4c138fa4066f0f321661bfcc2db2f905a3c21392"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.12.2/PixelBot-1.12.2-macOS-arm64.dmg"
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
