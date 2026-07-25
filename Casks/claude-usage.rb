cask "claude-usage" do
  version "1.8"
  sha256 "2b051e8b10410426791a98a06bca35b4824b43b368c4dae8f0d67f52c74131f8"

  url "https://github.com/jpuritz/Claudar/releases/download/v#{version}/Claudar-menubar.zip"
  name "Claudar"
  desc "Menu bar app showing Claude usage limits (renamed to claudar)"
  homepage "https://github.com/jpuritz/Claudar"

  # Renamed to "claudar". This token keeps existing installs upgrading; new
  # installs should use `brew install --cask jpuritz/tap/claudar`.
  deprecate! date: "2026-07-24", because: "it was renamed to claudar"

  conflicts_with cask: "jpuritz/tap/claudar"
  depends_on macos: :sonoma

  app "Claudar.app"

  uninstall quit: "com.jpuritz.claudar"

  caveats <<~EOS
    This cask was renamed to "claudar". Switch with:

      brew uninstall --cask claude-usage
      brew install --cask jpuritz/tap/claudar
      xattr -dr com.apple.quarantine "/Applications/Claudar.app"
  EOS
end
