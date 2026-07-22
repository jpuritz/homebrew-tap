cask "claude-usage" do
  version "1.2"
  sha256 "56460c160baee10eb4e85835b7b2bde658694388c5b2e36ff2a3bcecd7998d67"

  url "https://github.com/jpuritz/ClaudeUsageBar/releases/download/v#{version}/ClaudeUsage-menubar.zip"
  name "Claude Usage"
  desc "Menu bar app showing Claude usage limits"
  homepage "https://github.com/jpuritz/ClaudeUsageBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Claude Usage.app"

  uninstall quit: "com.jpuritz.claude-usage"

  zap trash: [
    "~/Library/Logs/ClaudeUsage-last-error.txt",
    "~/Library/Preferences/com.jpuritz.claude-usage.plist",
  ]

  caveats <<~EOS
    This build is ad-hoc signed (no paid Apple Developer account), so Gatekeeper
    will block the first launch unless you either installed with:

      brew install --cask --no-quarantine jpuritz/tap/claude-usage

    or clear the quarantine flag once:

      xattr -dr com.apple.quarantine "/Applications/Claude Usage.app"

    On first launch, click "Always Allow" when macOS asks for access to the
    Claude Code credentials — the app reads that token to fetch your usage.

    NOTE: the WidgetKit desktop widget is NOT in this build. It requires an App
    Group entitlement that cannot be freely distributed; build from source with
    Xcode to get it: https://github.com/jpuritz/ClaudeUsageBar#building
  EOS
end
