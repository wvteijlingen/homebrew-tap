class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/archive/refs/tags/v0.1.tar.gz"
  sha256 "2cdd0b002c252063508979f1c69b23335f15c3d3fb09c5d8b9941baca08ae9ed"
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
