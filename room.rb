class Room

  attr_accessor :guests, :songs

  def initialize(size,entry_fee)
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
    @entry_fee = entry_fee
  end


  def check_in(guest)
    if @guests.count < @capacity
      @guests << guest
    else
      return "Sorry, room is already full"
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end

  def can_afford_entry(guest)
    if guest.money >= @entry_fee
      return true
    else
      return false
    end
  end


end