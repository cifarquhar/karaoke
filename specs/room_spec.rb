require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class RoomSpec < MiniTest::Test

  def setup()
    @room1 = Room.new("small")
    @room2 = Room.new("medium")
    @room3 = Room.new("large")

    @guest1 = Guest.new("Colin")
    @guest2 = Guest.new("Jim")
    @guest3 = Guest.new("Sue")
    @guest4 = Guest.new("Emma")
    @guest5 = Guest.new("Nick")
    @guest6 = Guest.new("Amy")


    @song1 = Song.new("Bohemian Rhapsody")
  end


  def test_new_room_empty
    assert_equal(0,@room1.guests.count)
  end

  def test_new_room_has_no_songs
    assert_equal(0,@room1.songs.count)
  end

  def test_check_in_guest
    initial_guests = @room1.guests.count
    @room1.check_in(@guest1)
    assert_equal(initial_guests + 1, @room1.guests.count)
  end

  def test_check_out_guest
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    initial_guests = @room1.guests.count
    @room1.check_out(@guest2)
    assert_equal(initial_guests - 1,@room1.guests.count)
  end

  def test_add_song
    initial_playlist = @room1.songs.count
    @room1.add_song(@song1)
    assert_equal(initial_playlist + 1,@room1.songs.count)
  end

  def test_room_capacity_check
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    @room1.check_in(@guest4)
    @room1.check_in(@guest5)
    expected = "Sorry, room is already full"
    actual = @room1.check_in(@guest6)
    assert_equal(expected,actual)
  end


end