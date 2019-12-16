# !/usr/bin/env ruby
# frozen_string_literal: true

require('English')
# Rubular assignments
# Assignment at
# https://shopify.instructure.com/courses/280/assignments/1172?module_item_id=3748
# (3) Given a string of the format shown below (variable name followed by inc
#     or dec, a number, if, and a boolean expression), create a regular
#     expression that returns the variable name, the number, and the
#     boolean expression.
text = "Here is a file with random stuff
     there is also this ebu inc 626 if iq < 0  # which I don't understand
      and well that's about it"

# The string to match:  ebu inc 626 if iq < 0
pattern = /
    (?<variable>[a-z]+)     # capture variable name
    \s
    (?:inc|dec)             # do not capture this group
    \s
    (?<value>\d+)           # capture numeric value
    \sif\s
    (?<expression>[a-z]+\s(?:<|<=|>|>=|==)\s0) # capture boolean expr
/x

# search and match the first occurance
if (data = text.match(pattern))
  # Variations of displaying the information matched.
  # This is not an exhaustive list
  puts "Show all: #{data[:variable]} #{data[2]} #{data['expression']}"
  puts "Show all again:  #{data.captures}"

  # Some other useful Global variables set by ruby
  puts Regexp.last_match[1] # => ebu
  # $LAST_MATCH_INFO is prefered over ==> puts "Last match: #{$~}"
  puts "Last match: #{$LAST_MATCH_INFO}"
  puts "Post match: #{$'}"
  # Strip the new line characters just because I can. This also resets
  # Regex set global variables.
  puts "Pre match: #{$`.gsub(/\s*\n\s*/, ' ')}"
  # The new last match.
  p "Last match: #{$LAST_MATCH_INFO}"
else
  puts 'No match!'
end

# contracts_arr = ["Hughes Missile Systems Company, Tucson, Arizona, is
#     being awarded a $7,311,983 modification to a firm fixed price contract
#     for the FY94 TOW missile production buy,
#     total 368 TOW 2Bs. Work will be performed in Tucson, Arizona,
#     and is expected to be completed by April 30, 1996. Of the total contract
#     funds, $7,311,983 will expire at the end of the current fiscal year.
#     This is a sole source contract initiated on January 14, 1991.
#     The contracting activity is the U.S. Army Missile Command, Redstone
#     Arsenal, Alabama (DAAH01-92-C-0260).", "Conventional Munitions Systems,
#     Incorporated, Tampa, Florida, is being awarded a $6,952,821 modification
#     to a firm fixed price contract for Dragon Safety Circuits Installation
#     and retrofit of Dragon I Missiles with Dragon II Warheads. Work will be
#     performed in Woodberry, Arkansas (90%), and Titusville, Florida (10%),
#     and is expected to be completed by May 31, 1996. Contract funds will not
#     expire at the end of the current fiscal year. This is a sole source
#     contract initiated on May 2, 1994. The contracting activity is the
#     U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."]

# locations = "Alabama, AL, Alaska, AK, Arizona, AZ, Arkansas, AR,California, \
# CA, Colorado, CO, Connecticut, CT, Delaware, DE, Florida, FL, \
# Georgia, GA, South Dakota, SD"

# p locations

# puts locations.scan(/[A-Z]{2}/).join(', ')
# p locations

# mtch =""
# contracts_arr.each do |contract|
#     mtch = contract.match(/(\$[\d,]+).+?(\w+ \d{1,2}, \d{4})/m)
#     p mtch
# end

# puts "#{mtch[1]}"
