class Localeasy < Formula
  desc "Effortless app localisation using Google Sheets"
  homepage "https://github.com/wvteijlingen/localeasy"
  url "https://github.com/wvteijlingen/localeasy/archive/refs/tags/v0.2.tar.gz"
  sha256 "99f8b8d83c3ac091cc49c7bcfe453730446c64ed4e636fb97169a89a1307e7be"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "localeasy"
    bin.install ".build/release/localeasy"
  end

  test do
    system "#{bin}/localeasy", "--version"
  end
end
