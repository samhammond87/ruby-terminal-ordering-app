require "tty-prompt"

prompt = TTY::Prompt.new

choices = [
    {name: "small", value: 1},
    {name: "medium", value: 2, disabled: "(out of stock)"},
    {name: "large", value: 3}
  ]

  puts choices