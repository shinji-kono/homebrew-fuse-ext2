require "formula"

class FuseExt2 < Formula
  HOMEBREW_BREWALL_VERSION = '0.0.9.0'
  depends_on "e2fsprogs"
  depends_on "automake"
  depends_on "autoconf"
  depends_on "libtool"
  homepage "https://github.com/shinji-kono/homebrew-fuse-ext2.git"
  url "https://github.com/shinji-kono/homebrew-fuse-ext2.git"
  head "https://github.com/shinji-kono/homebrew-fuse-ext2.git"
  skip_clean 'bin'
  version "0.0.9"
  def install
    system "git clone https://github.com/alperakcan/fuse-ext2.git"
    chdir "fuse-ext2"
    system "./autogen.sh"
    system "CFLAGS=\"-idirafter/\$(brew --prefix e2fsprogs)/include -idirafter/usr/local/include/osxfuse\" LDFLAGS=\"-L\$(brew --prefix e2fsprogs)/lib\" ./configure"
    system "make" "-j4"
    system "make" "install"
    #  prefix.install 'bin'
    # (bin+'brewall').chmod 0755
  end
end
