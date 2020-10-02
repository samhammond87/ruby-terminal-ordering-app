require_relative './menu'
require_relative './order'
require 'colorize'
require "tty-prompt"

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
    
    def print_order  
        puts
        puts "Your order has been processed!\n\nTotal:    $%.2f".colorize(:cyan).bold % order_total
    end

    def daily_orders
        File.write("daily_orders.txt", "$%.2f" % "#{order_total}", mode: "a")
    end

    def review_app
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "Before You Go!".colorize(:magenta).bold
        puts
        review = prompt.select("How easy was Sams Terminal App to use?".colorize(:magenta), %w(Easy-Peasy Normal Hard Impossible))
        File.write("daily_orders.txt", " - #{review}\n", mode: "a")
        puts
        puts "Thanks for letting us know!".colorize(:magenta).bold
    end
end

