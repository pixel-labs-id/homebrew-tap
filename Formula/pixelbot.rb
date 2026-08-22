class Pixelbot < Formula
  desc "Enterprise-grade live photo streaming engine for professional photographers"
  homepage "https://pixelbot.web.id"
  version "1.7.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.5/pixelbot-1.7.5-darwin-arm64.tar.gz"
      sha256 "9af4770085879cdcb75fa914e6ba0a8037cb0db0ad88f28167fa944c6f8d06c8"
    else
      url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v1.7.5/pixelbot-1.7.5-darwin-amd64.tar.gz"
      sha256 "ff7da6731c3cc94d1af062a1b09718dc0dbf630432ee437a85a65ce9c83f633a"
    end
  end

  def install
    bin.install "pixelbot"
  end

  test do
    assert_match "PixelBot", shell_output("#{bin}/pixelbot status")
  end
end
