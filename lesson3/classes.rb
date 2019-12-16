#!/usr/bin/ruby -w
# frozen_string_literal:true

puts 1.class
puts ''.class
puts [].class

puts :hi.class
puts :hi.is_a?(Symbol)

# My Rectangle class
class Rectangle
  attr_accessor :width, :breadth
  def initialize(width, breadth)
    @width = width
    @breadth = breadth
  end

  def perimeter
    (width + breadth) * 2
  end

  def area
    width * breadth
  end

  def add_areas(*rectangles)
    rectangles << self
    rectangles.inject(0) do |sum, rectangle|
      sum + rectangle.area
    end
  end

  def to_s
    "w:#{width} h:#{breadth}"
  end
end

my_rect1 = Rectangle.new(3, 10)
my_rect2 = Rectangle.new(4, 10)
my_rect3 = Rectangle.new(5, 10)
my_rect4 = Rectangle.new(6, 10)

puts my_rect1
puts my_rect1.perimeter
puts my_rect1.area
puts my_rect3.add_areas(my_rect1, my_rect2, my_rect4)

def name_msg(names)
  msg = ''
  names.each_with_index do |name, index|
    msg = "Meet #{name}" if index.zero?
    msg += " #{name}" unless index.zero?
  end
  msg += ', '
end

def introduction(age, gender, *names)
  puts name_msg(names) + "who's #{age} and #{gender}."
end

introduction(25, 'Male', 'Peter', 'Pete', 'Studnicka')

# This code creates a calculate method which can call
# either add or subtruct, it accepts any number of params
# (numbers specifically) to either add all together or subtract. Last
# argument passed in can be a hash with option(s) currently it only support
# one option at a time. If you pass in a an empy hash as the last param the
# calculate method will default to add() method. The exercise was
# asking for hash for options could have really jsut gone with symbols.
def add(*params)
  params.inject(0) do |sum, num|
    sum + num if num.is_a?(Integer)
  end
end

def subtract(*params)
  params.inject(params.shift) do |result, num|
    result - num if num.is_a?(Integer)
  end
end

def calculate(*arguments)
  option = arguments[-1].is_a?(Hash) ? arguments.pop : {}
  option[:add] = true if option.empty?
  return add(*arguments) if option[:add]
  return subtract(*arguments) if option[:subtract]
end

p calculate(5, 20, 10, 10, subtract: '')
p calculate(5, 20, 10, 10, add: '')
