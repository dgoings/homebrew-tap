# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"
  version "0.1.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.1.0/workbook_0.1.0_darwin_arm64.tar.gz"
      sha256 "0594391aefc2e4b10f5a55da9bc824b81d2410bcbf8aa58966c5fb068a1aa99a"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.1.0/workbook_0.1.0_darwin_amd64.tar.gz"
      sha256 "cd2633e8d94054e3f400717909782369f3f80131324d23a58c4dd0052a6ec815"
    end
  end

  def install
    bin.install "workbook"
  end

  test do
    assert_match version, shell_output("#{bin}/workbook version")
  end
end
