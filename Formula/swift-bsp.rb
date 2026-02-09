class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/archive/refs/tags/v0.1.tar.gz"
  sha256 "5c299485e4bda727426eae9cc98b2571dd73d5c0c3bc8b5b63cfef5dd921b437"
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
