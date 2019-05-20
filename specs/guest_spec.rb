require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../guest.rb')


class TestGuest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Marcin", 50, "Hey Joe")
  end

  def test_guest_has_name
    assert_equal("Marcin", @guest_1.name)
  end

  def test_guest_has_money
    assert_equal(50, @guest_1.money)
  end

  def test_guest_have_fav_song
    assert_equal("Hey Joe", @guest_1.favourite_song)
  end

end
