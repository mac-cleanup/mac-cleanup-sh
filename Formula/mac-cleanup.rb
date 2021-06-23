class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://opensource.wartner.io"
    license "MIT"
    head "https://github.com/fwartner/homebrew-mac-cleanup.git"

    def install
        bin.install "mac-cleanup"
    end

    test do
        assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
end
