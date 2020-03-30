require_relative "auto"
require_relative "fleet"

def main
    auto_one = Auto.new('xyemarka','xyemodel',2000, 12.5)
    puts auto_one
    fleet = Fleet.new
    fleet.load_from_file("cars-list.json")
    #pp fleet
    puts fleet.cars[2]
end

if __FILE__ == $0
    main
end