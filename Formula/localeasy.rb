class Localeasy < Formula
  desc "Effortless app localisation using Google Sheets"
  homepage "https://github.com/wvteijlingen/localeasy"
  url "https://github.com/wvteijlingen/localeasy/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "23c2a20811892d73dc15075090498de84a4816a3c7bb5a849266832fb120a7e5"
  license "MIT"

  depends_on "deno" => [:build, :test]

  def install
    system "deno", "task", "compile"
    bin.install "localeasy"
  end

  test do
    system "#{bin}/localeasy", "--version"
  end
end
