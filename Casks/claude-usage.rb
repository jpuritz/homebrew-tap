cask "claude-usage" do
  version "1.7"
  sha256 "da6181918f44c2919acdf50e0d4a2c5a55a179ecb9b6d47cae518bcec1a7e3e0"

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
      brew install --cask --no-quarantine jpuritz/tap/claudar
  EOS
end
