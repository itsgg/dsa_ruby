def fizz_buzz(n)
  raise ArgumentError, "n should be >= 1" if n <= 0

  (1..n).each do |elem|
    if elem % 3 == 0 && elem % 5 == 0
      puts "fizzbuzz"
    elsif elem % 3 == 0 
      puts "fizz"
    elsif elem % 5 == 0 
      puts "buzz"
    else
      puts elem
    end
  end
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

  def test_zero
    assert_raises(ArgumentError) { fizz_buzz(0) }
  end

  def test_negative
    assert_raises(ArgumentError) { fizz_buzz(-2) }
  end

  def test_single
    output = capture_output do
      fizz_buzz(1)
    end
    assert_equal "1\n", output
  end

  def test_multiple
    output = capture_output do
      fizz_buzz(6)
    end
    assert_equal "1\n2\nfizz\n4\nbuzz\nfizz\n", output
  end
end
