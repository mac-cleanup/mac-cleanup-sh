class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://opensource.wartner.io"
    license "MIT"
    head "https://github.com/fwartner/homebrew-mac-cleanup.git"
    version "1.0.4"
    sha256 "45b0cd54d7e7a5feacd27daca3ad1d360138f7bab63b7544e817a965ef31021e"

    def install
        bin.install "mac-cleanup"
    end

    test do
        assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
end
