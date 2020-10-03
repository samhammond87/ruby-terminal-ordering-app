class Order
    def initialize
        @order_items = Hash.new(0)          
    end
    def add_item(name, amount)
        @order_items[name] += amount
                #     ^ key     ^ value
        return 
    end
    def find_items
        return @order_items
    end
    # def user_order
    #     # @order.find_items.each do |item,amount|
    #     File.write("user_order_items.txt", " - #{add_item}\n", mode: "a")
    # end
end