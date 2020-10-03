require_relative '../src/restaurant'
require_relative '../src/menu_item'
require_relative '../src/menu'
require_relative '../src/order'

describe Menu do
    it "should be able to get an item price" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.find_price(name)).to eq(price)
    end

    it "should return the item name for a valid item" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.check_item(name)).to eq(name)
    end
    it "should return nil for an invalid item" do
        name = "coke"
        price = 3.50
        menu = Menu.new
        menu.add_item(name, price)
        expect(menu.check_item("fanta")).to eq(nil)
    end
end

describe Order do
    it "should add an item quantity" do
        order = Order.new
        name = "coke"
        quantity = 2
        quantity_add = 3
        order.add_item(name, quantity)
        order.add_item(name, quantity_add)
        expect(order.find_items()[name]).to be(quantity + quantity_add)
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
        menu_items = {"coke" => 3.50, "pad thai" => 12.50}
        restaurant = Restaurant.new(name, menu_items)
        expect(restaurant.menu.find_items.length).to be(2) 
    end  
    it "should add an item to order" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.50}
        restaurant = Restaurant.new(name, menu_items)
        item = "coke"
        quantity = 1
        restaurant.add_to_order(item, quantity)
        expect(restaurant.find_order().find_items().length).to be(1)
    end
    it "should define a print_menu method" do
        name = ""
        menu_items = {coke: 3.50, "pad thai" => 12.50}
        restaurant = Restaurant.new(name, menu_items) 
        expect(restaurant.print_menu).to eq(nil)
    end

    it "should work out the order total" do
        name = ""
        menu_items = {"coke" => 3.50, "pad thai" => 12.50}
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