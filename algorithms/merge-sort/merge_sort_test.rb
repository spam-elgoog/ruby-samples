require 'minitest/autorun'
require_relative 'merge_sort'

class MergeSortTest < Minitest::Test
  
  puts Random.array_of_natural_numbers(100).inspect
  
  def test_array_of_natural_numbers_returns_array_of_correct_size
    test_size = 5 
    result = Random.array_of_natural_numbers(test_size)

    assert_equal test_size, result.size 
  end

  def test_array_of_natural_numbers_returns_same_array_with_seed
    test_size = 5 
    test_seed = 10
    expected_result = Random.array_of_natural_numbers(test_size, seed: test_seed)
    result = Random.array_of_natural_numbers(test_size, seed: test_seed)
    

    assert_equal expected_result, result
  end
end
