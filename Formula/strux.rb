class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.6/strux-0.0.6-darwin-arm64.tar.gz"
      sha256 "a64adee2f86dfa6027bcf8d462287935234f8c71a740d96cc04e0bc38e58ac48"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.6/strux-0.0.6-darwin-x64.tar.gz"
      sha256 "5df6bd204ab923c892ff0be0dda37883a4723b41632052303e1ee5471e3fdd80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.6/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.6/strux-linux-x64"
    end
  end

  def install
    if OS.mac?
      bin.install "strux"
      bin.install "strux-introspect"
    else
      bin.install Dir["strux*"].first => "strux"
    end
  end

  test do
    system "#{bin}/strux", "--version"
  end
end
