
module Abb
    def foo
        puts "foo"
    end
end

module Abc
    def foo
        puts "bar"
    end
end


class Mix
    include Abc
    include Abb
    
end

mix = Mix.new
mix.foo