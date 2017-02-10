require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class SongSpec < MiniTest::Test

  def setup()
    @song1 = Song.new("Bohemian Rhapsody")
  end



end