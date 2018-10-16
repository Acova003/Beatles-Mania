class BeatlesMania::CLI
  def start
    welcome_banner
    list_songs
    menu
  end

  def welcome_banner
    puts ""
    puts ""
    puts "                        Welcome ".blue + "to " + "Beatles Mania!".red
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts ""
  end

  def list_songs
    # here doc - http://ultimateclassicrock.com/beatles-top-50/
    puts 'Something or Because'
    @songs = BeatlesMania::Song.top_songs
    @songs.each.with_index(1) do |song, i|
      puts "#{i}. #{song}"
    end 
    #scrape
  end

  def menu
    puts "Which top 50 Beatles song would you like to learn more about? (1-50)"
    puts '>'
    user_input = gets.strip.to_i
    #binding.pry
    if user_input.between?(1,50)
      puts @songs[user_input-1]
      #binding.pry
      #BeatlesMania::Scraper.get_lyrics(@user_input)
    else
      puts "Invalid input. Please choose a number (1-50)".red
      input
    end
    continue?
  end

  def continue?
    puts ""
    puts "Would you like to choose another song? (Y/N)"
    user_input = gets.chomp.upcase
    if user_input == 'Y'
      menu
    elsif user_input == 'N'
      goodbye
    else
      puts ""
      puts "Invalid input".red
      continue?
    end
  end

  def goodbye
    puts "Goodbye"
  end
end
