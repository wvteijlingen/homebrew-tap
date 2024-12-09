class Localeasy < Formula
  desc "Effortless app localisation using Google Sheets"
  homepage "https://github.com/wvteijlingen/localeasy"
  url "https://github.com/wvteijlingen/localeasy/archive/refs/tags/v0.2.tar.gz"
  sha256 "8b80a16898716cd0f2177573d68f1d3ea43b9c2edc67337a2cfd35f7ecaa7f13"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", *args, "-configuration", "release", "--product", "localeasy"
    bin.install ".build/release/localeasy"
  end

  test do
    system "#{bin}/localeasy", "--version"
  end
end
