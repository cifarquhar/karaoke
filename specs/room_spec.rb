require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')


class RoomSpec < MiniTest::Test

  def setup()
    @room1 = Room.new
  end


  def test_new_room_empty
    assert_equal(0,@room1.guests.count)
  end

  def test_new_room_has_no_songs
    assert_equal(0,@room1.songs.count)
  end


end