class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-0.0.19-darwin-arm64.tar.gz"
      sha256 "3d9a312c3a561012e1ff63b142e9ea171b8852197142a6846a49dfc51cf51156"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-0.0.19-darwin-x64.tar.gz"
      sha256 "d27047dceae58a65308735515ece0c12fff09ca87833a4652eba9f860e0b10d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-linux-x64"
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
