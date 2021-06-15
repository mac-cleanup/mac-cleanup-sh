class MacCleanup < Formula
    desc "🗑️ Cleanup script for OSX"
    homepage "https://wartner.io"
    url "{{{tarballUrl}}}"
    version "{{version}}"
    sha256 "{{sha256}}"
    license "MIT"

    def install
      bin.install "mac-cleanup"
    end

    test do
      assert_match "A Mac Cleanup Utility by fwartner", shell_output("#{bin}/mac-cleanup -h", 2)
    end
  end
