cask "kiwidesk" do
  version "4.2.0"
  sha256 "be6af0dc327844a372161852a132a48d9689473c04b2bd6e3a0dcdef6bd274e7"

  url "https://github.com/KiwiCanopy/KiwiDesk/releases/download/v#{version}/KiwiDesk-#{version}.zip"
  name "KiwiDesk"
  desc "Tiling window manager with layouts, profiles, and Lua"
  homepage "https://kiwidesk.kiwicanopy.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # KiwiDesk updates itself through Sparkle. By default (Homebrew 6+)
  # `brew upgrade` upgrades it only while the installed app is older
  # than this cask, so once Sparkle has updated it brew lists nothing.
  # HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1 makes brew always skip it.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "KiwiDesk.app"
  binary "#{appdir}/KiwiDesk.app/Contents/MacOS/KiwiDesk",
         target: "kiwidesk"

  uninstall launchctl: "org.kiwidesk.KiwiDesk",
            quit:      "com.kiwicanopy.kiwidesk"

  zap trash: [
    "~/.config/KiwiDesk",
    "~/Library/Application Support/KiwiDesk",
    "~/Library/Caches/com.kiwicanopy.kiwidesk",
    "~/Library/HTTPStorages/com.kiwicanopy.kiwidesk",
    "~/Library/Preferences/com.kiwicanopy.kiwidesk.plist",
  ]
end
