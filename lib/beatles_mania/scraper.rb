class BeatlesMania::Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.timeout.com/london/music/the-best-beatles-songs"))
  end

  def self.make_songs
    songs = self.get_page.css(".listCard")

    list = songs.map do |post|
      song = BeatlesMania::Song.new
      if song.title != 'The 50 best pop songs '
        song.title = post.search('h3').text.strip.gsub(/‘/, '')
      end
      #binding.pry

      song.description = post.search('p').text.strip
      song.save
    end
  end

  def self.print_songs
    #binding.pry
    #self.make_songs
    BeatlesMania::Song.all.reverse.each.with_index(1) do |song, index|
        puts "#{ index }. #{ song.title }"
    end
  end

  def make_songs
    scrape_songs.each do |song|
      BeatlesMania::Song.new(song)
    end
  end
end