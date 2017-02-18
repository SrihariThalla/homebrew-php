require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Protobuf < AbstractPhp54Extension
  init
  desc "Fast PHP Protocol Buffers implementation"
  homepage "https://github.com/allegro/php-protobuf"
  url "https://github.com/allegro/php-protobuf/archive/v0.11.1.tar.gz"
  sha256 "949ece1ded96ff19597cd1f8ab5febffa77bcdf30c679d3f440fb42e8a090431"
  version_scheme 1
  head "https://github.com/allegro/php-protobuf.git"

  bottle do
    cellar :any_skip_relocation
    revision 1
    sha256 "3f828ff5b3e24bbe85b220b4ee731f965c911adcdff15ec3290aa3b49176aea8" => :el_capitan
    sha256 "963330d7bed30528c015a207ae7978dbecadb2a9c34ea9b44160a80e41adc3ea" => :yosemite
    sha256 "84a261c541f40c5ddb9225e52fd839247d5d2db983b1b5593e185e4372f09e06" => :mavericks
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/protobuf.so"
    write_config_file if build.with? "config-file"
  end
end
