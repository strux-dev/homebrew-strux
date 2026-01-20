class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-arm64.tar.gz"
      sha256 "e3406acd73db705b57000175ca704061ef0e2eedf902750211d8eda50008f732"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-x64.tar.gz"
      sha256 "08806de94fb2098b9310883666ae4c7faa71102fa0858ad852a9d3ca3b3bd2c6"
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
