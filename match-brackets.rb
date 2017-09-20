def braces(values: )
    values.collect do |string|
      balanced?(string: string)
    end
end

def balanced?(string: )
  array_of_symbols = string.split("")
  return false if array_of_symbols.size.odd?
  openers = []
  until array_of_symbols.empty?
    if is_opener?(first_symbol: array_of_symbols.first)
      openers.unshift(array_of_symbols.shift)
    else
      return false unless correct_closer?(closer_used: array_of_symbols.shift, need_to_close: openers.shift)
    end
  end
  true
end

def is_opener?(first_symbol: )
  ["(", "{", "["].any? { |opener| opener == first_symbol }
end

def correct_closer? (closer_used: , need_to_close: )
  closer_used == closer_needed = case need_to_close
  when "{"
    "}"
  when "["
    "]"
  when "("
    ")"
  end
end
