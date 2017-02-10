require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class SongSpec < MiniTest::Test

  def setup()
    @song1 = Song.new("Bohemian Rhapsody")
  end


  def test_song_has_title
    assert_equal("Bohemian Rhapsody",@song1.title)
  end



end