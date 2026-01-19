class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.7/strux-0.0.7-darwin-arm64.tar.gz"
      sha256 "d1a680320b434ecd98a4ddac977ed79e978ae4100e5eeb3083b6180944dcaefa"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.7/strux-0.0.7-darwin-x64.tar.gz"
      sha256 "61ab9a3ff15ca63c2a71829656512553cb8b7e16457ea98f6c5dc02e5e802c00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.7/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.7/strux-linux-x64"
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
