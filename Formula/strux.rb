class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-arm64.tar.gz"
      sha256 "9b8aec819b9e507783b230b3a8221e52da406039fd3da0df9a45bd889c422efe"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-x64.tar.gz"
      sha256 "6edfc51dfec1b86fcd9c9021efce3012e0de3797a3969b6b83231b349b434a73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-linux-x64"
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
