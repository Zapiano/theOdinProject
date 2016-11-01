class TicTacToe
  attr_reader :scoreboard, :turn, :player_1, :player_2, :winner

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2

    @turn = player_1
    @scoreboard = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]

    start_game
  end

  def play(player, line, row)
    if player.can_play?
      mark = player == @player_1 ? 'x'  : 'o'

      @scoreboard[line][row] = mark
    end
  end

  private
  def start_game
    puts "Welcome #{@player_1} and #{@player_2}!\n"
    puts "On your turn, you should enter a (x,y) coordinate\n"
    puts "corresponding to your move.\n\n"
    puts "#{@player_1}, is your turn. Enter a line and row:"
  end

  def receive_move
    move_regex = /^[(][1-3]{1}[,][1-3]{1}[)]$/
    move = gets.chomps

    if move =~ move_regex

    else

    end
  end

  def print_scoreboard
    @scoreboard.each do |line|
      line.each do |element|
        puts "| ${element} |"
      end
      puts "\n"
    end
  end
end

class Player
  def initialize(name)
    @name = name
  end

  public

  def can_play?(line, row)
    if (row < 1 || row > 3) || (line < 1 || line > 3)
      puts 'This is not a valid move >:('
      return false
    end

    unless game.scoreboard[line][row] == ' '
      puts 'This spot is occupied :|'
      return false
    end

    unless self == game.player_1 || self == game.player_2
      puts 'You are not playing!'
      return false
    end

    unless game.turn == self
      puts 'It is not your turn!'
      return false
    end

    unless game.winner.nil?
      puts 'This game is over'
      return false
    end

    return true
  end

  def play(game, x_coordinate, y_coordinate)
    row = x_coordinate - 1
    line = y_coordinate - 1

    if self.can_play?
      game.play(line, row)
    end
  end

  private
  def error_message(type)
  end
end
