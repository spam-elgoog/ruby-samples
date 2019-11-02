grid = Hash.new(0)

5.times do |x|
    puts x
    4.times do |y|
      grid[[x, y]] = x*y
  end
end
print grid
diff = grid[[2, 4]] - grid[[2,1]]

puts diff