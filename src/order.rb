class Order
    def initialize
        @order_items = Hash.new(0)          
    end
    def add_item(name, amount)
        @order_items[name] += amount
                #     ^ key     ^ value
        File.write("user_order_items.txt", "#{name}" + " - " + "#{amount}, ", mode: "a")
        # return 
    end
    def find_items
        return @order_items
    end
end