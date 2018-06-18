class NumericalSequence
  def initialize(first_element: 1, precalculate_count: 6)
    # calculated elements to display
    @active_elements = [first_element.to_i]
    # non-displayable calculated elements to retrieve next time instead of calc.
    @cached_elements = []

    organize_calculation(validate_count(precalculate_count))
  end

  def inspect
    active_elements
  end

  def prettify
    active_elements.map.with_index(1) { |element, i| "#{i}) #{element}\n" }
  end

  def recalculate(elements_count: 6)
    organize_calculation(validate_count(elements_count))
  end

  def to_s
    active_elements.to_s
  end

  private

  def validate_count(count)
    return 6 if count.nil? || count.zero?
    return 6 if count.is_a?(String) && count.empty?
    count = count.to_i
    count.positive? ? count : 6
  end

  # decides what to do: cache, retrieve from cache or calculate
  def organize_calculation(count)
    active_count = active_elements.count

    return if active_count == count
    return cache(active_count - count) if active_count > count

    retrieve_from_cache(count - active_count)

    calculate(count - active_elements.count)
  end

  # TODO: move all caching logic to Cachable concern
  def cache(count)
    @cached_elements = active_elements.pop(count)
    return
  end

  def calculate(count)
    count.times { active_elements.push(next_element) }
    return
  end

  def retrieve_from_cache(count)
    active_elements.push(*@cached_elements.shift(count))
    return
  end

  protected

  attr_accessor :active_elements

  def next_element
    raise 'Not Implemented'
  end
end
