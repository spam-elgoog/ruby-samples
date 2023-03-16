input = [["A", 0], ["B", 0], ["b", 0], ["F", 1], ["G", 2], ["g", 3], ["C", 0]]

new_array = input.each_with_object([]) do |a, arr|
  arr << if a.last.zero?
   a.first
  else
    a.last
  end
end
p new_array