class Auto
    attr_reader :mark
    attr_reader :model
    attr_reader :year
    attr_reader :rashod

    def initialize(mark, model, year, rashod)
        @mark = mark
        @model = model
        @year = year
        @rashod = rashod
    end

    def to_s
        "mark:#{@mark}; model:#{@model}; year:#{@year};  rashod:#{@rashod};"
    end

end
