class GfComplete < Formula
  desc "Comprehensive Library for Galois Field Arithmetic"
  homepage "https://web.archive.org/web/20191024182742/jerasure.org/"
  url "http://lab.jerasure.org/jerasure/gf-complete/repository/archive.tar.gz?ref=v2.0"
  sha256 "0654202fe3b0d3f8a220158699bdea722e47e7f9cbc0fd52e4857aba6a069ea9"

  bottle do
    cellar :any
    sha256 "72161cd13399401cc443fb99bd9e50bcf1030155268b326b05d861812d1a84de" => :catalina
    sha256 "6485d5f75f1d2ba75b3c1bac5a5d024cde64d7d96baf96c78eadc21199be4faf" => :mojave
    sha256 "d4049ea995b6cb143af5383a101d15df811f88ab3d2d4c21428db967898e1927" => :high_sierra
    sha256 "e6528a98b675a939a81a37ffd6f780c531a53dae8fc51eb8ec9277be1a363d37" => :sierra
    sha256 "7a00f4c71d8f2173a4a21f1638010ee149d927dfb0f95a901036290f9b6529b5" => :el_capitan
    sha256 "fd9172068e361c01e87a7a696e2ad6e7cee18f473cdd878a249e7df99e6cdf4a" => :yosemite
    sha256 "9f82edf4ac3d0207b91075dbc7656ab21f6ab82b7df12053bdbcbf9886109cd3" => :mavericks
  end

  disable! date: "2020-12-08", because: :unmaintained

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"gf_example_3"
  end
end
