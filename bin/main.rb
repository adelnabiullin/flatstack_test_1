require_relative '../lib/models/counts_of_grouped_digits_sequence'

sequence = CountsOfGroupedDigitsSequence.new

loop do
  print 'Type sequence\'s elements count to generate (do NOT try count > 37): '
  elements_count = gets.chomp.to_i

  sequence.recalculate(elements_count: elements_count)

  puts sequence.prettify

  print 'One more time? (Y/N): '
  answer = gets.chomp
  break unless %w(y yes).include?(answer.downcase)
end

