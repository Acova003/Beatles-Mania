class BeatlesMania::Song
  attr_accessor :title, :album, :url
  def self.top_songs
    #scrape beatles website and return info
    song = self.new
    song.title = "Something"
    song.album = "Abbey Road"
    song.url = "http://ultimateclassicrock.com/beatles-top-50/"
    [song] #array of all songs
  end
end
