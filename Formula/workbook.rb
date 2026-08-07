# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.1/workbook_0.4.1_darwin_arm64.tar.gz"
      sha256 "7989b2c35a7fd04f11de1e7077cca76068fb7fe86d838ac401fc41b37623c6d7"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.1/workbook_0.4.1_darwin_amd64.tar.gz"
      sha256 "a171e830a17b8b036fa07297a1f660531e1281091b6907dc4e4520abe899e3f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.1/workbook_0.4.1_linux_arm64.tar.gz"
      sha256 "7eeff65cc104a90f5b12b415724d3e558039d1f3d3cf1c42511f84285e45978a"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.1/workbook_0.4.1_linux_amd64.tar.gz"
      sha256 "219b4ca28aa2ba85f6dec6c27af7c93b5fbd0f3a5c3f55abf4e40237640d24d3"
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
