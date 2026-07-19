class Cachewatch < Formula
  desc "Menu bar observability for Claude Code sessions: cache TTLs, quota, memory"
  homepage "https://github.com/fyzanshaik/cachewatch"
  url "https://github.com/fyzanshaik/cachewatch/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bdf66de221bf084057705f56b9c06a3475d4270b5be49c186f5e50214c830e4b"
  license "MIT"

  depends_on macos: :sequoia

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/Cachewatch" => "cachewatch"
  end

  def caveats
    <<~EOS
      Wire the statusline forwarder (idempotent, backs up settings first):
        cachewatch setup
      Then run the menu bar app:
        cachewatch
    EOS
  end

  test do
    assert_match "SESSION", shell_output("#{bin}/cachewatch dump 2>&1", 0).upcase
  rescue Minitest::Assertion
    assert_match "No live", shell_output("#{bin}/cachewatch dump 2>&1", 0)
  end
end
