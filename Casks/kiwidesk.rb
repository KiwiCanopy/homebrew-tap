cask "kiwidesk" do
  version "4.1.0"
  sha256 "58bca3f223c0d22d35409e1c37f6883e41a8cf891eaf072f34e0d0aec925aa52"

  url "https://github.com/KiwiCanopy/KiwiDesk/releases/download/v#{version}/KiwiDesk-#{version}.zip"
  name "KiwiDesk"
  desc "Tiling window manager with layouts, profiles, and Lua"
  homepage "https://kiwidesk.kiwicanopy.com/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # KiwiDesk updates itself through Sparkle. Since Homebrew 6,
  # `brew upgrade` still upgrades it when the installed app is older
  # than this cask, and skips it once Sparkle has caught up; set
  # HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1 to leave it to Sparkle.
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
