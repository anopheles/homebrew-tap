# Homebrew cask for anopheles/homebrew-tap. tools/release/cask.sh fills in
# the @...@ placeholders from a release's checksums.txt.
cask "navigo" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "98983a050074dd42ae95dd4acccbacbed3dd6b7362143f9bd85f5a1710241450",
         intel: "c6cc3280a521f7cad1b284d0ee36033a1890b95acbcc8c78af25c15e0a0a5591"

  url "https://github.com/anopheles/navigo/releases/download/v#{version}/navigo_#{version}_darwin_#{arch}.tar.gz"
  name "navigo"
  desc "Keyboard-driven terminal client for Navidrome and Subsonic servers"
  homepage "https://github.com/anopheles/navigo"

  depends_on formula: "mpv"

  binary "navigo"

  # The binary isn't notarized; without this Gatekeeper blocks it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/navigo"]
  end
end
