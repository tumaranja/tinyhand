# TinyHand: swing tap

A fork of [TinyHand](https://github.com/nilbuild/tinyhand) by Kamran Ahmed that changes one thing: how a tap moves. For everything else (download, install, how to use it), see the [original repo](https://github.com/nilbuild/tinyhand) and [tinyhand.app](https://tinyhand.app).

In the original, a tap only shrinks the hand a little. Here the stick lifts up and swings down onto the spot, the way a real hand on a stick moves.

<img src="./.github/tap-motion.gif" alt="Side by side: Before, the original tap only shrinks the hand a little; After, the hand swings up and down onto the spot." width="680" />

**[Try it in your browser →](https://tumaranja.github.io/tinyhand/prototypes/tap-motion/)**

## The motion

- **Wind-up (0.13 s):** the fingertip lifts about 20% of the screen height and a little to the right. The hand holding the stick rises about half as far with it, so the whole stick moves, not just the tip.
- **Swing-in (0.09 s):** it swings down onto the spot and presses, then settles back. There's no wobble.
- **Sound:** the tap sound plays when the fingertip lands. The laser pointer is unchanged.
- **Drawing:** dragging skips straight to the pressed pose, so ink starts where you clicked.

The code is `ArmView.swing(at:)` in [Sources/TinyHand/ArmView.swift](Sources/TinyHand/ArmView.swift). The browser prototype in [prototypes/tap-motion](prototypes/tap-motion) mirrors it.

## Status

This fork has no app download of its own. The plan is to offer the change to the original as a pull request, so everyone gets it through TinyHand's normal updates.

## Run the prototype locally

```bash
python3 prototypes/tap-motion/record_server.py
```

Then open [localhost:8766/prototypes/tap-motion/](http://localhost:8766/prototypes/tap-motion/). To re-record the GIF, open it with `?record`, run `recordFrames()` in the console, and turn the saved frames into a GIF with ffmpeg.

## License

MIT, like the original. See [LICENSE](LICENSE). The original is © Kamran Ahmed; the swing tap changes are © tumaranja.
