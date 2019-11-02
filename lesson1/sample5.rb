# From Ruby Bastards Online book
# Exercise: Reverse an array using a loop and push and pop
#
#
# Note: This exercise goes into a lot of detail about thinking through the most efficient algorithm. Again,
# understanding how arrays work is the most important thing.
# I go into extra detail to give you more ways to observe how arrays work.
# A well-known technical interview question is: write some code to reverse the order of elements in an array.
# You could say something like, "I would use the array's reverse method" to show that you have indeed read the Ruby Array docs. 
# But that doesn't give much insight on your actual comprehension of collections.
# As with any coding problem, there are multiple solutions. Try doing it with push, pop, and a loop. It is not necessarily the ideal
# solution but serves as good practice with these methods.
# If you are using a for loop, you will have to use the length method of Array. This returns the number of elements in an array.
# Also, keep in mind that array.length - 1 is the index of the final element, as the first element begins at 0.

names = ['rock', 'paper', 'scissors', 'lizard', 'spock']
reverse_names = []
loop do 
    reverse_names.push names.pop
    break if names.empty?
end

p names = reverse_names

# another version reversing values with loop not using temp value but swapping values from each end working towards the middle
num_array = [1, 2, 3, 4, 5]
right_p = num_array.size - 1
for left_p in 0..(num_array.size/2)
    temp = num_array[left_p]
    num_array[left_p] = num_array[right_p - left_p]
    num_array[right_p - left_p] = temp
end
p num_array

# Exercise: Sort names by last name
# Given an array of strings that represent names in "FIRSTNAME LASTNAME" form, 
# use sort_by and split to return an array sorted by last names. For simplicity's sake, 
# assume that each name consists of only two words separated by space 
# (i.e. only "John Doe" and not "Mary Jo Doe").
names3 = ["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]

sorted_names = names3.sort_by do |value|
    value.split(" ")[1]
end

p sorted_names

p "*********"
p '*********'

# using ranges on strinhgs (Start..End) unidirectional -> cannot do -1..-6 for example
p "Synecdoche, NY"[-2..-1]
puts "J"[0]
puts "She sells seashells".split(' ')[-1][-6..-1]

# Write an expression that captures only the rows in between the first and last rows.
table="Name,Profit,Loss
James,100,12
Bob,20,42
Sara,50,0
Totals,170,(54)" 

p table.split("\n")[1..-2]