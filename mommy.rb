class Mommy < Formula
  desc "mommy's here to support you, in any shell, on any system~ ❤️"
  homepage "https://github.com/fwdekker/mommy"
  url "https://github.com/fwdekker/mommy/archive/v1.7.0.tar.gz"
  sha256 "6d56c279193477a292889352de0d2bdac8156148cf90f9f4a3f37d29d3a3e8ee"
  # The 'head' defines the development branch of the recipe
  head "https://github.com/fwdekker/mommy.git", branch: "main"
  license "Unlicense"

  def install
    system("make", "prefix=#{prefix}/", "install")
  end

  test do
    ("#{testpath}/config.sh").write("MOMMY_COMPLIMENTS='horizon'")
    assert_equal("horizon", shell_output("#{bin}/mommy -c #{testpath}/config.sh -s 0").strip)
  end
end
