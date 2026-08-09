# typed: strict
# frozen_string_literal: true

# Homebrew formula for Workbook.
class Workbook < Formula
  desc "Repository-native project tracker for humans and coding agents"
  homepage "https://github.com/dgoings/workbook"

  on_macos do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.3/workbook_0.4.3_darwin_arm64.tar.gz"
      sha256 "aa701c07c972f7222d02a827f6103c24dcf1f6bcb6faf18eee31709a15ffb4a6"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.3/workbook_0.4.3_darwin_amd64.tar.gz"
      sha256 "be994d7b12ac97ba0ed4421ec17c189f95f4f870a4e9985f63e00d0204f5087a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.3/workbook_0.4.3_linux_arm64.tar.gz"
      sha256 "3b09f6c31d0f13a837bce20230549ce3de90b8fa4456b41a76aa3ae0f649f81b"
    end

    on_intel do
      url "https://github.com/dgoings/workbook/releases/download/v0.4.3/workbook_0.4.3_linux_amd64.tar.gz"
      sha256 "445ecf8f16062904b75e6388b9b04f4ba73efac08f25d6c6dc47dae8bfa171a1"
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
