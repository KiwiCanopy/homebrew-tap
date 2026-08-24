cask "kiwidesk" do
  version "1.0.0"
  sha256 "fb09e3384557201ef585c96b946c27ea9313530ef1f1578affe95f880ab3d6c3"

  url "https://github.com/KiwiCanopy/KiwiDesk/releases/download/v#{version}/KiwiDesk-#{version}.zip"
  name "KiwiDesk"
  desc "Tiling window manager with layouts, profiles, and Lua"
  homepage "https://kiwidesk.kiwicanopy.com/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # KiwiDesk carries Sparkle from this version on, so the app
  # updates itself and `brew upgrade` defers to it rather than
  # racing it. Without this stanza both would own the same
  # install: Sparkle overwrites the .app and brew's manifest goes
  # stale, reporting the version it installed while a newer one
  # is on disk. `--greedy` still forces an upgrade for anyone who
  # wants brew to stay in charge.
  auto_updates true

  app "KiwiDesk.app"
  binary "#{appdir}/KiwiDesk.app/Contents/MacOS/KiwiDesk",
         target: "kiwidesk"
end
