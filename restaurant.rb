require_relative './menu'
require_relative './order'

class Restaurant
    attr_reader :name, :menu
    def initialize(name, menu_items)
        @name = name
        @menu = Menu.new
        fill_menu(menu_items)
        @order = Order.new
    end
   
    def fill_menu(menu_items)
        menu_items.each do |name, price| 
            @menu.add_item(name, price)
        end
    end

    def add_to_order(item, quantity)
        @order.add_item(item, quantity)
    end
    
    def find_order
        return @order
    end

    def welcome
        puts "Welcome to #{name}!"
    end

    def print_menu
        return @menu.display
    end

    def order_total
        total = 0
        @order.find_items.each do |item,quantity|
            total += @menu.find_price(item)* quantity
        end
        return total
    end
    
    def print_order  
        if @order 
            puts "Total:    $%.2f" % order_total
        else
            puts "Thank you for coming!"
        end
    end
end

