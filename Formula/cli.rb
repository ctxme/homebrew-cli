class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.2.0.tar.gz"
  sha256 "5dff4c9f27253ad3e4f003fbe09e22bc60f89fce0b610de71bc45d8d100da714"
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
