require './lib/stations'
require './lib/lines'
require 'pg'

DB = PG.connect({:dbname=>'train_world'})

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
    puts "[1] Create a new line"
    puts "[2] Create a new station"
    puts "[3] Add a station to a line"
    puts "[4] Delete a line"
    puts "[x] Exit to Main Menu\n\n"
    print "Choose option: "
    menu_choice = gets.chomp
    if menu_choice == '1'
      create_line
    elsif menu_choice == '2'
      create_station
    elsif menu_choice == '3'
      add_station_to_line
    elsif menu_choice == '4'
      delete_line
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
    puts "[3] Delete a station"
    puts "[x] Exit to Main Menu\n\n"
    print "Choose option: "
    menu_choice = gets.chomp
    if menu_choice == '1'
      view_lines
    elsif menu_choice == '2'
      view_stations
    elsif menu_choice == '3'
      delete_station
    elsif menu_choice == 'x'
      main_menu
    else
      puts "Failed."
    end
  end
end

def create_line
  puts "Enter a description of the line: "
  line_input = gets.chomp
  Line.new({:name =>line_input}).save
  puts "#{Line.all.last.name} added to the train lines.\n\n"
end

def create_station
  puts "Enter a description of the station: "
  station_input = gets.chomp
  Station.new({:name => station_input}).save
  puts "#{Station.all.last.name} added to the train stations"
end

def delete_line
  view_lines
  puts "Which line would you like to delete?"
  line_choice = gets.chomp.to_i
  current_line = Line.find(line_choice)
  current_line.delete
  view_lines
end

def delete_station
  view_stations
  puts "Which station would you like to delete?"
  station_choice = gets.chomp.to_i
  current_station = Station.find(station_choice)
  current_station.delete
  view_stations
end

def view_lines
  puts "[id] - Line name"
  Line.all.each do |line|
    puts "[#{line.id}] #{line.name}"
  end
  puts "\n\n"
end

def view_stations
  puts "[id] - Station name"
  Station.all.each do |station|
    puts "[#{station.id}] #{station.name}"
  end
  puts "\n\n"
end

def view_by_line(line_id)
  current_line = Line.find(line_id)
  puts "#{current_line.name} line stations: "
  puts "[id] Station Name"
  current_line.get_stations.each do |station|
    puts "[#{station.id}] #{station.name}"
  end
  puts "\n\n"
end

def add_station_to_line
  view_lines
  puts "Enter the line you would like to add a station to."
  line_choice= gets.chomp.to_i
  current_line = Line.find(line_choice)
  view_stations
  puts "Choose a station to add to the line"
  station_choice = gets.chomp.to_i
  current_line.add_station(station_choice)
  puts "Added.\n\n"
  view_by_line(line_choice)
end

main_menu
