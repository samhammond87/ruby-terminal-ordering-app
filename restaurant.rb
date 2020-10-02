require_relative './menu'
require_relative './order'
require 'colorize'
require "tty-prompt"

prompt = TTY::Prompt.new

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

    def add_to_order(item, amount)
        @order.add_item(item, amount)
    end
    
    def find_order
        return @order
    end

    def welcome_art
        File.readlines("ascii_welcome_art.txt") do |line|
          puts line
        end
    end

    def goodbye_art
        puts
        puts "Thanks for using:".colorize(:cyan).bold
        puts
        File.readlines("ascii_goodbye_art.txt") do |line|
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
        @order.find_items.each do |item,amount|
            total += @menu.find_price(item)* amount
        end
        return total
    end
    
    # Need help figuring out if/else statement
    # def print_order  
    #     total = 0
    #     if total == @order_total
    #         puts "Thank you for coming!".colorize(:magenta)
    #     else
    #         puts "Total:    $%.2f".colorize(:magenta) % order_total
    #     end
    # end
    def print_order  
        puts
        puts "Your order has been processed!\n\nTotal:    $%.2f".colorize(:cyan).bold % order_total
    end
end

