# Three Number Sum Problem Statement
# Given an array of integers, find all triplets in the array 
# that sum up to a given target value.

# In other words, given an array arr and a target value target,
# return all triplets a, b, c such that a + b + c = target.

# Example:
input1 = [7, 12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

# Expected Output: [[2, -8, 6], [3, 5, -8], [1, -6, 5]]

def find_triples(arr)
  p arr
  set_size = 3
  output = []
  index = 0 
  arr.sort!
  p arr
  while(index <=  arr.size - set_size) do
    p1 = index.next
    p2 = arr.size - 1
    while (p1 < p2) do
      if (arr[index] + arr[p1] + arr[p2] == 0)
        output << [arr[index],arr[p1],arr[p2]]
        p1 += 1
        p2 -= 1
      elsif (arr[index] + arr[p1] + arr[p2] < 0)
        p1 += 1
      else
        p2 -= 1
      end
    end

    index += 1
  end

  return output
end

def find_triplets(arr)
  p arr
  set_size = 3
  output = []
  index = 0 
  while(index <=  arr.size - set_size) do
    p1 = index.next
    p2 = p1.next
    while (p1 <= arr.size - 2) do
      if (arr[index] + arr[p1] + arr[p2] == 0)
        output << [arr[index],arr[p1],arr[p2]]
      end

      if p2 == arr.size - 1
        p1 += 1
        p2 = p1 + 1
      else
        p2 += 1
      end
    end

    index += 1
  end

  return output
end



# Expected Output: [[2, -8, 6], [3, 5, -8], [1, -6, 5]]
# p find_triplets input1
p find_triples input1

