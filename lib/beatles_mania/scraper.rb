class BeatlesMania::Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.timeout.com/london/music/the-best-beatles-songs"))
  end

  def self.scrape_songs
    self.get_page.css("article").each.with_index do |song, i|
      #ranking = song.css("div.FranklinGothic number xs-absolute xs-text-center xs-z1 xs-text-4 xs-line-height-2 xs-fill-charcoal xs-text-white squared xs-px3>div")
      song_title = song.search(".title-underline.theme-title-underline")[i].children.text
      song_description = song.css("div.js-card-desc-content>p")[i].text
      binding.pry
        #song number
        puts "\n" "Title: " + "\n" + song_title
        puts "\n" + "Description: " + "\n" + song_description
        #puts ranking
        #binding.pry
        #to-do: print title of song
        #list in numerical order
        #connect to SONG.rb
    end
  end

  def make_songs
    scrape_songs.each do |song|
      BeatlesMania::Song.new(song)
    end
  end
end
