require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../room.rb')


class TestRoom < MiniTest::Test

  def setup
    @room_1 = Room.new("1")
  end

  def test_room_has_nr
    assert_equal("1", @room_1.number)
  end

end
