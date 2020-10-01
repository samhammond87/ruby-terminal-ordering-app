def render_ascii_art
    File.readlines("ascii.txt") do |line|
      puts line
    end
end

puts render_ascii_art