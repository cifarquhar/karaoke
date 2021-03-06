class Room

  attr_accessor :guests, :songs
  attr_reader :entry_fee

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
    if @guests.count < @capacity && can_afford_entry(guest)
      @guests << guest
      collect_entry_fee(guest)
    elsif @guests.count >= @capacity
      return "Sorry, room is already full."
    elsif !can_afford_entry(guest)
      return "Sorry, you can't afford entry."
    else
      return
      "Sorry, I can't check you in right now."
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

  def collect_entry_fee(guest)
    if can_afford_entry(guest) == true
      guest.money -= @entry_fee 
    else
      return "Sorry, you can't afford entry."
    end
  end

  def add_to_tab(guest,amount)
    guest.tab += amount
  end

end