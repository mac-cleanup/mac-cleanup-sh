class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://wartner.io"
    head "https://github.com/fwartner/homebrew-mac-cleanup.git"
    #url "https://github.com/fwartner/mac-cleanup/archive/1.0.2.tar.gz"
    #sha256 "11140d378950f0887f254efcdf1df43d10436a53790229ed52b3879eb3e8d221"
    license "MIT"

    def install
      bin.install "mac-cleanup"
    end

    test do
      assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
  end
