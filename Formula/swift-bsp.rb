class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/archive/refs/tags/v0.1.tar.gz"
  sha256 "37d8205767d344c7025a10bdba16712fee1660b45f587ab5b8f1a5a35bf3279b"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"

    bin.install(
      ".build/release/swift-bsp"
      # ".build/release/SWBBuildServiceBundle",
      # ".build/release/SwiftBuild_SWBAndroidPlatform.bundle",
      # ".build/release/SwiftBuild_SWBApplePlatform.bundle",
      # ".build/release/SwiftBuild_SWBCore.bundle",
      # ".build/release/SwiftBuild_SWBQNXPlatform.bundle",
      # ".build/release/SwiftBuild_SWBUniversalPlatform.bundle",
      # ".build/release/SwiftBuild_SWBWebAssemblyPlatform.bundle",
      # ".build/release/SwiftBuild_SWBWindowsPlatform.bundle"
    )
  end

  test do
    system "#{bin}/swift-bsp", "--help"
  end
end
