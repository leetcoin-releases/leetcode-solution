def remove_invalid_parentheses(s)
  return [s] if valid?(s)
  result = []
  visited = Set.new([s])
  queue = [s]
  found = false
  until queue.empty? || found
    size = queue.length
    size.times do
      current = queue.shift
      (0...current.length).each do |i|
        next unless current[i] == '(' || current[i] == ')'
        new_str = current[0...i] + current[i+1..-1]
        next if visited.include?(new_str)
        visited.add(new_str)
        if valid?(new_str)
          result << new_str
          found = true
        else
          queue << new_str unless found
        end
      end
    end
  end
  result.empty? ? [""] : result
end
def valid?(s)
  count = 0
  s.each_char do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
      return false if count < 0
    end
  end
  count == 0
end
