require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php53Protobuf < AbstractPhp53Extension
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
    sha256 "42d5f082298549122a516d69ad714987eb582c7138da8b7d33356568c62f93bf" => :el_capitan
    sha256 "b2a4a57cd721ec9c2d8f9e0e5543dad685b8a805c9936e1dd0b58a9e0e55493b" => :yosemite
    sha256 "ee49a5e1fbd86582aadf1e7ca65a6973629b58581f1f3aa839c95e18f77d4bec" => :mavericks
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/protobuf.so"
    write_config_file if build.with? "config-file"
  end
end
