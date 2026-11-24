# Template of the Homebrew cask; scripts/release.sh fills it in and pushes it to the tap.
cask "ternlo" do
  version "0.1.3"
  sha256 "8ee67648d823566a2ea4e2765feb19b480483438bac40fb9fc1312537e7f38f1"

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
