# Exercise: Count frequencies of letters
# Given an arbitrary string, write a method that returns a hash containing:

# Each unique character found in the string
# The frequency that each type of character appears in that string
# Use a Hash and its ability to use anything, including strings, as keys.
# Use the split method of String to convert a string into an array of letters.

# Also, you may find the hash's fetch method useful. It takes two arguments:
#  1) a key and 2) a value to return if there is nothing in the hash at that key. 
#  If a value at hash[key] exists, then that is what fetch returns.

line = "eeeffsddefcccgcgeedhhfffeedddcc"

def freq_counter (some_string)
    counter_hash = {}
    some_string.split('').each do |c|
        counter = counter_hash[c]
        counter == nil ? counter_hash[c] = 1 : counter_hash[c] = counter + 1
     end
     counter_hash.each do |key, value|
        counter_hash[key] = value/some_string.length.to_f
    end
end
p freq_counter line

# using fetch method
def freq_counter_fetch (some_string)
    counter_hash = {}
    some_string.split('').each do |c|
        counter_hash[c]= counter_hash.fetch(c,0) + 1
    end
    counter_hash.each do |key, value|
        counter_hash[key] = value/some_string.length.to_f
    end
    counter_hash
end
 p freq_counter_fetch line


###############################
# NESTED COLLECTIONs
#  Exercise: Make a multiplication table
#  Using loops, write a script that will fill a two-dimensional array with 
#  the product of each row-index and column-index, for integers 0 through 9.
 
#  The value in arr[4][6] should be 24. And arr[0][4] should be 0. And so on.

array = []
for j in (0..9)
    array[j] = []
    for i in (0..9)
       array[j] << j * i
    end
end

p array
