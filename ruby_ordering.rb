require_relative './restaurant.rb'
require 'colorize'
require 'tty-table'

if ARGV.first == "-h" || ARGV.first == "-help"
    puts "\nThis app will help restaurants take orders from customers without the need for waitstaff.\n\nTo start the app, simply type 'ruby ruby_ordering.rb'"
    puts
    exit
elsif ARGV.first == "-v" || ARGV.first == "-version"
    puts "\nThis is version 1.0 of Sams Ordering App"
    puts
    exit
elsif ARGV.first == "-a" || ARGV.first == "-all"
    puts "
    -a              list all command line arguments
    -all            list all command line arguments
    -h              help
    -help           help
    -v              show version information
    -version        show version information"
    puts
    exit
end

menu = {"RED CURRY" => 15.00, "GREEN CURRY" => 15.00, "BEEF MASSAMAN" => 15.50, "PAD THAI" => 12.50, "PAD SEE EW" => 12.50, "PAD KEE MAO" => 12.50, "CASHEW NUT" => 12.00, "CHILLI BASIL" => 12.00, "TOM YUM SOUP" => 5.00, "COKE" => 3.50, "ICE TEA" => 3.50, "WATER" => 3.00}

restaurant = Restaurant.new("Sam's New-World Restaurant", menu)
puts
puts restaurant.welcome_art
restaurant.intro
puts 
restaurant.print_menu
puts

loop do
    puts "What would you like to order? Type your choice, then hit enter. When you are finished, type 'done'\n".colorize(:magenta).bold
    input = gets.strip.upcase
    puts
    item = restaurant.menu.check_item(input)
 
    if item == nil
        puts "Sorry, please check the spelling and try again\n".colorize(:cyan)
    end

    if (input == "DONE")
        break
    end

    if (item)
        puts "How many would you like?\n".colorize(:magenta).bold
        amount = gets.to_i
        puts
        if (amount > 0)
            restaurant.add_to_order(item, amount)
        else puts "Sorry, please enter a valid number and start again\n".colorize(:cyan)
        end
    end
end

system "clear"
restaurant.print_order
puts restaurant.goodbye_art
restaurant.daily_orders
restaurant.review_app
