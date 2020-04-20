class Match

  attr_reader :team_one
  attr_reader :team_two
  attr_reader :score_one
  attr_reader :score_two
  def initialize(team_one, team_two, score_one, score_two)
    @team_one=team_one
    @team_two=team_two
    @score_one=Integer(score_one)
    @score_two=Integer(score_two)
  end

  def to_s
    "#{@team_one} - #{@score_one} : #{@score_two} - #{@team_two}"
  end
end