require_relative('song')

class Guest

  attr_reader :name, :song
  attr_accessor :money

  def initialize(name,money,song)
    @name = name
    @money = money
    @song = Song.new(song)
  end

  def check_favourite_song(playlist)
    response = "Woo! I love this song!" if playlist.include?(@song) == true
    return response
    # puts response
  end


end

guest1 = Guest.new("Colin",100,"Help")
puts guest1.name
puts guest1.money.to_i
puts guest1.song.to_s