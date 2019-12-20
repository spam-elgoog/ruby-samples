
# An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
# To run one, start by looking at the first integer (called position 0). Here, 
# you will find an opcode - either 1, 2, or 99. The opcode indicates what to do;
# for example, 99 means that the program is finished and should immediately halt.
# Encountering an unknown opcode means something went wrong.

# op code 3,50 takes input parameter in this case the digit directly behind is where to
# store it at 50

# op code 4, 50 means output the parameter that is stored at 50
# given the above 3,0,4,0,99  will take input store it in memory 0 and 
# then output what is in memory 0 then stop executing       

def load_file
  File.read('./data2.txt')
end
keys =  load_file.split(',')
nums =  keys.map{|x|x.to_i}

class Do < Array
  attr_accessor :at_position, :x, :y, :action, :output_pos

  @@Code = {
    :'1' => :add,
    :'2' => :multi,
    :'99' => :stop,
  }

  def initialize(data)
    super(data)
    @at_position = 0
    @action = 0
    @x = 0
    @y = 0
    @output_pos = 0
  end

  def add(p1, p2)
    p1 + p2
  end

  def multi(p1, p2)
    p1 * p2
  end

  def stop
    p self
    exit
  end

  def something(p1, p2, p3)
    send(@@Code[p1.to_s.to_sym],p2,p3)
  end

  def read
    @action = self[at_position]
    stop if action == 99
    @x = self[self[at_position + 1]]
    @y = self[self[at_position + 2]]
    @output_pos = self[at_position + 3]
    @at_position += 4 unless action == 99
    self
  end

  def execute
    self[output_pos] = something(@action, @x, @y)
  end
end

my_array = Do.new(nums)

loop do
  my_array.read.execute
end
