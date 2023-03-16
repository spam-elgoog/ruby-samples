#!/usr/bin/env ruby

# optimized using a flag
def bubble_sort(items) # assume 10 items
    n = items.size
    iterations = 0
    loops = 0
    loop do
        swapped = false
        for a in (1..(n - 1)) do  # 1 to (number of items - 1)
            if items[a] < items[a - 1] 
                tmp = items[a - 1]
                items[a - 1] = items[a]
                items[a] = tmp
                swapped = true
            end
            iterations += 1 # debug: loop counter
        end
        n -= 1 # optimization, halfs the time by doing one less inner loop for each addtinal outer loop
        loops += 1 # debug: loop counter
        break unless swapped
    end
    p "Total iterations: #{iterations}"
    p "loops: #{loops}"
    items
end

# always 45 iterations on 10 items without swapped flag
def bubble_sort_2(items)
  n = items.size
  iterations = 0
 
  for a in (0...n) do # same as (0...n).each do |a| ..... end
    swapped = false
    for b in (0...(n - a - 1)) do
      if items[b] > items[b + 1] 
        tmp = items[b + 1]
        items[b + 1] = items[b]
        items[b] = tmp
        swapped = true
      end
      iterations += 1
    end
    break unless swapped
  end
  p "Total iterations: #{iterations}"
  items
end

def generate_array(size)
    output = []
    size.times do |i|
        output << i
    end
    result = output.shuffle
    p "Created an array of: #{result}"
    result
end

input = generate_array(ENV["SIZE"]&.to_i || 5)
input = [1,2,3,4,5]
input2 = input.clone
p "First Sorted: #{bubble_sort(input)}"
p "input #{input2}"
p "Second Sorted: #{bubble_sort_2(input)}"