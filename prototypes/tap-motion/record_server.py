"""Serve the repo for the tap-motion prototype and save frames it POSTs.

Run from the repo root:  python3 prototypes/tap-motion/record_server.py
Open:                    http://localhost:8766/prototypes/tap-motion/
Frames from ?record land in prototypes/tap-motion/frames/ (git-ignored).
"""
import http.server
import os
import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[2]
FRAMES = pathlib.Path(__file__).resolve().parent / "frames"


class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(ROOT), **kwargs)

    def do_POST(self):
        name = os.path.basename(self.path)
        if not self.path.startswith("/frame/") or not name.endswith(".png"):
            self.send_error(404)
            return
        FRAMES.mkdir(exist_ok=True)
        body = self.rfile.read(int(self.headers["Content-Length"]))
        (FRAMES / name).write_bytes(body)
        self.send_response(204)
        self.end_headers()


if __name__ == "__main__":
    http.server.ThreadingHTTPServer(("127.0.0.1", 8766), Handler).serve_forever()
