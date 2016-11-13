class Board
  attr_reader :moves
  def initialize
    @moves = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  public
  def main_diagonal
    return [@moves[0][0], @moves[1][1], @moves[2][2]]
  end

  def secondary_diagonal
    return [@moves[0][2], @moves[1][1], @moves[2][0]]
  end

  def print_moves
    @moves.each do |line|
      puts line.join('|')
    end
  end

  def receive_move(line, row, mark)
    line_position = line - 1
    row_position = row - 1

    @moves[line_position][row_position] = mark
  end

  def has_full_line?
    each_line do |line|
      if line[0] == line[1] && line[1] == line[2]
        if line[0] == " "
          return false
        else
          return true
        end
      end
    end

    false
  end

  def has_full_row?
    each_row do |row|
      if row[0] == row[1] && row[1] == row[2]
        if row[0] == " "
          return false
        else
          return true
        end
      end
    end

    false
  end

  def has_full_diagonal?
    if main_diagonal[0] == main_diagonal[1]
      if main_diagonal[1] == main_diagonal[2]
        return false if main_diagonal.any? {|move|  move == ' '}

        return true
      end
    end

    if secondary_diagonal[0] == secondary_diagonal[1]
      if secondary_diagonal[1] == secondary_diagonal[2]
        return false if secondary_diagonal.any? {|move| move == ' '}

        return true
      end
    end

    false
  end

  def is_full?
    each_move {|move| return false if move == ' '}

    return true
  end

  def ocupied?(line, row)
    line_position = line - 1
    row_position = row - 1

    return @moves[line_position][row_position] != ' '
  end

  private
  def each_line
    @moves.each do |line|
      yield(line)
    end
  end

  def each_row
    @moves.transpose.each do |row|
      yield(row)
    end
  end

  def each_move
    @moves.each do |line|
      line.each do |move|
        yield(move)
      end
    end
  end
end
