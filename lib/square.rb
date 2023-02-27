class Square
  attr_accessor :name, :moves, :location

  def initialize(location = nil)
    @location = location
    @moves = get_possible_moves(@location)
    @name = get_rank_file(@location)
  end

  def get_rank_file(location)
    num_reverse = Array((1..8)).reverse
    rank = num_reverse[location[0]].to_s
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
