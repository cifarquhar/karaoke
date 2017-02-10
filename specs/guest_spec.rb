require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestSpec < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Colin",100)
  end


  def test_guest_has_name
    assert_equal("Colin",@guest1.name)
  end

  def test_guest_has_money
    assert_equal(100,@guest1.money)
  end


end