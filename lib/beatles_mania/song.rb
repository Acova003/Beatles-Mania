class BeatlesMania::Song
  attr_accessor :title, :description, :url
  ALL = []

  def initialize
    @title = title
    @description = description
    @url = url
    ALL << self
  end

  def self.all
    ALL
  end

  def self.top_songs
    self.scrape_songs
  end

  def self.scrape_songs
    doc = Nokogiri::HTML(open("http://ultimateclassicrock.com/beatles-lyrics/"))
    #scrape beatles website and return info
    #extract properties
    #instantiate song
    binding.pry
    [song] #array of all songs
  end
end
