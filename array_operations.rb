def array_operations(arr, to_add, to_remove, to_check)
  raise ArgumentError unless arr.all? { |elem| elem.is_a?(Numeric) }

  added = arr + [to_add]
  removed = added - [to_remove]
  contains = added.include?(to_check)
  sorted = added.sort
  output = {
    added: added,
    removed: removed,
    contains: { element: to_check, exists: contains },
    sorted: sorted
  }
  output
end

require "minitest/autorun"

module TestHelpers
  def capture_output
    output = StringIO.new
    original_output = $stdout
    $stdout = output

    yield

    output.string
  ensure
    $stdout = original_output
  end
end


class Test < Minitest::Test
  include TestHelpers

  def test_valid
    expected = {
      added: [3, 1, 2, 4],
      removed: [1, 2, 4],
      contains: { element: 1, exists: true },
      sorted: [1, 2, 3, 4]
    }
    assert_equal expected, array_operations([3, 1, 2], 4, 3, 1)
  end

  def test_empty_array
    expected = {
      added: [5],
      removed: [5],
      contains: { element: 1, exists: false },
      sorted: [5]
    }
    assert_equal expected, array_operations([], 5, 3, 1)
  end

  def test_no_removal
    expected = {
      added: [1, 2, 3],
      removed: [1, 2, 3],
      contains: { element: 5, exists: false },
      sorted: [1, 2, 3]
    }
    assert_equal expected, array_operations([1, 2], 3, 4, 5)
  end

  def test_special_characters
    assert_raises { array_operations([1, 2, "!", 5, "!"]) }
  end

  def test_duplicates
    expected = {
      added: [1, 2, 2, 3],
      removed: [1, 3],
      contains: { element: 1, exists: true },
      sorted: [1, 2, 2, 3]
    }
    assert_equal expected, array_operations([1, 2, 2], 3, 2, 1)
  end
end
