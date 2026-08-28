cask "claudar" do
  version "1.10"
  sha256 "8f16a6b7478d4e3a901dbd1eeca1845d6371128b415f59a120480871fd01ee14"

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
    will block the first launch until you clear the quarantine flag once:

      xattr -dr com.apple.quarantine "/Applications/Claudar.app"

    (Homebrew 6 removed the --no-quarantine flag: passing it fails with
    "invalid option", and the install path no longer reads HOMEBREW_CASK_OPTS
    either, so the command above is the way to do this now.)

    Prefer not to run that? Just open Claudar, let macOS block it, then go to
    System Settings > Privacy & Security > Open Anyway. Same result, one time.

    On first launch, click "Always Allow" when macOS asks for access to the
    Claude Code credentials. That's the token the app reads to fetch your usage.
    To avoid the prompt entirely, use the app's No-Prompt Mode (menu bar).

    NOTE: the WidgetKit desktop widget is NOT in this build. It requires an App
    Group entitlement that cannot be freely distributed; build from source with
    Xcode to get it: https://github.com/jpuritz/Claudar#building-from-source
  EOS
end
