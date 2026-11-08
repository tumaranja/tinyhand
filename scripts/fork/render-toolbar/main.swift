import AppKit
_ = NSApplication.shared
let out = CommandLine.arguments[1]
let bar = Toolbar()
bar.select(.lavender)
#if SWING_RANGE
if let d = bar.snapshotSwingRangeTray()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out.replacingOccurrences(of: ".png", with: "-range.png"))) }
#endif
if let d = bar.snapshot()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out)) }
print("ok")
