class TicTacToe
  attr_reader :scoreboard, :turn_player, :player_1, :player_2, :winner

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2

    @turn_player = player_1
    @scoreboard = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]

    start_game
  end

  def receive_move(player, line, row)
    @scoreboard[line][row] = player_mark(player)

    print_scoreboard

    next_player = ([@player_1, @player_2] - player).first
    turn_player = next_player
    puts "#{next_player}, now s your turn."
  end

  private
  def player_mark(player)
    return player ==  @player_1 ? 'x' : 'o'
  end

  def start_game
    puts "Welcome #{@player_1} and #{@player_2}!\n"
    puts "On your turn, you should enter a (x,y) coordinate\n"
    puts "corresponding to your move.\n\n"
    puts "#{@player_1}, is your turn."

    print_scoreboard
  end

  def print_scoreboard
    @scoreboard.each do |line|
      line.each do |element|
        puts "| #{element} |"
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

  def can_play?(game, line, row)
    unless row >= 1 && row <= 3 && line >= 1 && line <= 3
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

    unless game.turn_player == self
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

    if self.can_play?(game, line, row)
      game.receive_move(self, line, row)
    end
  end

  private
  def error_message(type)
  end
end
