class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.1.4.tar.gz"
  sha256 "de5db959494322821f2c1cd1be693d90b75368a9694e61aef56e326cc17dd9cd"
  license "Apache-2.0"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python@3.11")
    system libexec/"bin/pip", "install", "ctxme==#{version}"
  end

  test do
    system "#{bin}/ctxme", "--help"
  end
end
