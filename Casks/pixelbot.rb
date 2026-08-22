cask "pixelbot" do
  version "1.7.6"
  sha256 "bd4cacb2335ea66d6d677da1a911abc5c490b2ecf6724b35042530afc5634661"

  url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.6/PixelBot-StudioPro-1.7.6-macOS-arm64.dmg"
  name "PixelBot Studio"
  desc "Live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"

  app "PixelBot Studio.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/PixelBot Studio.app"]
  end

  zap trash: [
    "~/Library/Application Support/pixelbot",
    "~/Library/Saved Application State/com.pixellabs.pixelbot.savedState",
  ]
end
