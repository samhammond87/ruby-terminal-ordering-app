require_relative './restaurant.rb'
require_relative './order.rb'
require 'colorize'
require 'tty-table'

if ARGV[0] == "-a" || ARGV[0] == "-all"
    puts "
    -a              list all commands
    -all            list all commands
    -h              show help
    -help           show help
    -v              show which version is installed
    -version        show which version installed"
    puts
    exit
elsif ARGV[0] == "-h" || ARGV[0] == "-help"
        puts "\nThis app will help restaurants take orders from customers without the need for waitstaff.\n\nTo start the app, simply type './run_app.sh' or 'ruby main.rb'"
        puts
        exit
elsif ARGV[0] == "-v" || ARGV[0] == "-version"
        puts "\nThis is version 1.0 of Sams Ordering App"
        puts
        exit    
end

menu = {"RED CURRY" => 15.00, "GREEN CURRY" => 15.00, "BEEF MASSAMAN" => 15.50, "PAD THAI" => 12.50, "PAD SEE EW" => 12.50, "PAD KEE MAO" => 12.50, "CASHEW NUT" => 12.00, "CHILLI BASIL" => 12.00, "TOM YUM SOUP" => 5.00, "COKE" => 3.50, "ICE TEA" => 3.50, "WATER" => 3.00}

restaurant = Restaurant.new("Sam's Covid-Safe Restaurant", menu)
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
 
    if (input == "DONE")
        break
    end
    
    if item == nil
        puts "Sorry, please check the spelling and try again\n".colorize(:cyan)
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
# order.user_order
restaurant.daily_orders
restaurant.review_app
