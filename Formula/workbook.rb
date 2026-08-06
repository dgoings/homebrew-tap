# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.0/workbook_0.4.0_darwin_arm64.tar.gz"
      sha256 "f26c80b2823ef43761e594b757f5310833b817e7a4c1e2330dfd0f36d864212a"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.0/workbook_0.4.0_darwin_amd64.tar.gz"
      sha256 "167b7f4ad7461f1dd5b7911f68ff745736111a327aef0b86a4d95990fcb03edb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.0/workbook_0.4.0_linux_arm64.tar.gz"
      sha256 "2ab2d53e4c6465fb923ca18850a194909bca0e375f81f3e5ad3fb6ea9d189ae6"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.0/workbook_0.4.0_linux_amd64.tar.gz"
      sha256 "308016701e8f8c51833a9e78dd4883df382b604e1dc8df27f839732e59f602d9"
    end
  end

  def install
    bin.install "workbook"
  end

  def caveats
    <<~CAVEATS
      Workbook generates agent documentation per project, so upgrading this
      formula cannot refresh the projects on your machine.

      Run "workbook setup" in each project that uses Workbook to refresh its
      managed documentation, and "workbook docs status" to check whether a
      project is current.
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workbook version")
  end
end
