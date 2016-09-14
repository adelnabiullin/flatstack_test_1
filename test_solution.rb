require_relative 'strange_sequence_handler'

print 'Type sequence\'s elements count to generate (>1): '

elems_count = gets.chomp.to_i

StrangeSequenceHandler.print_sequence(elems_count)
