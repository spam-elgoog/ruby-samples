# frozen_string_literal: true
# --- Day 3: Crossed Wires ---
# The gravity assist was successful, and you're well on your way to the Venus 
# refuelling station. During the rush back on Earth, the fuel management system
#  wasn't completely installed, so that's next on the priority list.

# Opening the front panel reveals a jumble of wires. Specifically,
#  two wires are connected to a central port and extend outward on a grid. 
# You trace the path each wire takes as it leaves the central port,
# one wire per line of text (your puzzle input).

# The wires twist and turn, but the two wires occasionally cross
# paths. To fix the circuit, you need to find the intersection 
# point closest to the central port. Because the wires are on a grid,
# use the Manhattan distance for this measurement. While the wires do 
# technically cross right at the central port where they both start, 
# this point does not count, nor does a wire count as crossing with itself.

# For example, if the first wire's path is R8,U5,L5,D3, then starting from
#  the central port (o), it goes right 8, up 5, left 5, and finally down 3:

# ...........
# ...........
# ...........
# ....+----+.
# ....|....|.
# ....|....|.
# ....|....|.
# .........|.
# .o-------+.
# ...........
# Then, if the second wire's path is U7,R6,D4,L4, it goes up 7, right 6, down 4, and left 4:

# ...........
# .+-----+...
# .|.....|...
# .|..+--X-+.
# .|..|..|.|.
# .|.-X--+.|.
# .|..|....|.
# .|.......|.
# .o-------+.
# ...........
# These wires cross at two locations (marked X), but the lower-left one is closer to the central port: its distance is 3 + 3 = 6.

# Here are a few more examples:

# R75,D30,R83,U83,L12,D49,R71,U7,L72
# U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
# R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
# U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
# What is the Manhattan distance from the central port to the closest intersection?

require 'test/unit'
require './point'
require './travel_map'

def load_file(name)
  File.read(name)
end
my_line = Line.new(Point.new(0, 0), Point.new(9, 0))
p my_line.y_range
p my_line.x_range
wire1 = load_file('./wire1.txt').split(',')
wire2 = load_file('./wire2.txt').split(',')

@map1 = TravelMap.new(Point.new(0, 0), wire1)
@map2 = TravelMap.new(Point.new(0, 0), wire2)

puts "Map 1 Lines in order"
puts @map1.lines_in_order
puts "Map 2 Lines in order"
puts @map2.lines_in_order

@matches = []
@steps = []
def doit
  @map2.y_lines.each_with_index do |line2,index2|
    @map1.x_lines.each_with_index do |line1,index1|
      if line2.y_range.include?(line1.end_p.y) 
        if line1.x_range.include?(line2.end_p.x)
          # ignore the starting point
          if index2.positive?
            da_point = Point.new(line2.start_p.x, line1.start_p.y)
            @steps << @map2.count_steps_to(line2, da_point) + @map1.count_steps_to(line1, da_point)
            puts "saving a match #{da_point}"
            @matches << da_point
          end
        end
      end
    end

  end
  @map2.x_lines.each_with_index do |line2, index2|
    @map1.y_lines.each_with_index do |line1, index1|
      if line2.x_range.include?(line1.end_p.x)
        if line1.y_range.include?(line2.end_p.y)
          # puts "Index is : #{index1}"
          if index2.positive?
            da_point = Point.new(line1.start_p.x,line2.start_p.y)
            @steps << @map2.count_steps_to(line2, da_point) + @map1.count_steps_to(line1, da_point)
            puts "saving a match #{da_point}"
            @matches << da_point
          end
        end
      end
    end
  end
end

doit

# @matches.shift
puts @matches

arr = []
@matches.each do |point|
  arr << @map1.start_point.get_distance(point)
end

p arr.min
# p @steps
p @steps.min
