require_relative './restaurant.rb'

menu = {"red curry" => 15.00, "green curry" => 15.00, "beef massaman" => 15.50, "pad thai" => 12.50, "pad see ew" => 12.50, "pad kee mao" => 12.50, "cashew nut" => 12.00, "chilli basil" => 15.00, "tom yum soup" => 5.00, "coke" => 3.50, "ice tea" => 3.50, "water" => 3.00}
restaurant = Restaurant.new("Sam's New World Thai Restaurant", menu)

puts
restaurant.welcome
puts 
loop do
    restaurant.print_menu
    puts
    puts "What would you like to order? When you are finished, type 'done'"
    input = gets.strip.downcase
    
    if (input == "done")
        break
    end

    item = restaurant.menu.validate_item(input)
    if (item)
        puts "How many would you like?"
        quantity = gets.to_i
        if (quantity > 0)
            restaurant.add_to_order(item, quantity)
        end
    end
end

puts
restaurant.print_order
puts