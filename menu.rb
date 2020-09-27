require_relative './menu_item'

class Menu
    def initialize
        @menu_items = []
    end
    def add_item(name, price)
        menu_item = MenuItem.new(name, price)
        @menu_items << menu_item 
    end

    def get_price(name)
        item = @menu_items.find {|menu_item| menu_item.name === name}
        return item.price
    end

    def get_items
        return @menu_items
    end

    def display
        puts "Menu"
        puts "-----"
        @menu_items.each {|item| puts item}
        return nil
    end
end
