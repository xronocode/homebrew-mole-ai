class MoleAi < Formula
  desc "AI-enhanced macOS system maintenance CLI"
  homepage "https://github.com/xronocode/mole-ai"
  url "https://github.com/xronocode/mole-ai/archive/refs/tags/${TAG}.tar.gz"
  sha256 "${SOURCE_SHA}"
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
