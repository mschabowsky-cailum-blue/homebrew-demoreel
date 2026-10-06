# frozen_string_literal: true

# Launcher for DemoReel Studio on a colleague's own Mac (DR-64, docs/standalone/spec.md in the DemoReel repo).
# The source of truth is the DemoReel repo (tap/ and packages/launcher/); scripts/release-tap.sh there copies the
# launcher in, sets the version and writes the checksum. The formula never contains or downloads the private repo.
class DemoreelStudio < Formula
  desc "Installs, updates and starts DemoReel Studio from the private DemoReel repo"
  homepage "https://github.com/mschabowsky-cailum-blue/homebrew-demoreel"
  url "https://github.com/mschabowsky-cailum-blue/homebrew-demoreel/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6d2b1ac2ffacc76c1451a1b676b5c70a1a528d67812304eaab1e6e6a85bed798"
  license :cannot_represent

  depends_on "ffmpeg-full"
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
      access), installs its packages and Chromium, sets up the Kokoro voice and installs
      LibreOffice for PowerPoint decks: about 4 GB and a few minutes. It then asks for your
      Claude API key and opens Studio in your browser. Skip pieces with
      `demoreel-studio setup --no-kokoro` or `--no-libreoffice`.

      `demoreel-studio doctor` checks everything; `demoreel-studio update` gets the latest version.
    EOS
  end

  test do
    assert_match "demoreel-studio #{version}", shell_output("#{bin}/demoreel-studio version")
  end
end
