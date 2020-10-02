require_relative './restaurant.rb'
require 'colorize'
require "tty-prompt"

prompt = TTY::Prompt.new

menu = {"red curry" => 15.00, "green curry" => 15.00, "beef massaman" => 15.50, "pad thai" => 12.50, "pad see ew" => 12.50, "pad kee mao" => 12.50, "cashew nut" => 12.00, "chilli basil" => 12.00, "tom yum soup" => 5.00, "coke" => 3.50, "ice tea" => 3.50, "water" => 3.00}

restaurant = Restaurant.new("Sam's New-World Restaurant", menu)

puts restaurant.welcome_art

restaurant.intro
puts 

restaurant.print_menu
puts

loop do
    puts "What would you like to order? When you are finished, type 'done'\n".colorize(:magenta).bold
    input = gets.strip.downcase
    puts
    
    if (input == "done")
        break
    end

    item = restaurant.menu.validate_item(input)
    if (item)
        puts "How many would you like?\n".colorize(:magenta).bold
        quantity = gets.to_i
        puts
        if (quantity > 0)
            restaurant.add_to_order(item, quantity)
        end
    end
end

puts
restaurant.print_order
puts restaurant.goodbye_art

puts "Before You Go!".colorize(:magenta)
prompt.select("How easy was Sams Terminal App to use?".colorize(:magenta), %w(Easy-Peasy Normal Hard Impossible))
puts "Thanks for letting us know!".colorize(:magenta)
