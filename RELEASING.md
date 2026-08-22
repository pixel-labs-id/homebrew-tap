# 🚀 Homebrew Release Guide for PixelBot (Unified Single-Package)

> **Standard Operating Procedure (SOP)** for releasing PixelBot Studio (Desktop GUI + CLI Daemon) via Homebrew Cask.

---

## 📌 Unified Architecture Overview

PixelBot uses a **Single Unified Package**:
- The Cask (`Casks/pixelbot.rb`) installs **`PixelBot Studio.app`** into `/Applications` AND automatically symlinks the binary into `/opt/homebrew/bin/pixelbot` (or `/usr/local/bin/pixelbot`).
- **One package delivers both Desktop GUI and Terminal CLI!**
- Users only need to run:
  ```bash
  brew install --cask pixel-labs-id/tap/pixelbot
  # or
  brew upgrade pixelbot
  ```

---

## 🛠️ Step-by-Step Release Workflow

### 1. Build Studio Pro Release DMG in `pixel-bot`
```bash
cd /Users/ramza/Code/personal/pixel-labs-id/pixel-bot

# Set the target version
export VERSION="1.7.6"

# Build Studio Pro DMG with embedded libvips dylibs
make release-pro VERSION=$VERSION
```

---

### 2. Calculate SHA256 Checksum
```bash
shasum -a 256 dist/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg
```

---

### 3. Create GitHub Release in `homebrew-tap`
```bash
gh release create v$VERSION \
  dist/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg \
  --repo pixel-labs-id/homebrew-tap \
  --title "PixelBot Studio v$VERSION" \
  --notes "## 🚀 PixelBot Studio & CLI Daemon v$VERSION

### 💎 Highlights:
- Release notes for version $VERSION..."
```

---

### 4. Update Cask in `homebrew-tap`
```bash
cd /Users/ramza/Code/personal/pixel-labs-id/homebrew-tap

# Update Casks/pixelbot.rb:
# - version "$VERSION"
# - sha256 "<DMG_SHA256>"
# - url "https://github.com/pixel-labs-id/homebrew-tap/releases/download/v$VERSION/PixelBot-StudioPro-$VERSION-macOS-arm64.dmg"

git add Casks/pixelbot.rb
git commit -m "release: v$VERSION cask checksum"
git push origin main
```

---

### 5. Verification & Testing
```bash
brew update
brew upgrade pixelbot
```
