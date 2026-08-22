class Pixelbot < Formula
  desc "Enterprise-grade live photo streaming engine for professional photographers"
  homepage "https://fotoyu.com"
  version "1.4.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pixel-labs-id/pixelbot/releases/download/v1.4.4/pixelbot-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/pixel-labs-id/pixelbot/releases/download/v1.4.4/pixelbot-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "pixelbot"
  end

  test do
    assert_match "PixelBot", shell_output("#{bin}/pixelbot status")
  end
end
