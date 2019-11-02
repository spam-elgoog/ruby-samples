
# Fizz = "Fizz "
# Buzz = "Buzz "
# Fizzbuzz = "Fizzbuzz "
# (1..100).each do |x|
#     code = x.to_s << " "
#     code = Fizz if x % 3 == 0
#     code = Buzz if x % 5 == 0
#     code = Fizzbuzz if (x % 3 == 0) and (x % 5 == 0)
#     print code
#  end
puts ["A", "B", "C"][-3]
p [1,2,3,4,5] << "woot"
p Array.new(3) { |x| x + 1}
p ["A", "B", "C"].push "Hello"

names = ['rock', 'paper', 'scissors', 'lizard', 'spock']
 
lnames = names.each do |name| name << "_rb" end

p names
p lnames

only_odd = (1..10).to_a.delete_if do |x| x.even? end
    p only_odd

only_odd = 10.downto(1).to_a.delete_if do |x| x.even? end
    p only_odd

def array_copy(source)
  destination = []
  for x in source
    # Add number to destination if number
    # is less than 4
    destination << x if x < 4
  end
  return destination
end
array = [1, 2, 3, 4, 5]

def array_copy2(source)
    destination = []
    source.select do |x| 
        destination << x if x < 4 
    end
end

p array_copy2 array