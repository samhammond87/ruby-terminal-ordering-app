def render_ascii_art
    File.readlines("ascii.txt") do |line|
      puts line
    end
end

p render_ascii_art