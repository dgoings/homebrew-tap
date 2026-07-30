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
      sha256 "c40cc0aff4718eaf9ada302e7e6d093f205848cec10c56c7156f99916023a9c0"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.2.0/workbook_0.2.0_darwin_amd64.tar.gz"
      sha256 "fb3963f89ded82e1b4855a191b365ab4dfbb023a86e49205d0b0b7abab174c8c"
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
