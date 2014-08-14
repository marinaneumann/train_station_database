require './lib/stations'
require './lib/lines'

  def main_menu
    system("clear")
    loop do
      puts "(= Main Menu =)"
      puts "[1] Operator Menu"
      puts "[2] Rider Menu"
      puts "[x] Exit program\n\n"
      print "Choose option: "
      menu_choice = gets.chomp
      if menu_choice == '1'
        operator_menu
      elsif menu_choice == '2'
        rider_menu
      elsif menu_choice == 'x'
        puts "Travel on."
        exit
      else
        puts "Choose more wisely."
      end
    end
  end

  def operator_menu
    loop do
      puts "(= Operator Menu =)"
      puts "[1] Add a new line"
      puts "[2] Add a new station"
      puts "[3] Update a line with stations"
      puts "[x] Exit to Main Menu\n\n"
      print "Choose option: "
      menu_choice = gets.chomp
      if menu_choice == '1'
        create_line
      elsif menu_choice == '2'
        create_station
      elsif menu_choice == '3'
        add_station_to_line
      elsif menu_choice == 'x'
        main_menu
      else
        puts "Failed."
      end
    end
  end

  def rider_menu
    loop do
      puts "(= Rider Menu =)"
      puts "[1] View train lines"
      puts "[2] View train stations"
      puts "[x] Exit to Main Menu\n\n"
      print "Choose option: "
      menu_choice = gets.chomp
      if menu_choice == '1'
        view_lines
      elsif menu_choice == '2'
        view_stations
      elsif menu_choice == 'x'
        main_menu
      else
        puts "Failed."
      end
    end
  end

  def view_lines

  end

  def view_stations

  end

  def create_line

  end

  def create_station

  end

  def add_station_to_line

  end

main_menu
