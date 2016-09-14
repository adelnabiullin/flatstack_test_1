module StrangeSequenceHandler
  def self.print_sequence(elems_count)
    current = [ 1 ]
    elems_count.times do
      puts current.join
      current = make_next_from(current)
    end
  end

  private

  def self.make_next_from(last_elem)
    group_arr = []
    curr = 0
    group_arr[0] = [ last_elem[0] ]
    last_elem[1..-1].each { |elem|
      if elem == group_arr[curr][0]
        group_arr[curr].push(elem)
      else
        curr += 1
        group_arr[curr] = [ elem ]
      end
    }

    result = []
    group_arr.each { |elem|
      result.push(elem.size)
      result.push(elem[0])
    }

    result
  end
end
