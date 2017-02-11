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

  def test_drink_prices
    assert_equal(5,@bar1.drinks[:beer])
    assert_equal(5,@bar1.drinks[:wine])
    assert_equal(2,@bar1.drinks[:cider])
    assert_equal(10,@bar1.drinks[:vodka])
  end




end