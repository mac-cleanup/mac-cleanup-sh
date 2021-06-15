class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://wartner.io"
    url "https://github.com/fwartner/mac-cleanup.git"
    revision "c8dd7089de0798193acac6e994563bc36fa5d7a1"
    license "MIT"

    def install
      bin.install "mac-cleanup"
    end

    test do
      assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
  end
