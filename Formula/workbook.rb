# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"
  version "0.2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.2.0/workbook_0.2.0_darwin_arm64.tar.gz"
      sha256 "60230b3c060483029e9df8f79e67be30accfbd82197f6f856fb02bf2361ce0f8"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.2.0/workbook_0.2.0_darwin_amd64.tar.gz"
      sha256 "334beebadcbc7ba70a432da24694f5ab783d0eb1733d7fdb7ab8d70ecd969a38"
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
    assert_match version, shell_output("#{bin}/workbook version")
  end
end
