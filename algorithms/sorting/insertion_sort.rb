
INPUT = "BAROMETER".split(//).freeze

input2 = "DCBA".split('')

def sort(arr)
  p "Input:",arr

  # "DCBA"
  #   "CD|BA"  : outer_index=1 , key=D , j=0
  #   "BCD|A"  : outer_index=2
  #   "ABCD|"  : outer_index=3
  
  index = 1
  while (index < arr.size) do # n
    key = arr[index]
    j = index - 1
    while (arr[j] > key && j >= 0) do 
      arr[j+1] = arr[j]
      j -= 1
    end
    arr[j+1] = key
    index += 1 
  end
end

# arr1 = [].replace(INPUT)
# sort arr1
# p "Output:",arr1


# (n-1)()

# variant 
# def insertion_sort(arr)
#   arr.size.times do |i| # 0..size-1 can be replaced with arr.size.times do |i|
#     key = arr[i]
#     j = i - 1
#     while j >= 0 && arr[j] > key do
#       arr[j + 1] = arr[j]
#       j -= 1
#     end
#     arr[j + 1] = key
#   end
# end

# practice Mar 11, 2023
def insertion_sort_a(arr)
  i = 1
  while i < arr.size do # 0..n-1 can be replaced with arr.size.times do |i|
    key = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > key do
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
    i += 1
  end
end

p "Input :", INPUT
arr2 = [].replace(INPUT)
insertion_sort_a(arr2)
p "Output:", arr2


# internet insertion sort
# def insertion_sort(array)
#   (0..array.size.-(1)).each do |j|
#     key = array[j]
#     i = j - 1
#     while i >= 0 && array[i] > key
#       array[i+1] = array[i]
#       i-=1
#     end
#     array[i+1] = key
#   end
# end

# nums = [3,2,1,10,9, 24, 4, 5]
# p nums
# insertion_sort(nums)
# p nums

# practice March 14th, 2023
def insertion_sort_b(arr)
  i = 1
  while i < arr.size do
    key = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > arr[i] do
      arr[j+1] = arr[j]
      j-=1
    end
    arr[j+1] = key
    i+=1
  end
end
nums = [3,2,1,10,9, 24, 4, 5]
p nums
insertion_sort_b(nums)
p nums