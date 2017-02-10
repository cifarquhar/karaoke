class Room

  attr_accessor :guests, :songs

  def initialize(size)
    @guests = []
    @songs = []
    @capacity = case size
                  when "small"
                    5
                  when "medium"
                    10
                  when "large"
                    15
                  end
  end


  def check_in(guest)
    @guests << guest
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

end