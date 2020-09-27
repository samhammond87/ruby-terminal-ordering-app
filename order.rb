class Order
    def initialize
        @order_items = Hash.new(0)
# creates new hash with default value 0           
    end
    def add_item(name, quantity)
        @order_items[name] += quantity 
                #     ^ key     ^ value
    end
    def get_items
        return @order_items
    end
end