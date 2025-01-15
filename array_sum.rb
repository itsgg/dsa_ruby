def array_sum(arr)
  raise ArgumentError, "Array must contain only numbers" unless arr.all? { |elem| elem.is_a?(Numeric)}

  output = 0
  arr.each { |elem| output += elem}
  output
end

require 'minitest/autorun'

class TestArraySum < Minitest::Test
  def test_empty_array
    assert_equal 0, array_sum([])
  end

  def test_positive_array
    assert_equal 6, array_sum([3, 2, 1])
  end

  def test_negative_array
    assert_equal -6, array_sum([-3, -2, -1])
  end

  def test_non_number_array
    assert_raises(ArgumentError) { array_sum(['a', 1, 2]) }
  end
end
