class Square
  attr_accessor :rank_file, :moves

  def initialize(rank_file = nil, moves = [])
    @rank_file = rank_file
    @moves = moves
  end

  def add_edge(possible_move)
    @moves << possible_move
  end
end
