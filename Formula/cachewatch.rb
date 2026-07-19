class Cachewatch < Formula
  desc "Menu bar observability for Claude Code sessions: cache TTLs, quota, memory"
  homepage "https://github.com/fyzanshaik/cachewatch"
  url "https://github.com/fyzanshaik/cachewatch/releases/download/v0.1.1/cachewatch-0.1.1-arm64.tar.gz"
  sha256 "654af71de18a5f859796e0690cf13ecef2e7936d057fe796ae0588908ba644d3"
  license "MIT"
  version "0.1.1"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "cachewatch"
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
    output = shell_output("#{bin}/cachewatch dump 2>&1")
    assert output.include?("SESSION") || output.include?("No live")
  end
end
