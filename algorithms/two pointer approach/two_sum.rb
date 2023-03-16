# Two Number Sum Problem Statement
# Given an array of integers, return the indices of the two numbers 
# whose sum is equal to a given target.

# You may assume that each input would have exactly one solution, 
# and you may not use the same element twice.

# Example:

input1 = [3, 4, 7, 9, 11, 15]
target = 13

# The output should be [0, 1]. 
# Because nums[0] + nums[1] = 2 + 7 = 9.

# using two pointers
def two_sum(arr)
  arr.sort
  target = 13
  p1 = 0
  p2 = arr.size - 1
  while (p1 < p2) do
    sum = arr[p1] + arr[p2]
    break if sum == target
    if sum < target
      p1 += 1
    else
      p2 -= 1
    end
  end
  p "Output: #{arr[p1]}, #{arr[p2]}"
end
two_sum input1


def sum_using_hash(arr)
  target = 13
  dic = arr.each_with_object({}) do |i,h|
    h[i] = nil
  end
  p dic 
  arr.each do |i|
    if dic.has_key?(target - i)
      p "#{i},#{target - i}"
      break
    end
  end
end

sum_using_hash(input1)

def sum_using_set(arr)
  require 'set'
  target = 13
  mset = arr.to_set
  p mset 
  arr.each do |i|
    if mset.intersect?([target - i])
      p "#{i},#{target - i}"
      break
    end
  end
end

sum_using_set input1