class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.18/strux-0.0.18-darwin-arm64.tar.gz"
      sha256 "07d6e53f3cd80fb1d94e3b282b625e07049b43006c13b5dba5188d162151f835"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.18/strux-0.0.18-darwin-x64.tar.gz"
      sha256 "143732e26159088c87d9f8d08829fee2ba7d74d5d49d45131e9826e715097974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.18/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.18/strux-linux-x64"
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
