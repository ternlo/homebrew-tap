# Template of the Homebrew cask; scripts/release.sh fills it in and pushes it to the tap.
cask "ternlo" do
  version "0.1.4"
  sha256 "6ed4c20a72e531b2d908d1ff76a40cce920d177369ee4d36cd62ee89c06382dd"

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
