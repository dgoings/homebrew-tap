# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.7.0/workbook_0.7.0_darwin_arm64.tar.gz"
      sha256 "c413b623ba25ed47353a7d63a492990b4a732cd4fcde27c68103544c16348912"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.7.0/workbook_0.7.0_darwin_amd64.tar.gz"
      sha256 "b49bf4091b718f725d894027ab766bfee84bad110b80aa45465c0833a976ed50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.7.0/workbook_0.7.0_linux_arm64.tar.gz"
      sha256 "ce2b4f26f6f51d380ac2e7e8f56ca46b753a9fa25f238931cb565c489cbdc9ea"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.7.0/workbook_0.7.0_linux_amd64.tar.gz"
      sha256 "f74c5dd4babac31aa1c2f85b199b66130c8365364791402fa996f7912f859591"
    end
  end

  def install
    bin.install "workbook"
    # The scripts are generated from the command schema, so they are built from
    # the binary being installed rather than shipped in the archive and left to
    # drift from the version they complete.
    generate_completions_from_executable(bin/"workbook", "completion")
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
