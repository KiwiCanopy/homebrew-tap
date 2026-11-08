cask "kiwidesk" do
  version "4.2.1"
  sha256 "41328daa0adff09d8b121b727b9c67754bc384d6880837312d4ca3f0e3b2bea7"

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
