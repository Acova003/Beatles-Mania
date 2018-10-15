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
    puts 'Something or Because'
    #scrape
  end

  def menu
    puts 'Enter the song that you would like to know more about: (1-50)'
    input
  end

  def input
    puts '>'
    @user_input = gets.strip
    if @user_input.to_i.between?(1,50)
      #binding.pry
      #BeatlesMania::Scraper.get_lyrics(@user_input)
    else
      puts "Invalid input. Please choose a number between 1-10".red
      menu
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
      puts "Invalid input. Please type 'Y' or 'N'".red
      continue?
    end
  end

  def goodbye
    puts "Goodbye"
  end
end
