# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.0/workbook_0.5.0_darwin_arm64.tar.gz"
      sha256 "54dd40ad4dc0787ba8e116d51cddbc43ca2cbc2508eddaca48aa22e3bedb3375"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.0/workbook_0.5.0_darwin_amd64.tar.gz"
      sha256 "84051115232e369e462dc40eb7d14f7cf30ff79209070bd4dae700242b75f6f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.0/workbook_0.5.0_linux_arm64.tar.gz"
      sha256 "472ccd0ce64c5be3d241a09d5dc7cd5f435a8ad02b740d6a733efb6ade5dfb35"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.5.0/workbook_0.5.0_linux_amd64.tar.gz"
      sha256 "f54de8830bf57c1df35a52469b5f9ce946442874c497052ec9050db3420569c6"
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
