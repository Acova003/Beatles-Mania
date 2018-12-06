class BeatlesMania::CLI
  def start
    BeatlesMania::Scraper.make_songs
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
    BeatlesMania::Scraper.print_songs
  end

  def menu
    puts "Which top 25 Beatles song would you like to learn more about? (1-25)"
    puts '>'
    user_input = gets.strip.to_i

    if user_input.between?(1,25)
      #excludes first title 'top 50 pop songs'
      song_choice = BeatlesMania::Song.all[49 - user_input]
      puts ""
      puts "Title: "
      puts song_choice.title
      puts ""
      puts "Description: "
      puts song_choice.description
    else
      puts "Invalid input. Please choose a number (1-25)".red
      menu
    end
    continue?
  end

  def continue?
    puts ""
    puts "Would you like to choose another song? (Y/N)"
    user_input = gets.chomp.upcase
    if user_input == 'Y'
      start
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
