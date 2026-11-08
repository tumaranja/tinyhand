# TinyHand (tumaranja fork)

Fork of [nilbuild/tinyhand](https://github.com/nilbuild/tinyhand), a macOS menu bar app (Swift, AppKit, SwiftPM) that shows a hand on a stick as the pointer. MIT: keep the original copyright line in LICENSE.

- Remotes: `origin` = tumaranja/tinyhand (ours), `upstream` = nilbuild/tinyhand (the creators). Never push to `upstream`. Pull their updates with `git fetch upstream && git merge upstream/main`.
- Build: `swift build` (needs full Xcode or a working Command Line Tools; `scripts/build-app.sh` makes the signed .app).
- Tap motion: `ArmView.swing(at:)` in `Sources/TinyHand/ArmView.swift`. The prototype in `prototypes/tap-motion/` mirrors it; change both together, and re-record `.github/tap-motion.gif` (below) when the motion changes.
- Re-record the GIF: run `python3 prototypes/tap-motion/record_server.py`, open http://localhost:8766/prototypes/tap-motion/?record, run `await recordFrames()` in the console (GitHub dark background #0d1117 by default, no cards, so it sits seamlessly in the README; frames land in `prototypes/tap-motion/frames/`), then from that folder:
  `ffmpeg -y -framerate 25 -i %04d.png -vf "scale=680:-1:flags=lanczos,split[a][b];[a]palettegen=stats_mode=diff[p];[b][p]paletteuse=dither=bayer:bayer_scale=5" -loop 0 ../../../.github/tap-motion.gif`
- Toolbar images `.github/toolbar-before.png` / `toolbar-after.png`: compile only the toolbar files with `scripts/fork/render-toolbar/main.swift` (full builds need SwiftPM; this works with plain `swiftc`), from the repo root so hand assets load:
  `swiftc -D SWING_RANGE Sources/TinyHand/{Toolbar,AppKitHelpers,Preferences,PointerStyle,Ink,Log,HandMaker,TapSound}.swift scripts/fork/render-toolbar/main.swift -o /tmp/tb && /tmp/tb /tmp/after.png` (drop `-D SWING_RANGE` and use `upstream/main` sources for "before"), then place the `-range.png` tray 8 pt above the Swing range button; both images share one canvas size, toolbars aligned left.
- The prototype is published to GitHub Pages by `.github/workflows/prototype-pages.yml`: https://tumaranja.github.io/tinyhand/prototypes/tap-motion/

## Decisions

- 2026-11-07: Tap is a swing, not a shrink: the fingertip lifts 0.2 × screen height (and 0.025 right), the holding hand rises 45% of that with it, over 0.13 s; then it swings down in 0.09 s and presses. No wobble, and the holding hand does not follow the pointer up and down between taps (tried, rejected). The tap sound waits for contact (`ArmView.strikeDelay`); the laser dot is unchanged.
- 2026-11-07: Own fork only, no pull request to the creators for now.
- 2026-11-08: Swing range is a setting in the app: a `hand.tap` button in the bottom toolbar opens a slider tray (0.3×–2×, default 1×, `Preferences.swingRange`). It scales the swing's lift, poke and tilt, like the prototype's slider.
- 2026-11-08: Plan is to offer the swing tap to the creators as a pull request (only the Swift changes, after building and testing the app). The fork's README only supplements the original: what the fork changes, the dark GIF and a link to the hosted prototype; install and usage stay in the original repo.

## Sync

Pull from GitHub at the start of every session. Commit at each stopping point, unprompted, after running the repo's checks. Push only with Anja's go-ahead; when commits are waiting, say so and ask. Record decisions in the repo docs in the same turn. Commits are authored as `tumaranja <42451460+tumaranja@users.noreply.github.com>`.
