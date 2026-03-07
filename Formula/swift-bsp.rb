class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/archive/refs/tags/v0.1.tar.gz"
  sha256 "64a1e7ee288c0fd67c304df1c0c886a91594fad3332fe33d57af878c2b3648ee"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"

    [
      ".build/release/swift-bsp",
      ".build/release/SWBBuildServiceBundle",
      ".build/release/SwiftBuild_SWBAndroidPlatform.bundle",
      ".build/release/SwiftBuild_SWBApplePlatform.bundle",
      ".build/release/SwiftBuild_SWBCore.bundle",
      ".build/release/SwiftBuild_SWBGenericUnixPlatform.bundle",
      ".build/release/SwiftBuild_SWBQNXPlatform.bundle",
      ".build/release/SwiftBuild_SWBUniversalPlatform.bundle",
      ".build/release/SwiftBuild_SWBWebAssemblyPlatform.bundle",
      ".build/release/SwiftBuild_SWBWindowsPlatform.bundle"
    ].each do |source|
      bin.install(source)
    end
  end

  test do
    system "#{bin}/swift-bsp", "--help"
  end
end
