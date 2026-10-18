cask "kiwidesk" do
  version "3.1.0"
  sha256 "6701fd3000ed366a0868523fe04e1080ede855543efa3c3efb92dbfd98f9f340"

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
