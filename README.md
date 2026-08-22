# PixelLabs Homebrew Tap 🍺

Official Homebrew Tap for **PixelBot** — the ultra-fast live photo streaming engine for professional event and sports photographers.

## 📦 Installation

### Option 1: CLI Daemon (Headless)
```bash
# Install PixelBot CLI
brew install pixel-labs-id/tap/pixelbot
```

### Option 2: Desktop GUI Application (.app)
```bash
# Install PixelBot Studio Desktop App
brew install --cask pixel-labs-id/tap/pixelbot
```

---

## ⚡ Quick Start (CLI)

```bash
# Check system and pipeline status
pixelbot status

# Start live photo stream
pixelbot start --folder /Volumes/SD_CARD --tag EVENT_TAG --price 25000

# Run in simulation mode (offline demo)
pixelbot start --simulation
```

---

## 🔄 Updating
```bash
brew update
brew upgrade pixelbot
```
