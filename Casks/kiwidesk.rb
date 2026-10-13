cask "kiwidesk" do
  version "2.3.1"
  sha256 "49b63263bbf2ebbcef9e7f62e5a390cf2fc47bdaa9457714025fbb2aa3b5ba30"

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
