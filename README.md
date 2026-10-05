# homebrew-demoreel

Homebrew tap for `demoreel-studio`, the launcher that installs and starts DemoReel Studio on your own Mac.

```sh
brew install mschabowsky-cailum-blue/demoreel/demoreel-studio
demoreel-studio
```

The formula installs only the launcher and the tools it needs (Node 22, pnpm, git, ffmpeg, tesseract, uv). The
DemoReel code itself is private: the first run of `demoreel-studio` clones it into `~/.demoreel/app` with your own
GitHub access (ask Matt for read access), installs its packages, Chromium and the Kokoro voice (about 3 GB, a few
minutes), asks for your Claude API key and opens Studio in your browser.

| Command | What it does |
|---|---|
| `demoreel-studio` | Set up if needed, then start Studio and open it. |
| `demoreel-studio doctor` | Check every piece and print the fix for anything missing. |
| `demoreel-studio update` | Get the latest DemoReel and rebuild. |
| `demoreel-studio where` | Show where the checkout, renders and key live. |

LibreOffice is needed only for a PowerPoint file without a PDF beside it: `brew install --cask libreoffice`.

This repository is generated: its source is `tap/` and `packages/launcher/` in the DemoReel repo, published with
`scripts/release-tap.sh` there. Do not edit it here.
