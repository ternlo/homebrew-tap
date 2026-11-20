# Template of the Homebrew cask; scripts/release.sh fills it in and pushes it to the tap.
cask "ternlo" do
  version "0.1.0"
  sha256 "e6be9b0c8da4c515b9d65357dbe54ba9b6fb64aca9c51481e762ae21ce68e5af"

  url "https://github.com/ternlo/releases/releases/download/v#{version}/Ternlo_#{version}_aarch64.dmg"
  name "Ternlo"
  desc "Records, transcribes and summarises meetings locally"
  homepage "https://github.com/ternlo/releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Ternlo updates itself (Settings → About → Updates).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Ternlo.app"

  # The meeting library in ~/Library/Application Support/com.ternlo.macos is kept.
  zap trash: [
    "~/Library/Caches/com.ternlo.macos",
    "~/Library/HTTPStorages/com.ternlo.macos",
    "~/Library/Preferences/com.ternlo.macos.plist",
    "~/Library/Saved Application State/com.ternlo.macos.savedState",
    "~/Library/WebKit/com.ternlo.macos",
  ]
end
