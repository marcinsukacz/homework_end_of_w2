require ('Minitest/autorun')
require ('Minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')


class TestRoom < MiniTest::Test

  def setup
    @room_1 = Room.new("1", 4)
    @guest_1 = Guest.new("John", 30, "Hey Joe")
    @guest_2 = Guest.new("Josh", 40, "Yesterday")
    @guest_3 = Guest.new("Jason", 50, "")
    @guest_4 = Guest.new("Jordan", 60, "")
    @guest_5 = Guest.new("Marcin", 70, "")

  end

  def test_room_has_nr
    assert_equal("1", @room_1.number)
  end

  def test_counting_guests_in_room
    assert_equal(0, @room_1.count_guests())
  end

  def test_room_can_add_guests__yes
    @room_1.check_in_guest(@guest_1)
    assert_equal(1, @room_1.count_guests())
  end

  def test_room_can_track_income
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    assert_equal(20, @room_1.income)
  end

  def test_room_can_add_guests__no
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    @room_1.check_in_guest(@guest_4)
    assert_equal(4, @room_1.count_guests())
    assert_equal("No more places", @room_1.check_in_guest(@guest_5))
  end

  def test_guest_is_inside
    @room_1.check_in_guest(@guest_1)
    assert_equal(true, @room_1.guest_inside?(@guest_1))
  end

  def test_room_can_remove_guests
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_out_guest(@guest_1)
    assert_equal(false, @room_1.guest_inside?(@guest_1))
  end

  def test_rooms_assigned_songs
    assert_equal(0, @room_1.count_songs())
  end

  def test_adding_songs
    @room_1.add_song("Hey Joe")
    assert_equal(1, @room_1.count_songs())
  end

  def test_room_has_places
    assert_equal(4, @room_1.num_of_places())
  end

  def test_places_availability
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    assert_equal(2, @room_1.places_left?())
  end

  def test_can_charge_guest
    @room_1.check_in_guest(@guest_1)
    assert_equal(20, @guest_1.money)
  end

  def test_song_in?
    #@room_1.check_in_guest(@guest_1)
    @room_1.add_song("Hey Joe")
    assert_equal(true, @room_1.song_in?("Hey Joe"))
  end

  def test_guest_can_cheer
    @room_1.check_in_guest(@guest_1)
    @room_1.add_song("Hey Joe")
    assert_equal("Whoo!", @guest_1.cheer(@room_1))
  end

  # def test_if_no_spaces
  #   @room_1.check_in_guest("John")
  #   @room_1.check_in_guest("Josh")
  #   @room_1.check_in_guest("Jason")
  #   @room_1.check_in_guest("Jordan")
  #   assert_equal("No more places", @room_1.check_in_guest("Marcin"))
  # end

end
