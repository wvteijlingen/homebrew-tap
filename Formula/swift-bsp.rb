# require 'fileutils'

class SwiftBsp < Formula
  desc "Build Server Protocol for Swift"
  homepage "https://github.com/wvteijlingen/swift-bsp"
  url "https://github.com/wvteijlingen/swift-bsp/archive/refs/tags/v0.1.tar.gz"
  sha256 "42e3f8f56ac42341faf7af7f4be3e29f771a9a10613922f8bc068b6b942931ae"
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
      libexec.install(source)
    end

    (bin/"swift-bsp").write_env_script libexec/"swift-bsp", SWBBUILD_SERVICE_BUNDLE: libexec/"SWBBuildServiceBundle"
  end

  test do
    system "#{bin}/swift-bsp", "--help"
  end
end
