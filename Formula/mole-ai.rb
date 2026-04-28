class MoleAi < Formula
  desc "AI-enhanced macOS system maintenance CLI"
  homepage "https://github.com/xronocode/mole-ai"
  url "https://github.com/xronocode/mole-ai/archive/refs/tags/v1.37.0-ai.1.tar.gz"
  sha256 "e80f62429d29d07f127d1a431dd177628614a5b3a354bb9b8e8b4123cf6d9265"
  license "MIT"

  depends_on "bash"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mole" => "mole-ai"
    bin.install_symlink libexec/"mole" => "mo"
  end

  def caveats
    <<~EOS
      Run `mo advisor --setup` to configure the AI endpoint.
      Works with Ollama, OpenRouter, vLLM, LM Studio, etc.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/mo --version")
  end
end
