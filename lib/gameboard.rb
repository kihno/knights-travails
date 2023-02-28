require_relative 'square'

class Gameboard
  def initialize
    @grid = make_board
  end

  def make_board
    grid = Array.new(8) { Array.new(8) }
    grid.map.with_index do |row, rank_index|
      rank = rank_index
      row.map.with_index do |node, file_index|
        file = file_index
        node = Square.new([rank, file])
      end
    end
  end

  def start
    print_board
    puts "Enter your starting location:"
    start = validate_rankfile(gets.chomp.upcase)

    puts "Enter your destination"
    finish = validate_rankfile(gets.chomp.upcase)

    knight_moves(start, finish)
  end

  def replay
    puts 'Play again [y/n]?'
    answer = gets.chomp.downcase

    if answer == 'y'
      start
    else
      exit
    end
  end

  def pathfinder(finish, parents)
    path = []
    node = finish

    until node.nil?
      path << node
      node = parents[node]
    end

    print_path(path.reverse)
  end

  def validate_rankfile(rankfile)
    @grid.each do |row|
      row.each do |node|
        return node.location if node.name == rankfile
      end
    end

    puts "Choose a valid square on the chessboard:"
    validate_rankfile(gets.chomp.upcase)
  end

  def knight_moves(start, finish)
    queue = []
    visited = []
    parents = { start => nil }

    queue << start

    until queue.empty?
      current = queue[0]

      return pathfinder(finish, parents) if current == finish

      if !visited.include?(current)
        visited << current
        @grid[current[0]][current[1]].moves.each do |move|
          unless parents.key?(move)
            parents[move] = current
            queue << move
          end
        end
      end
      queue.shift
    end
    pathfinder(finish, parents)
  end

  def print_path(path)
    board = []
    @grid.each do |row|
      rank = []
      row.each { |square| rank.push(square) }
      board.push(rank)
    end

    board.each do |row|
      name_row = []

      row.each do |square|
        if square.location == path[0]
          name_row << 'ST'
        elsif square.location == path[-1]
          name_row << 'EN'
        elsif path.include?(square.location)
          name_row << "0#{path.index(square.location)}"
        else
          name_row << square.name
        end
      end

      p name_row
    end
    puts "You made it in #{path.length - 1} moves. Here is your path:"
    path.each { |move| puts board[move[0]][move[1]].name }

    replay
  end

  def print_board
    board = []
    @grid.each do |row|
      rank = []
      row.each { |square| rank.push(square.name) }
      board.push(rank)
    end

    board.each { |row| p row }
  end
end
