require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../song.rb')


class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Hej Joe")
  end

  def test_has_title
    assert_equal("Hej Joe", @song.title)
  end

end
