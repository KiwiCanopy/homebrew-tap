cask "kiwidesk" do
  version "0.9.2"
  sha256 "860b11f9464d9f1dfb5424e1087d48bc0dc474d878530e7a5b5ac0ffab323287"

  url "https://github.com/KiwiCanopy/KiwiDesk/releases/download/v#{version}/KiwiDesk-#{version}.zip"
  name "KiwiDesk"
  desc "Tiling window manager with layouts, profiles, and Lua"
  homepage "https://kiwidesk.kiwicanopy.com/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "KiwiDesk.app"
  binary "#{appdir}/KiwiDesk.app/Contents/MacOS/KiwiDesk",
         target: "kiwidesk"
end
