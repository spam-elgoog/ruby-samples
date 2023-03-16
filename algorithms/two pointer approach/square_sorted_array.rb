# Given an array of numbers sorted in increasing order, 
# return a new array containing squares of all the numbers of the input array sorted in increasing order.
input1 = [-6,-5, -2, -1, 0, 4, 6, 7]
input2 = [1, 2, 3, 4, 5]
input3 = [-5, -4, -3, -2, -1]
# Expected Output: [0, 1, 4, 16, 25, 36]
def square_and_sort(arr)
    p "Input array: #{arr}"
    output = Array.new(arr.size)
    
    p1 = 0
    puts "Negative pointer at: #{p1}"
    p2 = arr.size - 1
    puts "Positive pointer at: #{p2}"

    index = arr.size - 1 
    while (index >= 0) do         
        if arr[p1].abs > arr[p2].abs
          output[index] = arr[p1] ** 2
          p1 += 1
        else
          output[index] = arr[p2] ** 2
          p2 -= 1
        end  
      index -= 1  
    end

    # while(p1 >= 0)
    #   output.push(arr[p1] ** 2)
    #   p1 -= 1
    # end

    # while(p2 < arr.size)
    #   output[p2] = arr[p2] ** 2
    #   p2 += 1
    # end
    return output
end

p square_and_sort input1

# practice Mar 3, 2023
input1 = [-6,-5, -2, -1, 0, 4, 6, 7]
input2 = [1, 2, 3, 4, 5]
input3 = [-5, -4, -3, -2, -1]
def sq_sorted(arr)
  p1 = 0
  p2 = arr.size - 1
  output_index = arr.size - 1
  output = Array.new(arr.size)
  while (output_index >= 0) do
    if arr[p1].abs > arr[p2].abs
      output[output_index] = arr[p1]**2
      p1 += 1
    else
      output[output_index] = arr[p2]**2
      p2 -= 1
    end
    output_index -= 1
  end
  return output
end

p sq_sorted input1