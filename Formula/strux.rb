class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.3/strux-0.0.3-darwin-arm64.tar.gz"
      sha256 "c9eaf22d4535a7b80a2cf2f7912afb2d59b9962a8cbc9a688d39387355cb1a09"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.3/strux-0.0.3-darwin-x64.tar.gz"
      sha256 "a3708b71eb116f67441eb24c5f38da6541e5a82968a9b9220188fe96db06c364"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.3/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.3/strux-linux-x64"
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
