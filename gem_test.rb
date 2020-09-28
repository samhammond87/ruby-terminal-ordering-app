require "tty-prompt"

prompt = TTY::Prompt.new

# prompt.ask("What is your name?")
# # => What is your name? (piotr)

# prompt.yes?("Do you like Ruby?")
# # => Do you like Ruby? (Y/n)

# prompt.mask("What is your secret?")
# # => What is your secret? ••••

# choices = %w(small medium large)

# choices = {small: 1, medium: 2, large: 3}
# prompt.select("What size?", choices)
# # =>
# # What size? (Press ↑/↓ arrow to move and Enter to select)
# # ‣ small
# #   medium
# #   large

# choices = [
#     {name: "small", value: 1},
#     {name: "medium", value: 2, disabled: "(out of stock)"},
#     {name: "large", value: 3}
#   ]

#   prompt.select("What size?") do |menu|
#     menu.choice "small", 1
#     menu.choice "medium", 2, disabled: "(out of stock)"
#     menu.choice "large", 3
#   end
#   # =>
#   # What size? (Press ↑/↓ arrow to move and Enter to select)
#   # ‣ small
#   # ✘ medium (out of stock)
#   #   large

# choices = {"Scorpion" => 1, "Kano" => 2, "Jax" => 3}
# prompt.select("Choose your destiny?", choices)

# prompt.select("Choose your destiny?") do |menu|
#     menu.default 3
  
#     menu.choice "Scorpion", 1
#     menu.choice "Kano", 2
#     menu.choice "Jax", 3
#   end

# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)

# choices = {vodka: 1, beer: 2, wine: 3, whisky: 4, bourbon: 5}
# prompt.multi_select("Select drinks?", choices)
# # Provided that vodka and beer have been selected, the function will return
# # => [1, 2]

# choices = {vodka: 1, beer: 2, wine: 3, whisky: 4, bourbon: 5}
# prompt.multi_select("Select drinks?", choices, help: "Press beer can against keyboard", show_help: :always)
# # =>
# # Select drinks? (Press beer can against keyboard)"
# # ‣ ⬡ vodka
# #   ⬡ beer
# #   ⬡ wine
# #   ⬡ whisky
# #   ⬡ bourbon

prompt.collect do
    key(:name).ask("Name?")
  
    key(:age).ask("Age?", convert: :int)
  
    key(:address) do
      key(:street).ask("Street?", required: true)
      key(:city).ask("City?")
      key(:zip).ask("Zip?")
    end
  end
  # =>
  # {:name => "Piotr", :age => 30, :address => {:street => "Street", :city => "City", :zip => "123"}}