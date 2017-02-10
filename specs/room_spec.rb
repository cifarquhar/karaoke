require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class RoomSpec < MiniTest::Test

  def setup()
    @room1 = Room.new

    @guest1 = Guest.new("Colin")
    @guest2 = Guest.new("Jim")

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


end