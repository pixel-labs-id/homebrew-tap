cask "pixelbot" do
  version "1.8.2"
  sha256 "5e3020d8cd6f0a09440df904318882263b8339d7f96904951b40384ce1f37bdd"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.8.2/PixelBot-StudioPro-1.8.2-macOS-arm64.dmg"
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
    "~/Library/Application Support/pixelbot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
