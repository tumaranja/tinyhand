// Renders the bottom toolbar (and, with -D SWING_RANGE, the Swing range tray) to PNGs.
// Usage: <binary> out.png [swing range value]
import AppKit
_ = NSApplication.shared
let out = CommandLine.arguments[1]
#if SWING_RANGE
if CommandLine.arguments.count > 2, let k = Double(CommandLine.arguments[2]) {
    Preferences.swingRange = k
}
#endif
let bar = Toolbar()
bar.select(.lavender)
#if SWING_RANGE
if let d = bar.snapshotSwingRangeTray()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out.replacingOccurrences(of: ".png", with: "-range.png"))) }
#endif
if let d = bar.snapshot()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out)) }
print("ok")
