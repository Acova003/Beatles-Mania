class BeatlesMania::Scraper

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.timeout.com/london/music/the-best-beatles-songs"))
  end

  def self.make_songs
    songs = self.get_page.css(".listCard")

    list = songs.map do |post|
      song = BeatlesMania::Song.new
      if song.title != 'The 50 best pop songs'
        song.title = post.search('h3').text.strip.gsub(/‘,'/, "")
      end
      #deletes contributor name at the end of description
      song.description = post.search('p').text.split(' ')[0...-2].join(' ')
      song.save
    end
  end

  def self.print_songs
    BeatlesMania::Song.all.reverse.each.with_index do |song, index|
      if index <= 25 && !song.title.include?('The 50 best pop songs')
        puts "#{ index }. #{ song.title }"
      end
    end
  end

  def make_songs
    scrape_songs.each do |song|
      BeatlesMania::Song.new(song)
    end
  end
end
