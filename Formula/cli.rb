class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.1.10.tar.gz"
  sha256 "f5ea51e2c5d4f5edae53cca5a70153cc5b588664e68191e35f6f51d0151cbaaf"
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
