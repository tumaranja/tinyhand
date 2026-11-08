# TinyHand: swing tap

A fork of [TinyHand](https://github.com/nilbuild/tinyhand) by Kamran Ahmed that changes one thing: the tap motion. For everything else (download, install, how to use it), see the [original repo](https://github.com/nilbuild/tinyhand).

In the original, tapping only shrinks the hand a little. Here the stick swings up and down, the way a real hand on a stick moves. There's no app download of its own: the plan is to offer the change to the original as a pull request, so everyone gets it through TinyHand's normal updates.

[Try in your browser →](https://tumaranja.github.io/tinyhand/prototypes/tap-motion/)

<img src="./.github/tap-motion.gif" alt="Side by side: Before, the original tap only shrinks the hand a little; After, the hand swings up and down onto the spot." width="680" />

## The motion

- **Swing up (0.13 s):** the fingertip lifts about 20% of the screen height (at tap strength 1×) and a little to the right. The hand holding the stick rises about half as far with it, so the whole stick moves, not just the tip.
- **Swing down (0.09 s):** it swings down onto the spot and presses, then settles back. There's no wobble.
- **Sound:** the tap sound plays when the fingertip lands. The laser pointer is unchanged.
- **Drawing:** dragging skips straight to the pressed pose, so ink starts where you clicked.
- **Tap strength:** a new button in the toolbar at the bottom of the screen opens a slider from 0.3× to 2×. It scales how far the stick swings; 1× is the default.

The code is `ArmView.swing(at:)` in [Sources/TinyHand/ArmView.swift](Sources/TinyHand/ArmView.swift). The browser prototype in [prototypes/tap-motion](prototypes/tap-motion) mirrors it.

## Toolbar

The toolbar at the bottom of the screen gets one new button, Tap strength. It opens a slider in the toolbar's own style, like the ink colour picker.

**Before**

<img src="./.github/toolbar-before.png" alt="The original toolbar: pointer styles, ink colour, sound and close." width="489" />

**After**

<img src="./.github/toolbar-after.png" alt="The toolbar with the new Tap strength button selected and its slider open above it, set to 1.0×." width="489" />

## License

MIT, like the original. See [LICENSE](LICENSE). The original is © Kamran Ahmed; the swing tap changes are © tumaranja.
