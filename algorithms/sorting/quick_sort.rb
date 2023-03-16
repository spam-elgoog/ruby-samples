# EXAMPLE 1
def quick_sort(arr, lo, hi)
  return if lo >= hi
  p "Input: ", arr
  puts "Lo : #{lo} Hi : #{hi}"
  pivot = partition(arr, lo, hi)
  quick_sort(arr, lo, pivot - 1) # left-side
  quick_sort(arr, pivot + 1, hi) # right-side
end

def partition(arr, lo, hi)
  i, j = lo, hi
  pivot = arr[hi]

  while i < j do
    if arr[i] > pivot
      while j > i 
        if arr[j] < pivot
          arr[j], arr[i] = arr[i], arr[j]
          break 
        end
        j-=1
      end
    end
    i+=1
  end
  arr[hi] = arr[j]
  arr[j] = pivot
  return j
end

input = 'FBACDKLGSXI'.split('')
quick_sort input, 0, input.size - 1
p "Output :", input

# EXAMPLE 2
# uses a pivot point in this case the last index on each iteration
# non-recursive algorithm
def quick_sort_no_recursion(arr, low = 0, high = 0, reverse = false)
  p "Input: ", arr
  puts "#{low}, #{high}"
  sub_arrays = [[low,high]]
  
  while !sub_arrays.empty?
    p "sub arrays: #{sub_arrays}"
    lo,hi = sub_arrays.pop
    i, j = lo, hi
    pivot = arr[hi]

    while i < j do
      if arr[i] > pivot
        while j > i 
          if arr[j] < pivot
            arr[j], arr[i] = arr[i], arr[j]
            break 
          end
          j-=1
        end
      end
      i+=1
    end
    # swap pivot which was in the last index
    # with value at `j` which is the starting index of the larger than pivot set
    # ex. [4,2,5, <7> ,14,9,12]
    arr[hi] = arr[j]
    arr[j] = pivot

    # add the sub arrays to be worked on, sub-arrays left and right sides of the pivot
    sub_arrays.push([lo, j-1]) if (j - 1 - lo >= 1)
    sub_arrays << [j+1, hi] if (hi - (j+1)) >= 1
  end
end

# me = [3,2,1,13,12,7,9]
# quick_sort_no_recursion(me,0,me.size - 1)
# p me

# internet version
def quicksort(arr, first, last)
  p "Input2: ", arr
  puts "Lo : #{first}"
  puts "Hi : #{last}"
  if first < last
    p_index = partition2(arr, first, last)
    quicksort(arr, first, p_index - 1)
    quicksort(arr, p_index + 1, last)
  end

  arr
end

def partition2(arr, first, last)
  # first select one element from the list, can be any element. 
  # rearrange the list so all elements less than pivot are left of it, elements greater than pivot are right of it.
  pivot = arr[last]
  p_index = first
  
  i = first
  while i < last
    if arr[i] <= pivot
      temp = arr[i]
      arr[i] = arr[p_index]
      arr[p_index] = temp
      p_index += 1
    end
    i += 1
  end
  temp = arr[p_index]
  arr[p_index] = pivot
  arr[last] = temp
  return p_index
end

# input = 'DBACFKLGSXI'.split('')
# input = 'DAC'.split('')
# quicksort input, 0, input.size - 1
# p "Output :", input
