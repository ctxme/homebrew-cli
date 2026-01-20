class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.1.1.tar.gz"
  sha256 "cf48e36c7392d02f15aaf5a195778640e0fc5d1c838ee42c48bff2e0cd9fc00a"
  license "Apache-2.0"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ctxme", "--help"
  end
end
