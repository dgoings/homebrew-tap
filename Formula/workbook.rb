# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.0/workbook_0.6.0_darwin_arm64.tar.gz"
      sha256 "07340fac1e0157e715e3e621fbdee52e19fbb0aaf3eef0387d7dcc37ab6946aa"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.0/workbook_0.6.0_darwin_amd64.tar.gz"
      sha256 "33d3b8567d11f96875fd428cd148e0becafc527045bbd6c0aebaf8ec37e790e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.0/workbook_0.6.0_linux_arm64.tar.gz"
      sha256 "b9afe238c814ed73d5f5fa2d3830ff6a2c8cc39bff8c2910918a7c1621e0eaae"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.6.0/workbook_0.6.0_linux_amd64.tar.gz"
      sha256 "843fdb4e707073d77fce1cf56f78c45f802b14e3c92281e09c4981c729c67485"
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
