class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-0.0.17-darwin-arm64.tar.gz"
      sha256 "0d3c4490cdd005d203a7234a6661e4a6a66c1237a09bc9a3a2439426bfa1a797"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-0.0.17-darwin-x64.tar.gz"
      sha256 "6f2c229f262ddf3005116dc3979bf0ca959f77a4ff140e8acf417242739735f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-linux-x64"
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
