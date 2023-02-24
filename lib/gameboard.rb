require_relative 'square'

class Gameboard
  def initialize(root = nil)
    @grid = make_board
    # @root = build_graph(@grid)
  end
  
  # def build_graph(array)
  #   array.map.with_index do |row, rank_index|
  #     rank = rank_index
  #     row.map.with_index do |node, file_index|
  #       file = file_index
  #       node = Square.new([rank, file])
  #       # node.moves = add_edges(node, [rank, file])
  #     end
  #   end.reverse
  # end

  def make_board
    grid = Array.new(8, Array.new(8))
    grid.map.with_index do |row, rank_index|
      rank = rank_index
      row.map.with_index do |node, file_index|
        file = file_index
        node = Square.new([rank, file])
      end
    end.reverse
  end

  # def add_edges(node, location)
  #   moves = [[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
  #   valid_moves = []


  #   moves.each do |move|
  #     new_space = [location[0] + move[0], location[1] + move[1]]
    

  #     if new_space[0].positive? && new_space[0] < 8 && new_space[1].positive? && new_space[1] < 8
  #       valid_moves << @root[new_space[0]][new_space[1]]
  #     end
  #   end
  #   valid_moves
  # end

  def print_board
    index = 0
    board = []
    @grid.each do |row|
      rank = []
      row.each { |square| rank.push(square.rank_file) }
      board.push(rank)
    end

    board.each { |row| p row }
  end
end
