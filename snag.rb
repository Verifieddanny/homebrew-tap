class Snag < Formula
  desc "Grab media from anywhere. Paste a link. Get your video."
  homepage "https://github.com/Verifieddanny/snag"
  url "https://github.com/Verifieddanny/snag/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "go" => :build
  depends_on "yt-dlp"
  depends_on "ffmpeg"

  def install
    cd "snag-cli" do
      system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/snag/"
    end
  end

  test do
    assert_match "URL is required", shell_output("#{bin}/snag 2>&1", 0)
  end
end
