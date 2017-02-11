require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')


class BarSpec < MiniTest::Test

  def setup()
    @bar1 = Bar.new
  end

  def test_bar_has_drinks
    assert_equal(false,@bar1.drinks.empty?)
  end




end