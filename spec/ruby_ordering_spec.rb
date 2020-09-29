require_relative '../restaurant'
require_relative '../menu_item'
require_relative '../menu'
require_relative '../order'

describe MenuItem do
    it "should return the price of the item" do
        name = "coke"
        price = 3.50
        menu_item = MenuItem.new(name, price)
        expect(menu_item.price).to eq(price)
    end
    it "should return the name of the item" do
        name = "coke"
        price = 3.50
        menu_item = MenuItem.new(name, price)
        expect(menu_item.name).to eq(name)
    end
end

describe Menu do
    it "should be able to get an item price" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.get_price(name)).to eq(price)
    end
    it "should be able to add an item" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.get_items().length).to be(1)        
    end
    it "should return the item name for a valid item" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.validate_item(name)).to eq(name)
    end
    it "should return nil for an invalid item" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.validate_item("pad thai")).to eq(nil)
    end
end
describe Order do
    it "should add an item to the order" do
        order = Order.new
        name = "coke"
        quantity = 2
        order.add_item(name, 2)
        order.add_item(name, 3)
        expect(order.get_items().length).to be(1)
    end
    it "should update an item quantity" do
        order = Order.new
        name = "coke"
        quantity = 2
        quantity_add = 3
        order.add_item(name, quantity)
        order.add_item(name, quantity_add)
        expect(order.get_items()[name]).to be(quantity + quantity_add)
    end
end
    
describe Restaurant do
    it "should create a restaurant with a name" do
        name = ""
        menu_items = {}
        restaurant = Restaurant.new(name, menu_items)
        expect(restaurant.name).to eq(name)
    end
    it "should create a restaurant with a menu" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.00}
        restaurant = Restaurant.new(name, menu_items)
        expect(restaurant.menu.get_items.length).to be(2) 
    end  
    it "should add an item to order" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.00}
        restaurant = Restaurant.new(name, menu_items)
        item = "coke"
        quantity = 1
        restaurant.add_to_order(item, quantity)
        expect(restaurant.get_order().get_items().length).to be(1)
    end
    it "should define a welcome method" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.00}
        restaurant = Restaurant.new(name, menu_items)
        expect(restaurant.welcome).to eq(nil)
    end
    it "should define a print_menu method" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.00}
        restaurant = Restaurant.new(name, menu_items) 
        expect(restaurant.print_menu).to eq(nil)
    end

    it "should calculate order total" do
        name = ""
        menu_items = {"coke" => 3.50, "pad thai" => 12.00}
        restaurant = Restaurant.new(name, menu_items)
        item = "coke"
        quantity = 1
        restaurant.add_to_order(item, quantity)
        item = "coke"
        quantity = 2
        restaurant.add_to_order(item, quantity)
        expect(restaurant.order_total).to be(10.50)
    end
end