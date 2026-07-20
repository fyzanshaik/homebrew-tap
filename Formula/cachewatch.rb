class Cachewatch < Formula
  desc "Menu bar observability for Claude Code sessions: cache TTLs, quota, memory"
  homepage "https://github.com/fyzanshaik/cachewatch"
  url "https://github.com/fyzanshaik/cachewatch/releases/download/v0.2.0/cachewatch-0.2.0-macos-arm64.tar.gz"
  sha256 "495bcd6d2d9f940f53095cc7d03b1635789ec1b38c6a02f2a72935a49403b827"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    libexec.install "Cachewatch"
    (bin/"cachewatch").write <<~SH
      #!/bin/bash
      CACHEWATCH_VERSION="#{version}" exec "#{libexec}/Cachewatch" "$@"
    SH
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cachewatch --version").strip
  end
end
