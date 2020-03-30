require "tty-prompt"

def float?(str)
    Float(str) rescue false
end

def parse_to_i(str)
    str.split(" ").map(&:to_i)
end

def read_from_stream
    # prompt = TTY::Prompt.new
    # string_arr = prompt.multiline("enter array:")
    # return parse_to_i(string_arr)
    puts "Enter array:"
    string = gets
    return parse_to_i(string)
end

def read_from_file(filename)
    file = File.open(filename)
    arr = file.read.split(" ").map(&:to_i)
end


def znak_changes_iter(arr)
    count=0
    sign = arr[0]>0 ? true:false
    # sign = true if arr[0]>0 
    print sign
end

def znak_changes_cycle()
end

def main
    if ARGV.size == 0
        arr=read_from_stream
    elsif ARGV.size == 1 
        arr=read_from_file(ARGV[0])
    end
    print arr
    znak_changes_iter(arr)
end


if __FILE__ == $0
    main
end
