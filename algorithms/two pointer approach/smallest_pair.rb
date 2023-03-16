# Given two non-empty arrays of integers, 
# find the pair of values (one value from each array) 
# with the smallest (non-negative) difference.

# Example

# Input: 
input1 = [-10, -8, 1, 3, 15, 11, 2]
input2 = [23, 127, 235, 19, 9,-7]

input3 = [-1, 5, 10, 20, 28, 3]
input4 = [26, 134, 135, 15, 17]

# input3 = []
# input4 = []

# Output: [11, 8]; this pair has the smallest difference.

def smallest_diff(arr1, arr2)
  arr1.sort!
  arr2.sort!
  p arr1
  p arr2
  output = nil
  p1 = 0
  p2 = 0
  smallest = 99999999

  while (p1 < arr1.size && p2 < arr2.size) do 
    p "[#{arr1[p1]} -#{arr2[p2]}], diff of #{(arr1[p1] - arr2[p2]).abs}"
    current_diff = arr1[p1] - arr2[p2]
    
    
    if current_diff.zero?
      output = [arr1[p1], arr2[p2]]
      break
    end
    
    if current_diff.abs < smallest
      smallest = current_diff.abs
      output = [arr1[p1], arr2[p2]]
    end
    
    if arr1[p1] < arr2[p2]
      p1 += 1
    else
      p2 += 1
    end
    p "indexs at:#{p1}, #{p2}"
  end
  output
end

p smallest_diff input1,input2
p smallest_diff input3,input4