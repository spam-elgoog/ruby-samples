# def find_frequency(sentence, word)
#     # Your code here
#     my_array = sentence.downcase.split
#     puts my_array
#     puts "Count is :#{my_array.count(word.downcase)}"
# end
require "open-uri"

def count_tags(page, tag)
    t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    # regular expression to look for in the page
    count = page.scan(/<#{tag}\b/).length   # returns an array of tags
    puts Process.clock_gettime(Process::CLOCK_MONOTONIC) - t1
    count
end
#no do it the long way
def count_tags2(page, tag)
  # regular expression to look for in the page
  t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  count = 0
  offset = 0
  loop do
    offset = page.index("<#{tag}", offset)
    break if offset == nil || !(offset += 1)
    count += 1
  end 
  puts Process.clock_gettime(Process::CLOCK_MONOTONIC) - t1
  count
end

def fetch_page(url)
    return open(url).read   # assigns the web page contents as a string to 'file' variable
end

urls = [ "http://www.wsj.com", "http://www.nytimes.com", "http://www.ft.com" ]
tags_array = ["div","h1","h2","h3","img","p"]
# urls = [ "http://www.ft.com" ]
# tags_array = ["h2"]

urls.each do |url|
  puts "\nThe site #{url} has:"
  tags_array.each do | tag|
    count = count_tags(fetch_page(url),tag)
    puts "   #{count} #{tag} tags"
  end
end


p (true or false)
# def embiggen(str)
#     str = "#{str}!!!"
#     str = str.upcase
#     str
# end
 
# def add_strings(str1, str2)
#   puts "#{str1}#{str2}".capitalize
#   str2
# end

# def add_three_items(item1, item2, item3)
#   x = item1.to_s + item2.to_s + item3.to_s
#   "#{x}!"
# end

# puts add_three_items(22,33,44)
# add_strings("Peter", "Studnicka")
# puts embiggen('hello world')  # "HELLO WORLD"
# puts find_frequency("this is my this sentence about this", "this")

