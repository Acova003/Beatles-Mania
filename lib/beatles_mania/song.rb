class BeatlesMania::Song
  attr_accessor :title, :description

  @@all = []

  def initialize(title= nil, description=nil)
    @title = title
    @description = description
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  #binding.pry
end
