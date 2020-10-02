require_relative './restaurant.rb'
require 'colorize'

menu = {"red curry" => 15.00, "green curry" => 15.00, "beef massaman" => 15.50, "pad thai" => 12.50, "pad see ew" => 12.50, "pad kee mao" => 12.50, "cashew nut" => 12.00, "chilli basil" => 12.00, "tom yum soup" => 5.00, "coke" => 3.50, "ice tea" => 3.50, "water" => 3.00}

restaurant = Restaurant.new("Sam's New-World Restaurant", menu)
puts
puts restaurant.welcome_art
restaurant.intro
puts 
restaurant.print_menu
puts

loop do

    puts "What would you like to order? Type your choice, then hit enter. When you are finished, type 'done'\n".colorize(:magenta).bold
    input = gets.strip.downcase
    puts
    item = restaurant.menu.validate_item(input)
 
    if item == nil
        puts "Sorry, please check the spelling and try again\n".colorize(:cyan)
    end

    if (input == "done")
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
restaurant.daily_orders
restaurant.print_order
puts restaurant.goodbye_art
restaurant.review_app
