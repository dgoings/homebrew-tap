# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.3.0/workbook_0.3.0_darwin_arm64.tar.gz"
      sha256 "0a81f5b418681d32dc788c23d6079058da9420d33453bd79be3d21e32b6cf027"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.3.0/workbook_0.3.0_darwin_amd64.tar.gz"
      sha256 "a5c44cf12ddbac9cef22b6b560fe47cc96f3f545ff7c7f237e7c27dfadf86b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.3.0/workbook_0.3.0_linux_arm64.tar.gz"
      sha256 "c51bcfe3dd625eca2aa4c8ec6e411032f8653934c3307013e05ff6a2fb3f0135"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.3.0/workbook_0.3.0_linux_amd64.tar.gz"
      sha256 "96df8c617ac9d8c7a5cba936fa8fd7b6d71fbee09c456ae8a09c4e4a3746498a"
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
