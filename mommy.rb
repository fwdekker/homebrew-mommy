class Mommy < Formula
  desc "mommy's here to support you, in any shell, on any system~ ❤️"
  homepage "https://github.com/fwdekker/mommy"
  url "https://github.com/fwdekker/mommy/archive/v1.8.0.tar.gz"
  sha256 "4fd16238f1f77649b6b7441427d2a91c5badd87be5c4ad54ce58e725e127029f"
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
