class Ctxme < Formula
  desc "Context Platform CLI"
  homepage "https://github.com/mcgloneb/ai-context"
  url "https://files.pythonhosted.org/packages/source/c/ctxme/ctxme-0.4.0.tar.gz"
  sha256 "c21a16fcad9404c8d818dfae5d5ff54c0e592416facd41fc77a14a5b22973ece"
  license "Apache-2.0"

  depends_on "python@3.11"

  # Deliberately avoids Homebrew's Python helpers, for two separate
  # reasons:
  #   - virtualenv_create builds the venv but defaults to
  #     without_pip: true, so the venv has no pip to install with.
  #   - pip_install / pip_install_and_link (the helpers that would
  #     supply pip) route through Formula#std_pip_args, which
  #     hard-codes --no-deps. They would install ctxme without its
  #     runtime dependencies and produce a CLI that fails on import.
  # Building the venv with the interpreter's own venv module gives a
  # venv that has pip and resolves dependencies from PyPI normally.
  #
  # Two details matter here:
  #   - python@3.11 is a formula name, not an executable. The interpreter
  #     is resolved via opt_bin so a real python3.11 is invoked, and so
  #     the venv's symlinks land on the stable opt path (rather than a
  #     versioned Cellar path) and survive python@3.11 patch upgrades.
  #   - pip installs buildpath, the extracted sdist that the url/sha256
  #     pair above describes, so the checksummed artifact is the one
  #     actually installed.
  def install
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink libexec/"bin/ctxme"
    bin.install_symlink libexec/"bin/ctx"
  end

  test do
    ENV["CTXME_UPDATE_CHECK"] = "0"
    assert_match version.to_s, shell_output("#{bin}/ctxme --version")
    assert_match version.to_s, shell_output("#{bin}/ctx --version")
  end
end
