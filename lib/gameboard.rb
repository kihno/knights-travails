require_relative 'square'

class Gameboard
  def initialize
    @grid = make_board
  end

  def make_board
    grid = Array.new(8, Array.new(8, 0))
    grid.map.with_index do |row, index|
      rank = index + 1
      row.map.with_index do |node, index|
        file = convert_file(index)
        node = Square.new(file + rank.to_s)
      end
    end
  end

  def convert_file(num)
    files = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
    files[num]
  end

  def print_board
    index = 0
    board = []
    @grid.each do |row|
      rank = []
      row.each { |square| rank.push(square.rank_file) }
      board.push(rank)
    end

    board.reverse.each { |row| p row }
  end
end
