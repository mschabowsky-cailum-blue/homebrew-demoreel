# homebrew-demoreel

Homebrew tap for `demoreel-studio`, the launcher that installs and starts DemoReel Studio on your own Mac.

```sh
brew tap mschabowsky-cailum-blue/demoreel
brew trust --formula mschabowsky-cailum-blue/demoreel/demoreel-studio
brew install demoreel-studio
demoreel-studio
```

Homebrew 7 refuses formulas from third-party taps until you trust them; the `brew trust` line allows this one
formula only.

The formula installs only the launcher and the tools it needs (Node 22, pnpm, git, ffmpeg-full for burned-in captions, tesseract, uv). The
DemoReel code itself is private: the first run of `demoreel-studio` clones it into `~/.demoreel/app` with your own
GitHub access (ask Matt for read access), installs its packages, Chromium, the Kokoro voice and LibreOffice for
PowerPoint decks (about 4 GB, a few minutes), asks for your Claude API key and opens Studio in your browser.
`demoreel-studio setup --no-kokoro` or `--no-libreoffice` skips a piece.

| Command | What it does |
|---|---|
| `demoreel-studio` | Set up if needed, then start Studio and open it. |
| `demoreel-studio doctor` | Check every piece and print the fix for anything missing. |
| `demoreel-studio update` | Get the latest DemoReel and rebuild. |
| `demoreel-studio where` | Show where the checkout, renders and key live. |

This repository is generated: its source is `tap/` and `packages/launcher/` in the DemoReel repo, published with
`scripts/release-tap.sh` there. Do not edit it here.
