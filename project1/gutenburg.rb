#!/opt/rubies/2.6.5/bin/ruby  
# frozen_string_literal: true

# Project Gutenberg
# Link to project
# https://shopify.instructure.com/courses/280/assignments/1171?module_item_id=3750
# For this exercise, we're going to use Ruby to analyze and mess around
# with some text. Try and use all the concepts you were introduced to so far.
# Visit the Project Gutenberg (Links to an external site.) website. Look
# for a reasonably sized English book you can download in plain text format.
# A fairy tale or nursery rhyme would be a good choice (but isn't strictly
# necessary).

# Complete as many of the below tasks as you have time for. Test every
# function with your chosen Gutenberg book and make good use of the debugger.

# Write a function that takes in a string representing a filename and returns
# a processed version of the text file. Read the file and store it in a string.
# Strip any whitespace before and after the text. Remove any newlines between
# lines of text that don't correspond to paragraph breaks (these were originally
# added for readability). Return the resulting text. Be sure to use the result
# of this function as input to your other functions.

# Write a function that takes your book text and a hash of string keys and
# string values. It will return a modified version of the input text. The
# hash you provide the function will have keys that represent words or phrases
# you want to replace in the text, and values that represent what to replace
# the words or phrases with. To use the function, create a copy of the input
# text, and search-and-replace using the input hash on the copy (are regular
# expressions useful here?). Return the result. Be creative when testing
# this one! As an example, you might try changing characters' names or locations
# in the story.

# Write a set of functions that analyze your book text in some way. The function
# should take the text as input, and, if applicable, a hash representing a set
# of options used to customize the analysis. You get to decide  how you will
# analyze the text, and whether you need any options (try to make at least one
# function with options, though!). Regular expressions, possibly including
# matching groups, might be useful here. Some ideas:

# How many times are particular words or phrases used?
# How many sentences follow a particular sentence structure?
# What are the sentences?
# Can you find some words that might be verbs, nouns, or adjectives based on
# where they appear in a sentence, or how they are written
# (e.g. ending in "ed")?

# Write a function that takes your book text and writes a modified HTML version
# to a file. Make a copy of your text and add various HTML tags
# like <p></p> around the paragraphs and maybe some anchor links for a table
# of contents. What other HTML tags could you add?

# Related Learning Outcomes:
# write single-file, procedural-style Ruby scripts to solve problems of medium
# complexity using the following concepts:
# control structures
# arrays
# hashes, including indexing with symbols
# symbols
# string manipulation
# regular expressions
# blocks in the context of loops
require 'shoulda'
@count = 0
@file_name = ''
@original_file = ''
@lower_case = ['insanely more', 'wildly more',
               'stupidly more', 'universally more']
@more = 'more'
@my_hash = {}
@down_case_array = []
@up_case_array = []

def load_lower(index)
  symbol = create_symbol(@more, index)
  add_to_hash(symbol, @lower_case[index])
  @down_case_array << symbol
end

def load_upper(index)
  symbol = create_symbol(@more.capitalize, index)
  add_to_hash(symbol, @lower_case[index].capitalize)
  @up_case_array << symbol
end

def add_to_hash(key, value)
  @my_hash[key] = value
end

def create_symbol(symbol, index)
  (symbol + index.to_s).to_sym
end

def initialize_hash
  @lower_case.size.times do |x|
    # creating symbols like :more1 :more2 etc.
    p x
    load_lower(x)
    load_upper(x)
  end
  @my_hash
end

def load_file(f_name)
  @original_file = File.read(f_name)
end

# Removes leading and ending spaces,and new lines in paragraphs
def format_para
  @original_file.strip.gsub(/(w|\S)(\r\n)(\w)/, '\1 \3')
end

# adds some adjectives
def beautify_more(content)
  content.gsub!(/\b(More|more)\b/) do |match|
    @count += 1
    x = rand(0..@lower_case.size - 1)
    sym = match.to_sym == :more ? @down_case_array[x] : @up_case_array[x]
    # print "THE COUNTS IS : #{@count} rand:#{x} match:#{match} Sym:#{sym} VV\n"
    @my_hash[sym]
  end
  content
end

if ARGV.size.positive? && File.exist?(ARGV[0])
  @file_name = ARGV[0]
  p File::Stat.new(@file_name)

  # removes 3 or more new lines and replaces it with just 2
  # sample = load_file(@file_name).gsub(/(\r\n){3,}/, "\r\n\r\n")
  p initialize_hash
  load_file(@file_name)
  page = beautify_more(format_para)
  puts "size of string #{page.size}  #{page.class}"
  words = Hash.new(0)
  page.gsub!(/--/, ' ')

  page.split(' ').each do |x|
    x.downcase!
    x.gsub!(/(:|;|,|\.|\?|!|”|“)/, '')
    words[x] = words[x] + 1
  end
  sorted = words.sort_by do |key, _value|
    key.to_s
  end
  selected = sorted.select do |values|
    values[1] > 1
  end

  puts " Selected count : #{selected.size}"
  p selected
  File.new('result', 'w').write(page)
else
  puts 'Provide a valid file name argument on the command line.'
  exit
end

def sum (a,b)
  a + b
end

# File.open(file_name,'r').take(30).each do |line|
#     p line
# end
