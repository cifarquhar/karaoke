class Song

attr_reader  :title

  def initialize(title)
    @title = title.downcase
  end

end