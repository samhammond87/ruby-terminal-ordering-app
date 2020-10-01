require_relative './menu'
require_relative './order'
require 'colorize'

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

    def welcome_art
        File.readlines("ascii_welcome_art.txt") do |line|
          puts line
        end
    end

    def intro
        puts "At #{name} Ordering Is Easier Than Ever!".colorize(:magenta)
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
    
    # Need help figuring out if/else statement
    def print_order  
        total = 0
        if total == @order_total
            puts "Thank you for coming!".colorize(:magenta)
        else
            puts "Total:    $%.2f".colorize(:magenta) % order_total
        end
    end
end

