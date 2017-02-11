require_relative('song')

class Guest

  attr_reader :name, :song
  attr_accessor :money, :tab

  def initialize(name,money,song)
    @name = name
    @money = money
    @song = song
    @tab = 0
  end

  def check_favourite_song(playlist)
    response = "Woo! I love this song!" if playlist.include?(@song) == true
    return response
  end


end
