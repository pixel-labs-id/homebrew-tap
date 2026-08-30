cask "pixelbot" do
  version "1.13.0"
  sha256 "c658b339e1716e34d8321ad580cd5af01b7f16de02e5cb75e00da16a6bd26ba1"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.13.0/PixelBot-1.13.0-macOS-arm64.dmg"
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
