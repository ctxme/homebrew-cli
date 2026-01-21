class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.1.3.tar.gz"
  sha256 "c1b1f871f8b01fc025c9c3aca2fb1352b2fd5dfe3c34e1956169bdef4426b975"
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
