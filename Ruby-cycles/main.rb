# frozen_string_literal: true

require 'tty-prompt'

def parse_to_i(str)
  str.split(' ').map(&:to_i)
end

def read_from_stream
  puts 'Array:'
  string = gets
  parse_to_i(string)
end

def read_from_file(filename)
  file = File.open(filename)
  file.read.split(' ').map(&:to_i)
end

def pow_of_two(arr)
  i=1
  puts arr[i]
  while i<arr.size
    puts arr[i*=2]
  end
end

def po2?(n)
  n.to_s(2).count('1') == 1
end

def pow_of_two_iter(arr)
  arr.each_with_index do |number, index|
    puts number if po2?(index)
  end
end

def zero_iter(arr)
  arr.delete_if {|x| x.zero?}
end

def zero(arr)
  # for i in arr 
  #   if i.zero?
  #     arr.delete(i)
  #   end
  # end
  arr.delete(0)
  arr
end

def znak_changes_iter(arr)
  count = 0
  sign = arr[0].positive?
  # sign = false
  # sign = true if arr[0].positive?
  arr.each_with_index do |number, index|
    cur_sign = number.positive?
    next unless cur_sign == sign

    sign = cur_sign
    puts "sign changed at index #{index}"
    count += 1
  end
  puts "sign changed #{count} times"
end

def znak_changes_cycle(arr)
  count = 0
  sign = arr[0].positive?
  for number in arr do
    cur_sign = number.positive?
    next unless cur_sign == sign

    sign = cur_sign
    puts "sign changed at index #{arr.index}"
    count += 1
  end
  puts "sign changed #{count} times"
end

def main
  if ARGV.empty?
    arr = read_from_stream
  elsif ARGV.size == 1
    arr = read_from_file(ARGV[0])
  end
  pp arr
  znak_changes_iter(arr)
  pow_of_two_iter(arr)
  pp zero(arr)
end

main if __FILE__ == $PROGRAM_NAME
