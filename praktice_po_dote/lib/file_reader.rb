require "csv"
require_relative "match"
class Reader
    def initialize()
        @match_list = []
        @teams
    end

    def show
      @match_list.each do |match|
        puts match
      end
    end

    def read(filename)
      CSV.foreach(filename, headers: false) do |row|
        match = Match.new(row[0], row[1], row[2], row[3])
        @match_list.push(match)
        match
      end
      array_to_hash
      @match_list
    end

    def array_to_hash
        @teams = Hash.new(0)
        @match_list.each do |match|
            @teams[match.team_one] += match.score_one
            @teams[match.team_two] += match.score_two 
        end
        @teams.to_a
    end

    def list_by_name
      array = @teams.map {|team| team[0]}.sort
      return array.each unless block_given?
      array.each do |team|
        yield team
      end
    end

    def sort_by_score
      array = @teams.sort{|a,b| a[1] <=> b[1]}.map {|team| team[0]}.reverse
      return array.each unless block_given?
      array.each do |team|
        yield team
      end
    end

    def add (team_one, team_two, score_one, score_two)
      @match_list.push(Match.new(team_one,team_two,score_one,score_two))
      array_to_hash
    end
end