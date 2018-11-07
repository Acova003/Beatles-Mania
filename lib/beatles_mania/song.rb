class BeatlesMania::Song
  attr_accessor :title, :description, :url

  ALL = []

  def initialize(title= nil, description=nil, url=nil)
    @title = title
    @description = description
    @url = url
    ALL << self
  end

  def self.all
    ALL
  end
end
