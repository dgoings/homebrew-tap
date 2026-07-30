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
      sha256 "57ad20531331e9fb5f154d7f78b0b7983f089a3c0c4d6ac0a88edc0b043a02c0"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.2.0/workbook_0.2.0_darwin_amd64.tar.gz"
      sha256 "a3426c82e0bf0da8a5dcb66417b12291449fa52c440c1a84b0f6e618e5fe1519"
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
