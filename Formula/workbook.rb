# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.1/workbook_0.5.1_darwin_arm64.tar.gz"
      sha256 "b0b5a7bc0de662d855f94b73150bfc34a66d66de6538318336cfea52295ceebd"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.1/workbook_0.5.1_darwin_amd64.tar.gz"
      sha256 "d2dd1ba122edae967a03aa3e87c434d153d637ae521897931f9a986c22403d32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.1/workbook_0.5.1_linux_arm64.tar.gz"
      sha256 "8848dc031210f17733bb4999d1f99b9d738a8958df1d30ad0d51b34887d5bc72"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.1/workbook_0.5.1_linux_amd64.tar.gz"
      sha256 "b03271fb6ff0fc96513848b0c5316214ef441f1dce0cb890c185b8da2269c392"
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
