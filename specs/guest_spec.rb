require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestSpec < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Colin")
  end


  def test_guest_has_name
    assert_equal("Colin",@guest1.name)
  end


end