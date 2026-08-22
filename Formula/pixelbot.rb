class Pixelbot < Formula
  desc "Enterprise-grade live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"
  version "1.7.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.6/pixelbot-1.7.6-darwin-arm64.tar.gz"
      sha256 "fcfbd38894685546b8cd1dbd03fc4bee6c6305823e9dddd331d279910bcc91e6"
    else
      url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.6/pixelbot-1.7.6-darwin-amd64.tar.gz"
      sha256 "dbc8e97980c2df5f0a6cd9d188db16a676803a4a31bfa23e08b11184ee838219"
    end
  end

  def install
    bin.install "pixelbot"
  end

  test do
    assert_match "PixelBot", shell_output("#{bin}/pixelbot status")
  end
end
