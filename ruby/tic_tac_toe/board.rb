class Board
  attr_reader :moves
  def initialize
    @moves = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]

    @main_diagonal  = []
    @main_diagonal << @moves[0][0]
    @main_diagonal << @moves[1][1]
    @main_diagonal << @moves[2][2]

    @secondary_diagonal = []
    @secondary_diagonal << @moves[0][2]
    @secondary_diagonal << @moves[1][1]
    @secondary_diagonal << @moves[2][0]
  end

  public
  def print_moves
    @moves.each do |line|
      puts line.join('|')
    end
  end

  def receive_move(line, row, mark)
    line_position = line - 1
    row_position = row - 1

    if is_valid_move?(line,row)
      @moves[line_position][row_position] = mark
    end
  end

  def has_full_line?
    each_line {|line| return false if line[0] == " "}
    each_line {|line| return false if line[1] == " "}
    each_line {|line| return false if line[2] == " "}

    each_line {|line| return true if line[0] == line[1] && line[1] == line[2]}
  end

  def has_full_row?
    each_row {|row| return false if row[0] == " "}
    each_row {|row| return false if row[1] == " "}
    each_row {|row| return false if row[2] == " "}

    each_row {|row|return true if row[0] == row[1] && row[1] == row[2]}
  end

  def has_full_diagonal?
    return false if @main_diagonal.any? {|move|  move == ' '}
    return false if @secondary_diagonal.any? {|move| move == ' '}

    if @main_diagonal[0] == @main_diagonal[1]
      if @main_diagonal[1] == @main_diagonal[2]
        return true
      end
    elsif @secondary_diagonal[0] == @secondary_diagonal[1]
      if @secondary_diagonal[1] == @secondary_diagonal[2]
        return true
      end
    end

    false
  end

  def is_full?
    each_move {|move| return false if move == ' '}

    return true
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
