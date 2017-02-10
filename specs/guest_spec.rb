require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestSpec < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Colin")
  end



end