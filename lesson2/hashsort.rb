# Exercise: Sort an array of hashes
# Starting from this array of U.S. presidents:
# Write the code in order to:

# Sort presidents by last name in reverse alphabetical order.
# Create a :full_name key for each hash and set its value to a 
# string in "LASTNAME, FIRSTNAME" format. Then sort the collection, 
# first by party affiliation and then by the full name field.
# I've surreptitiously introduced Ruby's Symbol class. Instead of 
# allocating a whole String to use as a key, such as "last_name",
#  I use a Symbol:
# :last_name

# Symbols aren't strings. They have less functionality and share the 
# same restrictive naming policies as variables (basically, just use 
# lowercase alphabet letters and underscores). But they are more
# lightweight and are just about as readable as strings.

# Read more about symbols here. They don't really affect anything 
# we do. Use strings if you want. But at least you know what they look like.

@presidents = [
    {:last_name=>"Clinton", :first_name=>"Bill", :party=>"Democrat", :year_elected=>1992, :state_residence=>"Arkansas"}, 
    {:last_name=>"Obama", :first_name=>"Barack", :party=>"Democrat", :year_elected=>2008, :state_residence=>"Illinois"}, 
    {:last_name=>"Bush", :first_name=>"George", :party=>"Republican", :year_elected=>2000, :state_residence=>"Texas"}, 
    {:last_name=>"Lincoln", :first_name=>"Abraham", :party=>"Republican", :year_elected=>1860, :state_residence=>"Illinois"}, 
    {:last_name=>"Eisenhower", :first_name=>"Dwight", :party=>"Republican", :year_elected=>1952, :state_residence=>"New York"}
   ] 

def sort_hash_by (key)
    sorted_arr = @presidents.sort_by do |person|
        person[:last_name].upcase
    end
    sorted_arr
end
puts sort_hash_by(@presidents).reverse


people = @presidents.sort_by do |p|
    p[:full_name] = "#{p[:last_name]}, #{p[:first_name]}"
    # create a virtual column which will be used to sort the rows
    "#{p[:party]}-#{p[:full_name]}" # using this string combo for sort 'Democrat-Clinton, Bill'
end

puts people