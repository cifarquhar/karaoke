require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class GuestSpec < MiniTest::Test

  def setup()
   
    @song1 = Song.new("Help")

    @guest1 = Guest.new("Colin",100,@song1)

    @room1 = Room.new("small",15)

   
  end


  def test_guest_has_name
    assert_equal("Colin",@guest1.name)
  end

  def test_guest_has_money
    assert_equal(100,@guest1.money)
  end

  def test_guest_likes_song
    @room1.add_song(@song1)
    assert_equal([@song1],@room1.songs)
    actual = @guest1.check_favourite_song(@room1.songs)
    assert_equal("Woo! I love this song!",actual)
  end

end