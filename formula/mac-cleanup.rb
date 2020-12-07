class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://wartner.io"
    url "https://github.com/fwartner/mac-cleanup/archive/1.0.2.tar.gz"
    sha256 "948a9e44ea4921d34fd211c5785c85dc50233d2e337f1e97b970e40a8449ace8"
    license "MIT"

    def install
      bin.install "mac-cleanup"
    end

    test do
      assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
  end
