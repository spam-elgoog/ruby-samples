# Randomize array in-place using Durstenfeld shuffle algorithm

def shuffle_array(array)
    i = array.size # - 1 
    while i > 0 do
        # javascript adds 1, as random() returns up to ex when arr.size = 4; returns 0,1,2, or 3 
        # var j = Math.floor(Math.random() * (i + 1));
        i -= 1
        j = Random.rand(0..i)
        # shuffled items are input in the right sub array starting at size -1, size - 2 ....
        temp = array[i]
        # puts "Obj ID: #{temp.object_id}"
        array[i] = array[j]
        array[j] = temp
    end
end

# index required for arrays that need to be intialized separately
# creates a new array
def inside_out_shuffle(source)
    p source
    # index = 0
    source.each_with_object([]) do |val,arr|
        # j = Random.rand(0..(index))
        j = Random.rand(0..(arr.size))
        puts j
        arr[arr.size] = arr[j]  # if index != j
        arr[j] = val
        # index += 1
    end
end
# alpha = 'A,B,C,D,E,F,G'.split(',')
# p inside_out_shuffle(alpha)

# val = 'IM YOUR FATHER'
val ='ABCDEFGHIJKLMNOP'
val = val.split(//)
p val
shuffle_array(val)
p val

# cards = '2,3,4,5,6,7,8,9,10,J,Q,K,A'
# cards = cards.split','
# p cards
# shuffle_array cards
# p cards
# prng = Random.new 2
# p prng.rand((2**1000)..(2**1001))%97;


arr = 'ABCDEFG'.split ''
p arr

# # in place shuffle
# def shuffle_test(arr)
#   i = arr.size - 1
#   temp = ''
#   while i > 0 do 
#     j = Random.rand(0..i)
#     temp = arr[i]
#     arr[i] = arr[j]
#     arr[j] = temp
#     i -= 1
#   end
# end
# shuffle_test arr
# p arr


# practice Mar 3, 2023
# def my_shuffle(arr)
#   i = arr.size - 1
#   while i > 0 do
#     j = Random.rand(0..i)
#     temp = arr[i]
#     arr[i] = arr[j]
#     arr[j] = temp
#     i -= 1
#   end
# end
# my_shuffle arr
# p arr

# practice Mar 11, 2023
def my_shuffle_2(arr)
  i = arr.size - 1 
  while i > 0 do
    j = Random.rand(0..i)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
    i -= 1
  end
end

my_shuffle_2 arr
puts "Output : #{arr.inspect}"