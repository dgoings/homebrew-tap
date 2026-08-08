# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.2/workbook_0.4.2_darwin_arm64.tar.gz"
      sha256 "4b70937c0c634f2acc4dd8472affdf70ba535a4932cc88f6345b1f3e536484f4"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.2/workbook_0.4.2_darwin_amd64.tar.gz"
      sha256 "51913a41ac522b986c6b457aed049aa6d53573c92b341d90e12834469b658bf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.2/workbook_0.4.2_linux_arm64.tar.gz"
      sha256 "aa390391ccd5fb7ea8cbe0fae6db39749c2fc573d83a611007846c673417eca5"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.2/workbook_0.4.2_linux_amd64.tar.gz"
      sha256 "d81bb64c82980ca921c460cb8e90e799e1290d2c11d37aa78cb5c1907ca5eacd"
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
