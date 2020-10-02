class MenuItem
    attr_reader :price, :name
    def initialize(name, price)
        @name = name
        @price = price
    end

    def to_s # overides to_s method for better formatting
        return "            #{@name}".colorize(:magenta) + " " *(20 - @name.length) + ".....  #{@price}".colorize(:magenta)   
    end
end
