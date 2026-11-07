# TinyHand (tumaranja fork)

Fork of [nilbuild/tinyhand](https://github.com/nilbuild/tinyhand), a macOS menu bar app (Swift, AppKit, SwiftPM) that shows a hand on a stick as the pointer. MIT: keep the original copyright line in LICENSE.

- Remotes: `origin` = tumaranja/tinyhand (ours), `upstream` = nilbuild/tinyhand (the creators). Never push to `upstream`. Pull their updates with `git fetch upstream && git merge upstream/main`.
- Build: `swift build` (needs full Xcode or a working Command Line Tools; `scripts/build-app.sh` makes the signed .app).
- Tap motion: `ArmView.swing(at:)` in `Sources/TinyHand/ArmView.swift`. The prototype in `prototypes/tap-motion/` mirrors it; change both together, and re-record `.github/tap-motion.gif` (dark theme, `recordFrames()`; see README) when the motion changes.
- The prototype is published to GitHub Pages by `.github/workflows/prototype-pages.yml`: https://tumaranja.github.io/tinyhand/prototypes/tap-motion/

## Decisions

- 2026-11-07: Tap is a swing, not a shrink: the fingertip lifts 0.2 × screen height (and 0.025 right), the holding hand rises 45% of that with it, over 0.13 s; then it swings down in 0.09 s and presses. No wobble, and the holding hand does not follow the pointer up and down between taps (tried, rejected). The tap sound waits for contact (`ArmView.strikeDelay`); the laser dot is unchanged.
- 2026-11-07: Own fork only, no pull request to the creators for now.
- 2026-11-08: Plan is to offer the swing tap to the creators as a pull request (only the Swift changes, after building and testing the app). The fork's README only supplements the original: what the fork changes, the dark GIF and a link to the hosted prototype; install and usage stay in the original repo.

## Sync

Pull from GitHub at the start of every session. Commit at each stopping point, unprompted, after running the repo's checks. Push only with Anja's go-ahead; when commits are waiting, say so and ask. Record decisions in the repo docs in the same turn. Commits are authored as `tumaranja <42451460+tumaranja@users.noreply.github.com>`.
