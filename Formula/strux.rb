class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.1/strux-0.0.1-darwin-arm64.tar.gz"
      sha256 "d7a7a651711682458b4ff3c0e44050ee75cd64ae44465190cb095fcc4e0b7449"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.1/strux-0.0.1-darwin-x64.tar.gz"
      sha256 "92c6e286b66307fd262f68c1ad5fa1f95a017e0d58a7ec9d8b076b814588ce01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.1/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.1/strux-linux-x64"
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
