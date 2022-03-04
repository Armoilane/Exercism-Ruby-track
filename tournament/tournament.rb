class Tournament

  HEADER = %w[Team MP W D L P]
  LAYOUT = "%-31s|%3s |%3s |%3s |%3s |%3s\n"

  def self.tally(input)
    tally = Hash.new { |hash, key| hash[key] = Team.new(key) }

    matches = input.lines(chomp: true).map { |line| line.split(';') }

    matches.each do |match|
      team1, team2, result = match

      tally[team1]
      tally[team2]

      case result
        when 'win'
          tally[team1].wins   += 1
          tally[team2].losses += 1
        when 'loss'
          tally[team1].losses += 1
          tally[team2].wins   += 1
        when 'draw'
          tally[team1].draws  += 1
          tally[team2].draws  += 1
        else
          tally = {}
      end
    end

    format(LAYOUT, *HEADER) +
      tally.sort_by { |_, value| [-value.points, value.name] }
           .map { |_, value| [value.name,
                              value.mp,
                              value.wins,
                              value.draws,
                              value.losses,
                              value.points] }
           .map { |team_results| format(LAYOUT, *team_results) }
           .join
  end

end


class Team
  private

  def initialize(name)
    @name = name
    @wins = @losses = @draws = 0
  end

  public

  attr_reader :name , :mp, :points
  attr_accessor :wins, :losses, :draws

  def match_count
    self.wins + self.losses + self.draws
  end

  def point_count
    self.wins * 3 + self.draws * 1
  end

  alias mp match_count
  alias points point_count

end
