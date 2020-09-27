class MenuItem
    attr_reader :price, :name
    def initialize(name, price)
        @name = name
        @price = price
    end

    def to_s # overides to_s method for better formatting
        return "#{@name}" + " " *(10 - @name.length) + "... #{@price}"   
    end
end
