

def sample_foo(a,b)
  b.upcase + a
end

#change both strings to upper case then concatenate them together
def next_foo(one_str, two_str)
  one_str.upcase + two_str.upcase
end
 

puts next_foo("cat".reverse, "another cat")


# this is a method with an optional argument, uses default if none passed in
def foo_greeting(recipient = "you")
    puts "Hello there, #{recipient.upcase}!"
end      
 
foo_greeting "Peter"
foo_greeting

def foo(a, x)
    x + a
 end
 puts(foo "hot", "dog")   #=>   ?
 
 def bar(a, x)
    foo(a , x).upcase
 end
 puts bar("hot", "dog").capitalize   #=>   ?