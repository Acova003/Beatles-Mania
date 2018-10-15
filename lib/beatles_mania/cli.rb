class BeatlesMania::CLI
  def start
    puts ""
    puts ""
    puts "                        Welcome ".blue + "to " + "Beatles Mania!".red
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts ""
    menu
  end

  def menu
    #scrape
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
    puts "To choose another song, type '1'. To exit, type '2'"
    user_input = gets.strip
    if user_input == '1'
      menu
    elsif user_input == '2'
      goodbye
    else
      puts "Invalid input. Please type '1' or '2'".red
      continue?
    end
  end

  def goodbye
    puts "Goodbye"
  end
end
