require_relative "file_reader"

class Raiting
  def create
    path = File.expand_path("../data/2019-ti-group-stage.csv", __dir__)
    reader=Reader.new
    reader.read(path)
    pp reader.array_to_hash

    # reader.list_by_name do |team|
    #   pp team
    # end

    # tt = reader.list_by_name
    # tmp = -> (name) do
    #  pp name.next
    # end
    # loop do
    #   tmp.call tt
    # end

    # reader.sort_by_score do |team|
    #   pp team
    # end

    reader.add("","Dota2 gaben gaming",2,0)
    reader.show


    reader.list_by_name do |team|
      pp team unless team.empty?
    end


  end
end