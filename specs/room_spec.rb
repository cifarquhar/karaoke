require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../bar.rb')


class RoomSpec < MiniTest::Test

  def setup()
    @room1 = Room.new("small",15)
    @room2 = Room.new("medium",15)
    @room3 = Room.new("large",15)

    @song1 = Song.new("Bohemian Rhapsody")

    @guest1 = Guest.new("Colin",100,@song1)
    @guest2 = Guest.new("Jim",50,@song1)
    @guest3 = Guest.new("Sue",60,@song1)
    @guest4 = Guest.new("Emma",250,@song1)
    @guest5 = Guest.new("Nick",5,@song1)
    @guest6 = Guest.new("Amy",20,@song1)
    @guest7 = Guest.new("RandomTestDude",1000,@song1)

    @bar = Bar.new


   
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
    @room1.check_in(@guest6)
    expected = "Sorry, room is already full."
    actual = @room1.check_in(@guest7)
    assert_equal(expected,actual)
  end

  def test_guest_can_afford_entry
    actual = @room1.can_afford_entry(@guest1)
    assert_equal(true,actual)
  end

  def test_guest_cant_afford_entry
    actual = @room1.can_afford_entry(@guest5)
    assert_equal(false,actual)
  end

  def test_guest_has_paid
    @room1.collect_entry_fee(@guest1)
    assert_equal(85,@guest1.money)
  end

  def test_guest_hasnt_paid
    actual = @room1.collect_entry_fee(@guest5)
    assert_equal("Sorry, you can't afford entry.",actual)
  end


  def test_add_entry_to_guest_tab
    @room1.add_to_tab(@guest1,@room1.entry_fee)
    assert_equal(15,@guest1.tab)
  end

  def test_add_drink_to_guest_tab
    @room1.add_to_tab(@guest1,@bar.drinks[:beer])
    @room1.add_to_tab(@guest1,@bar.drinks[:wine])
    @room1.add_to_tab(@guest1,@bar.drinks[:cider])
    @room1.add_to_tab(@guest1,@bar.drinks[:vodka])
    assert_equal(22,@guest1.tab)
  end


end