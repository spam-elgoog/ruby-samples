# frozen_string_literal: true
class Point
  attr_accessor :x, :y

  def initialize(point_x = 0, point_y = 0)
    @x = point_x
    @y = point_y
  end

  def get_distance(other)
    ((x - other.x).abs + (other.y - y).abs)
  end

  def to_s
    output = x.positive? ? "( #{x}," : "(#{x},"
    y.positive? ? output + " #{y})" : output + "#{y})"
  end

  def location_same?(other)
    get_distance(other).zero?
  end

  def ==(other)
    @x == other.x && @y == other.y ? true : false
  end

  def move(code, amount)
    case code
    when :NORTH, :U
      move_y(amount)
    when :SOUTH, :D
      move_y(-amount)
    when :EAST, :R
      move_x(amount)
    when :WEST, :L
      move_x(-amount)
    end
    self
  end

  def move_x(num)
    self.x = self.x + num
  end

  def move_y(num = 0)
    @y = y + num
  end
end
