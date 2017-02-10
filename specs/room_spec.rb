require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')


class RoomSpec < MiniTest::Test

  def setup()
    @room1 = Room.new
  end

end