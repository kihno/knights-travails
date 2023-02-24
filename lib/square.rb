class Square
  attr_accessor :rank_file, :moves

  def initialize(location = nil)
    @location = location
    @moves = get_possible_moves(@location)
    @rank_file = get_rank_file(@location)
  end

  def get_rank_file(location)
    rank = (location[0] + 1).to_s
    file = convert_to_letter(location[1])
    file + rank
  end

  def convert_to_letter(num)
    letters = Array(('A'..'H'))
    letters[num]
  end

  def get_possible_moves(location)
    moves = [[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
    valid_moves = []

    moves.each do |move|
      new_space = [location[0] + move[0], location[1] + move[1]]

      if new_space[0].positive? && new_space[0] < 8 && new_space[1].positive? && new_space[1] < 8
        valid_moves << new_space
      end
    end

    valid_moves
  end
end
