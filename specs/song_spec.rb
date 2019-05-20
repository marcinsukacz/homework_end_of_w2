require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../song.rb')


class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Hej Joe", "Rock")
  end

  def test_has_title
    assert_equal("Hej Joe", @song.title)
  end

  def test_has_genre
    assert_equal("Rock", @song.genre)
  end

end
