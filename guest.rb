class Guest

  attr_reader :name
  attr_accessor :money

  def initialize(name,money)
    @name = name
    @money = money
  end


end