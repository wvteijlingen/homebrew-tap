class Xcodeformat < Formula
  desc "Format on Save for Xcode"
  homepage "https://github.com/wvteijlingen/xcodeformat"
  url "https://github.com/wvteijlingen/xcodeformat/archive/refs/tags/v0.1.tar.gz"
  sha256 "33faffff270b4f1cb2d101a565e386cf1a03fe3966431bf2d09876890af11c69"
  license "MIT"

  depends_on "deno" => [:build]

  def install
    system "deno", "task", "compile"
    bin.install "build/xcodeformat"
  end

  test do
    system "bin/xcodeformat"
  end
end
