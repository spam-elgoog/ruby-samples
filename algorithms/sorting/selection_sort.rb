#   minimum value selection, to reverse order find mixumum value instead
#  [ 24, 2, 22, 1, 16, 5, 23 ]  
#     i -> loop 1
#        j = i + 1  -> find smallest loop 2
# 
#     1. finds index of value `1`
#       swap i with smallest value
#     2. finds find index of 2
#     .
#     .
# def selection_sort(arr)
#   p "Incomming: #{arr}"
#   i = 0
#   while (i < arr.length - 1) do
#     small_i = i
#     j = i + 1
#     while j < arr.length do
#       if arr[j] < arr[small_i]
#         small_i = j
#       end
#       j += 1
#     end
#     # swap 
#     arr[i], arr[small_i] = arr[small_i], arr[i]
#     i += 1
#   end
# end



def selection_sort(arr, desc: false)
  p "Incomming: #{arr}"
  puts desc
  i = 0
  while (i < arr.length - 1) do
    small_i = i
    j = i + 1
    while j < arr.length do
      if desc && arr[j] > arr[small_i]
        small_i = j
      elsif !desc && arr[j] < arr[small_i]
        small_i = j
      end
      j += 1
    end
    # swap 
    arr[i], arr[small_i] = arr[small_i], arr[i]
    i += 1
  end
end
input1 = [3,2,1,4,7,10,50,6,49]
input2 = [24,2,22,1,16,5,23]
selection_sort(input2, desc: true)
p "Output:    #{input2}"


def selection_sort(arr, desc: false)
  i = 0
  while (i < arr.length - 1) do
    small_i = i
    j = i + 1
    while j < arr.length do
      # Descending order
      if desc && arr[j] > arr[small_i]
        small_i = j
      # Ascending order, defualt
      elsif !desc && arr[j] < arr[small_i]
        small_i = j
      end
      j += 1
    end
    # swap 
    arr[i], arr[small_i] = arr[small_i], arr[i]
    i += 1
  end
end