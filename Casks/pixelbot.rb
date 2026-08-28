cask "pixelbot" do
  version "1.12.1"
  sha256 "0a485a0339788ab63c8de37fffc01dafda8daeab179b39b54f1b45f15389802d"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.12.1/PixelBot-1.12.1-macOS-arm64.dmg"
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
