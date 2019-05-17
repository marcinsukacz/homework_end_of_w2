require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')


class TestRoom < MiniTest::Test

  def setup
    @room_1 = Room.new("1")
  end

  def test_room_has_nr
    assert_equal("1", @room_1.number)
  end

  def test_counting_guests_in_room
    assert_equal(0, @room_1.count_guests())
  end

  def test_room_can_add_guests
    @room_1.check_in_guest("John")
    assert_equal(1, @room_1.count_guests())
  end

  def test_guest_is_inside
    @room_1.check_in_guest("John")
    assert_equal(true, @room_1.guest_inside?("John"))
  end

  def test_room_can_remove_guests
    @room_1.check_in_guest("John")
    @room_1.check_in_guest("Josh")
    @room_1.check_out_guest("John")
    assert_equal(false, @room_1.guest_inside?("John"))
  end

  def test_rooms_assigned_songs
    assert_equal(0, @room_1.count_songs())
  end

  def test_adding_songs
    @room_1.add_song("Hey Joe")
    assert_equal(1, @room_1.count_songs())
  end

end
