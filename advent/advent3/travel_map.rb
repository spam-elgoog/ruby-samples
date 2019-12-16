# frozen_string_literal: true

require './point'
# my travel point recorder
class TravelMap
  attr_accessor :start_point, :input_data,
    :current_loc, :string_history, :point_history, :x_lines,
    :y_lines, :lines_in_order

  def initialize(start_point, data)
    @start_point = start_point
    @current_loc = start_point.clone
    @string_history = [@start_point.to_s]
    @point_history = [@start_point.clone]
    @input_data = data
    @x_lines = []
    @y_lines = []
    @lines_in_order = []
    convert_to_xy data
  end

  def go_travel(data) end

  def to_s
    "Starting Point:#{@start_point}\n"\
    + "Current Location:#{@current_loc}\n"\
    + "history in String form:#{@string_history}\n"\
    + "input data:#{@input_data}\n"\
    + "x_lines: #{ @x_lines.each{|x| x.start_p.to_s + '--' + x.end_p.to_s }}\n"\
    + "y_lines: #{ @y_lines.each{|x| x.start_p.to_s + "--" + x.end_p.to_s }}\n"
  end

  def count_steps_to(line, point)
    count = 0
    last_counted = 0
    last_point = ''
    (0..(find_index(line) - 1)).each do |i|
      line = @lines_in_order[i]
      count += line.start_p.get_distance(line.end_p)
      last_point = line.end_p
      last_counted = line.start_p.get_distance(line.end_p)
      print "Current count #{count}"
    end
    puts "Total  #{count} last counted #{last_counted}"
    count += last_point.get_distance(point)
  end

  private

  def find_index(line)
    @lines_in_order.find_index do |me|
      line.object_id == me.object_id
    end
  end

  def convert_to_xy(data)
    data.each do |item|
      initial_point = @current_loc.clone
      current_loc.move( item[0, 1].to_sym, item[1, item.length - 1].to_i )
      end_point = @current_loc.clone
      add_point(end_point)
      make_line(initial_point, end_point)
    end
  end


  def add_point(point)
    point_history << point
    string_history << point.to_s
  end

  def make_line(p1, p2)
    line = Line.new(p1, p2)
    if p1.y == p2.y
      @x_lines << line
    else
      @y_lines << line
    end
    @lines_in_order << line
  end
end

class Line
  attr_accessor :start_p, :end_p

  def initialize(start_p, end_p)
    @start_p = start_p
    @end_p = end_p
  end

  def y_range
    start_p.y < end_p.y ? (start_p.y)..(end_p.y) : (end_p.y)..(start_p.y)
  end

  def x_range
    start_p.x < end_p.x ? (start_p.x)..(end_p.x) : (end_p.x)..(start_p.x)
  end

  def to_s
    "Start: #{start_p.x},#{start_p.y} End: #{end_p.x},#{end_p.y} \n"
  end
end
