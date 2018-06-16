require './lib/models/counts_of_grouped_digits_sequence'
require 'test/unit'

class TestCountsOfGroupedDigitsSequence < Test::Unit::TestCase
  def test_initialize
    sequence = CountsOfGroupedDigitsSequence.new(first_element: 1, precalculate_count: 6)

    assert_equal(sequence.inspect, six_elements)
  end

  def test_recalculate
    sequence = CountsOfGroupedDigitsSequence.new
    sequence.recalculate(elements_count: 8)

    assert_equal(sequence.inspect, eight_elements)
  end

  private

  def six_elements
    [
      1,
      11,
      21,
      1211,
      111221,
      312211
    ]
  end

  def eight_elements
    [
      1,
      11,
      21,
      1211,
      111221,
      312211,
      13112221,
      1113213211
    ]
  end
end
