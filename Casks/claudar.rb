cask "claudar" do
  version "1.8"
  sha256 "2b051e8b10410426791a98a06bca35b4824b43b368c4dae8f0d67f52c74131f8"

  url "https://github.com/jpuritz/Claudar/releases/download/v#{version}/Claudar-menubar.zip"
  name "Claudar"
  desc "Menu bar app showing Claude usage limits"
  homepage "https://github.com/jpuritz/Claudar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Claudar.app"

  uninstall quit: "com.jpuritz.claudar"

  zap trash: [
    "~/Library/Logs/Claudar-last-error.txt",
    "~/Library/Preferences/com.jpuritz.claudar.plist",
  ]

  caveats <<~EOS
    This build is ad-hoc signed (no paid Apple Developer account), so Gatekeeper
    will block the first launch unless you either installed with:

      brew install --cask --no-quarantine jpuritz/tap/claudar

    or clear the quarantine flag once:

      xattr -dr com.apple.quarantine "/Applications/Claudar.app"

    On first launch, click "Always Allow" when macOS asks for access to the
    Claude Code credentials — the app reads that token to fetch your usage. To
    avoid that prompt entirely, use the app's No-Prompt Mode (menu bar).

    NOTE: the WidgetKit desktop widget is NOT in this build. It requires an App
    Group entitlement that cannot be freely distributed; build from source with
    Xcode to get it: https://github.com/jpuritz/Claudar#building-from-source
  EOS
end
