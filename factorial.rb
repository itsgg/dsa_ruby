# Will cause stack overflow error for large numbers
def factorial_recursive(n)
  raise "Argument can't be negative" if n < 0

  return 1 if n <= 1

  n * factorial_recursive(n - 1)
end

# Doesn't cause stack over flow error because call stacks is not filled
def factorial_iterative(n)
  raise "Argument can't be negative" if n < 0

  result = 1
  (1..n).each { |i| result *= i }
  result
end

# Doesn't cause stack over flow error because call stacks is not filled
def factorial_tail_recursive_internal(n, result)
  return result if n <= 1

  factorial_tail_recursive_internal(n - 1, result * n)
end

def factorial_tail_recursive(n)
  raise "Argument can't be negative" if n < 0

  factorial_tail_recursive_internal(n, 1)
end

require "minitest/autorun" 

class FactorialTest < Minitest::Test
  def test_positive_recursive
    assert_equal 120, factorial_recursive(5)
  end

  def test_zero_recursive
    assert_equal 1, factorial_recursive(0)
  end

  def test_negative_recursive
    assert_raises(RuntimeError) { factorial_recursive(-3) }
  end

  def test_positive_iterative
    assert_equal 120, factorial_iterative(5)
  end

  def test_zero_iterative
    assert_equal 1, factorial_iterative(0)
  end

  def test_negative_iterative
    assert_raises(RuntimeError) { factorial_iterative(-3) }
  end

  def test_positive_tail_recursive
    assert_equal 120, factorial_tail_recursive(5)
  end

  def test_zero_tail_recursive
    assert_equal 1, factorial_tail_recursive(0)
  end

  def test_negative_tail_recursive
    assert_raises(RuntimeError) { factorial_tail_recursive(-3) }
  end
end
