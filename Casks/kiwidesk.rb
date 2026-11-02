cask "kiwidesk" do
  version "4.1.0"
  sha256 "58bca3f223c0d22d35409e1c37f6883e41a8cf891eaf072f34e0d0aec925aa52"

  url "https://github.com/KiwiCanopy/KiwiDesk/releases/download/v#{version}/KiwiDesk-#{version}.zip"
  name "KiwiDesk"
  desc "Tiling window manager with layouts, profiles, and Lua"
  homepage "https://kiwidesk.kiwicanopy.com/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # KiwiDesk updates itself through Sparkle. By default (Homebrew 6+)
  # `brew upgrade` upgrades it only while the installed app is older
  # than this cask, so once Sparkle has updated it brew lists nothing.
  # HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1 makes brew always skip it.
  auto_updates true

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
