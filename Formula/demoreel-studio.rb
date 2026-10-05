# frozen_string_literal: true

# Launcher for DemoReel Studio on a colleague's own Mac (DR-64, docs/standalone/spec.md in the DemoReel repo).
# The source of truth is the DemoReel repo (tap/ and packages/launcher/); scripts/release-tap.sh there copies the
# launcher in, sets the version and writes the checksum. The formula never contains or downloads the private repo.
class DemoreelStudio < Formula
  desc "Installs, updates and starts DemoReel Studio from the private DemoReel repo"
  homepage "https://github.com/mschabowsky-cailum-blue/homebrew-demoreel"
  url "https://github.com/mschabowsky-cailum-blue/homebrew-demoreel/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ca75bb7d8bc126edce41edcb6d1d4bb085b035515f5cb610c64eda064d8b77f5"
  license :cannot_represent

  depends_on "ffmpeg"
  depends_on "git"
  depends_on :macos
  depends_on "node@22"
  depends_on "pnpm"
  depends_on "tesseract"
  depends_on "uv"

  def install
    bin.install "bin/demoreel-studio"
  end

  def caveats
    <<~EOS
      Run `demoreel-studio` to finish the install and start Studio. The first run clones the
      private DemoReel repo into ~/.demoreel/app with your own GitHub access (ask Matt for read
      access), installs its packages and Chromium, and sets up the Kokoro voice: about 3 GB and
      a few minutes. It then asks for your Claude API key and opens Studio in your browser.

      `demoreel-studio doctor` checks everything; `demoreel-studio update` gets the latest version.

      LibreOffice is needed only for a PowerPoint file without a PDF beside it:
        brew install --cask libreoffice
    EOS
  end

  test do
    assert_match "demoreel-studio #{version}", shell_output("#{bin}/demoreel-studio version")
  end
end
