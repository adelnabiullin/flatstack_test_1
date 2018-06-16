require_relative 'numerical_sequence'

class CountsOfGroupedDigitsSequence < NumericalSequence
  protected

  def next_element
    previous_digits = active_elements.last.digits

    result = [1, previous_digits.first]

    (previous_digits.count - 1).times do |i|
      if previous_digits[i] == previous_digits[i + 1]
        result[0] += 1
      else
        result.unshift(1, previous_digits[i + 1])
      end
    end

    result.inject { |base, digit| base * 10 + digit }
  end
end
