class Room

  attr_accessor :guests, :songs

  def initialize()
    @guests = []
    @songs = []
  end


  def check_in(guest)
    @guests << guest
  end

  def check_out(guest)
    @guests.delete(guest)
  end

end