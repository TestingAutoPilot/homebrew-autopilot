class Autopilot < Formula
  desc "Declarative macOS GUI test driver via the Accessibility API"
  homepage "https://github.com/jschwefel-CBB/autopilot-macos"
  version "2.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/jschwefel-CBB/autopilot-macos/releases/download/v2.0.0/autopilot-2.0.0-arm64.tar.gz"
    sha256 "862f326435a76b0f481115459058d34b8c52b9c29ac2a1b36a9a71a453b2732e"
  end

  def install
    bin.install "autopilot"
    bin.install "AutopilotMCP"
  end

  def caveats
    <<~EOS
      AutoPilot requires Accessibility permission to drive other apps.
      Grant it to Terminal (or whichever process runs autopilot) in:
        System Settings → Privacy & Security → Accessibility

      Run `autopilot doctor` to verify permissions.
    EOS
  end

  test do
    assert_match "AutoPilot", shell_output("#{bin}/autopilot --version 2>&1", 1)
  end
end
