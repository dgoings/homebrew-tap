# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.4/workbook_0.4.4_darwin_arm64.tar.gz"
      sha256 "59480048c9f058a1ea707ba6cecf762aaa8052cddeb0c03cae3f5bac2646a7be"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.4/workbook_0.4.4_darwin_amd64.tar.gz"
      sha256 "e331b60a4221135071069cbb681331a65f8bdc574b574cd152a7657257f92cc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.4/workbook_0.4.4_linux_arm64.tar.gz"
      sha256 "ce8731c78ee0b473febf66459b6a0ebf466fe2eaa8c92c57e12de8785a4d7913"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.4/workbook_0.4.4_linux_amd64.tar.gz"
      sha256 "648314df90029849f5c1dddb80c95c96f89b9c83f67d072a3c1b05f9aea49c17"
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
