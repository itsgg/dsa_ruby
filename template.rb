def hello
  "world"
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

  def test_true
    assert true
  end
end
