require_relative './cafe'

# Create an instance of cafe
menu = {"latte" => 4.00, "tea" => 3.00, "toastie" => 5.00}
cafe = Cafe.new("Sam's Cafe", menu)

puts
cafe.welcome
puts 
loop do
    cafe.print_menu
    puts
    puts "What would you like to order? When you are finished, type 'done'"
    input = gets.strip.downcase
   
    # if 'done', break from loop
    if (input == "done")
        break
    end

    # Check for valid menu item
    item = cafe.menu.validate_item(input)
    if (item)
        puts "How many would you like?"
        quantity = gets.to_i
        if (quantity > 0)
            cafe.add_to_order(item, quantity)
        end
    end
end

# print the order summary
cafe.print_order
