class Guest

  attr_reader :name, :song
  attr_accessor :money

  def initialize(name,money,song)
    @name = name
    @money = money
    @song = song.downcase
  end

  def check_favourite_song(playlist)
    response = "Woo! I love this song!" if playlist.include?(@song) == true
    return response
    puts response
  end


end