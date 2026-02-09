class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/releases/download/v0.1/swift-bsp.tar.gz"
  sha256 "5667d5d467a1081cfff16d3ad468f3cbaf21e8f2ec94629bcce64362bbc6c4e0"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--configuration", "release"
    bin.install(".build/release/swift-bsp")
  end

  test do
    system "#{bin}/swift-bsp", "--help"
  end
end
