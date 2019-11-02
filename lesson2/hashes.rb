# Write a loop to convert arr_pets into the equivalent hash:
arr_pets = [["dog", "Fido"], ["cat", "Whiskers"], ["pig", "Wilbur"]] 
my_hash = Hash.new(arr_pets.size)

arr_pets.each do |pair|
  my_hash[pair[0]] = pair[1] 
end

puts my_hash

# Exercise: Convert an array of arrays into an array of hashes
# In the previous exercise involving pets, it was a simple matter of 
# knowing that the 0-index and 1-index corresponded to pet type and 
# name, respectively. Using the sample campaign finance data from
# above, change each row (sub-array) into an equivalent hash:
# Hints:
# You'll need at least two each loops to do this (sanely).
# Store the first row of data_arr in a variable to refer to later

data_arr = [
  ["Name", "State", "Candidate", "Amount"],
  ["John Doe", "IA", "Rep. Smithers", "$300"],
  ["Mary Smith", "CA", "Sen. Nando", "$1,000"],
  ["Sue Johnson", "TX", "Rep. Nguyen", "$200"]
]   
# extract the columns
header = data_arr[0] 


hash_arr = []
data_arr[1..-1].each do |row|
  temp_hash = Hash.new
  for column in (0..3)
    temp_hash[header[column]] = row[column]
  end
  hash_arr << temp_hash
end

puts hash_arr

# rewrite using Enumerables .each_with_index  a module included in Array
hash_arr = []
data_arr[1..-1].each do |row|
  temp_hash = Hash.new
  header.each_with_index do |value, index|
    temp_hash[value] = row[index]
  end
  hash_arr << temp_hash
end

one_hash = hash_arr[0]
#no go and print all hashes
one_hash.each do |x, y|
  print x,": ",y, "    "
end
puts "#########################"
one_hash.each_pair do |key,val|
  p key +  ":" + val
end

my_enum = one_hash.each
p my_enum
