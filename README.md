<img src="./.github/logo.png" width="80" />

# TinyHand

[![Latest release](https://img.shields.io/github/v/release/nilbuild/tinyhand?display_name=tag&sort=semver&cacheSeconds=3600)](https://github.com/nilbuild/tinyhand/releases/latest)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-lightgrey)](https://tinyhand.app)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

A tiny hand on a stick that points at things on your Mac screen.

<img src="./.github/banner.jpg" alt="TinyHand: a tiny hand for your Mac" />

[![Download for macOS](https://img.shields.io/badge/Download_for_macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/nilbuild/tinyhand/releases/latest/download/TinyHand.dmg)
[![Visit website](https://img.shields.io/badge/Visit_website-ffffff?style=for-the-badge&logo=safari&logoColor=black)](https://tinyhand.app)

macOS 13 or later, Apple Silicon and Intel.

> **This is a fork** of [nilbuild/tinyhand](https://github.com/nilbuild/tinyhand) by Kamran Ahmed (MIT).
> It changes how a tap moves: the stick lifts up, then swings down onto the spot, like a real hand on a stick.
> The Download button above still gets the original app; this fork has no release of its own yet.

## Swing tap (this fork)

<img src="./.github/tap-motion.gif" alt="Side by side: on the left the original tap only shrinks the hand a little; on the right the hand lifts up, then swings down onto the spot." width="680" />

On a tap the hand winds up (the fingertip rises about 20% of the screen height, the hand holding the stick rises about half as far), then swings down and presses for about 0.22 s in total. The tap sound plays when the fingertip lands. Dragging to draw skips straight to the pressed pose. The motion lives in `ArmView.swing(at:)` in [Sources/TinyHand/ArmView.swift](Sources/TinyHand/ArmView.swift).

To play with it, run `python3 prototypes/tap-motion/record_server.py` and open [localhost:8766/prototypes/tap-motion/](http://localhost:8766/prototypes/tap-motion/). Opening it with `?record` and calling `recordFrames()` saves the frames used for the GIF above.

## Install

Open `TinyHand.dmg`, drag TinyHand to Applications and allow **Accessibility** when asked. It needs that to turn your clicks into taps. TinyHand updates itself.

## Use

| | |
|---|---|
| Click the menu bar icon, or **⌃⌥H** | Turn the pointer on or off |
| Right-click the menu bar icon | Menu and Settings |
| Click | Tap (nothing underneath gets clicked) |
| Hold and drag | Draw on the screen |
| **⌃⌥X** | Clear the drawing |
| **Esc** | Clear everything and turn the pointer off |

While the pointer is on, a small toolbar at the bottom of the screen lets you pick one of
36 hands or a laser dot, mute the tap sound, or exit.

## License

MIT. See [LICENSE](LICENSE). The original is © Kamran Ahmed; this fork's changes are © tumaranja, under the same licence.
