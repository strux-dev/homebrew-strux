class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-0.0.17-darwin-arm64.tar.gz"
      sha256 "0c5a06f93dbf0a26982b4d7b6f893a58a47cbfea1eddc51c48d3159dbfdfd30c"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.17/strux-0.0.17-darwin-x64.tar.gz"
      sha256 "a179d709b1c746f11c5e7676828c71d6b22c5b045cbef9e172288a9150876752"
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
