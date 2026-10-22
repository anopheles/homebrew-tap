# Homebrew cask for anopheles/homebrew-tap. tools/release/cask.sh fills in
# the @...@ placeholders from a release's checksums.txt.
cask "navigo" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm:   "6a147fb51d2af7e26ef0c7a12b5088d179098597e52e95e5c555631a53f22516",
         intel: "7638dd517cd2a299839227d56c5b86180177064d3da30adbe3956faea3e6d654"

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
