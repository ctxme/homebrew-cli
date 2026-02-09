class Cli < Formula
  include Language::Python::Virtualenv

  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.1.9.tar.gz"
  sha256 "6ecf4a9234304b050a43271bbe5afd7a38f8b06bfe447a46ff3c6762d032b43e"
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
