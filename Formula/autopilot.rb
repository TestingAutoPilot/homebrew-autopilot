class Autopilot < Formula
  desc "Declarative macOS GUI test driver via the Accessibility API"
  homepage "https://github.com/jschwefel-CBB/autopilot"
  version "0.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/jschwefel-CBB/autopilot/releases/download/v#{version}/autopilot-#{version}-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    url "https://github.com/jschwefel-CBB/autopilot/releases/download/v#{version}/autopilot-#{version}-x86_64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
