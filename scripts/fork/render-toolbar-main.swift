import AppKit
_ = NSApplication.shared
let out = CommandLine.arguments[1]
let bar = Toolbar()
bar.select(.lavender)
#if STRENGTH
if let d = bar.snapshotStrengthTray()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out.replacingOccurrences(of: ".png", with: "-strength.png"))) }
#endif
if let d = bar.snapshot()?.representation(using: .png, properties: [:]) { try? d.write(to: URL(fileURLWithPath: out)) }
print("ok")
