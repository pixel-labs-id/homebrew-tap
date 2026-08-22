# 🚀 Homebrew Release Guide for PixelBot

> **Standard Operating Procedure (SOP)** for packaging and publishing new versions of PixelBot Studio (Cask) and PixelBot CLI Daemon (Formula) to Homebrew.

---

## 📌 Prerequisites

Ensure you have the following installed on your machine:
- **Go 1.23+**
- **Wails v2 CLI** (`wails version`)
- **GitHub CLI** (`gh auth status`)
- Dependencies for DMG dynamic library bundling (`libvips`, `jpeg-turbo`)

---

## 🛠️ Step-by-Step Release Workflow

### 1. Tag & Build Binaries in `pixel-bot`
```bash
cd /Users/ramza/Code/personal/pixel-labs-id/pixel-bot

# Set the target version
export VERSION="1.7.6"

# Build all release binaries (Desktop GUI DMG + PureGo CLI Slim)
make release-all VERSION=$VERSION

# Package CLI binaries into standard tar.gz archives
cd dist
mkdir -p tmp_arm64 tmp_amd64
cp PixelBot-Slim-$VERSION-darwin-arm64 tmp_arm64/pixelbot
cp PixelBot-Slim-$VERSION-darwin-amd64 tmp_amd64/pixelbot
tar -czvf pixelbot-$VERSION-darwin-arm64.tar.gz -C tmp_arm64 pixelbot
tar -czvf pixelbot-$VERSION-darwin-amd64.tar.gz -C tmp_amd64 pixelbot
rm -rf tmp_arm64 tmp_amd64
cd ..
```

---

### 2. Calculate SHA256 Checksums
```bash
shasum -a 256 dist/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg
shasum -a 256 dist/pixelbot-$VERSION-darwin-arm64.tar.gz
shasum -a 256 dist/pixelbot-$VERSION-darwin-amd64.tar.gz
```

---

### 3. Create GitHub Release in `homebrew-tap`
```bash
gh release create v$VERSION \
  dist/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg \
  dist/pixelbot-$VERSION-darwin-arm64.tar.gz \
  dist/pixelbot-$VERSION-darwin-amd64.tar.gz \
  --repo pixel-labs-id/homebrew-tap \
  --title "PixelBot Studio v$VERSION" \
  --notes "## 🚀 PixelBot Studio & CLI Daemon v$VERSION

### 💎 Highlights:
- Release notes for version $VERSION..."
```

---

### 4. Update Formulas & Casks in `homebrew-tap`
```bash
cd /Users/ramza/Code/personal/pixel-labs-id/homebrew-tap

# 1. Update Casks/pixelbot.rb:
#    - version "$VERSION"
#    - sha256 "<DMG_SHA256>"
#    - url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v$VERSION/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg"

# 2. Update Formula/pixelbot.rb:
#    - version "$VERSION"
#    - arm64 sha256 "<ARM64_SHA256>"
#    - amd64 sha256 "<AMD64_SHA256>"
#    - urls pointing to v$VERSION

git add Casks/pixelbot.rb Formula/pixelbot.rb
git commit -m "release: v$VERSION formula and cask checksums"
git push origin main
```

---

### 5. Verification & Testing
```bash
# Update local brew tap index
brew update

# Upgrade existing CLI installation
brew upgrade pixelbot

# Or install Desktop GUI Cask
brew install --cask pixel-labs-id/tap/pixelbot
```
