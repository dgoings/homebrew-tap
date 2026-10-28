# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.1/workbook_0.6.1_darwin_arm64.tar.gz"
      sha256 "097cbb2ce9568f64573dbf7ddfbb40268d7b842b74ec2a8a79dfbec9d520ba2b"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.1/workbook_0.6.1_darwin_amd64.tar.gz"
      sha256 "0ec06d30f4ffac70e9c03500ae4cbc13d040e9f362607a8d7deedf678cc2843c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.1/workbook_0.6.1_linux_arm64.tar.gz"
      sha256 "8bde0fd7ae309fbe9a4779cde5810298562c6c62f37f6c9673fc454a6de9a62e"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.1/workbook_0.6.1_linux_amd64.tar.gz"
      sha256 "26dc8d9a2af6caa09604ef36f416163f8621ac0572b2b9a3b948714b2160a489"
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
