require 'pry'
require './player.rb'
require './board.rb'

class TicTacToe

  def initialize
    @board = Board.new
    @turn = nil

    start_game
  end

  private
  def start_game
    game_welcome

    while !is_game_over?
      handle_turn
    end

    end_game
  end

  def handle_turn
    change_turn

    @board.print_moves

    puts "Now is #{@turn.name.capitalize}'s turn!"

    valid_move = false

    until valid_move
      line = handle_move('line')
      row = handle_move('row')

      if @board.ocupied?(line, row)
        puts 'Esta jogada já esta ocupada'
      else
        valid_move = true
      end
    end

    @board.receive_move(line, row, @turn.mark)
  end

  def change_turn
    if @turn == nil
      @turn = @player_1
    else
      @turn = ([@player_1, @player_2] - [@turn]).first
    end
  end

  def handle_move (move_type)
    puts move_type == "line" ? "Digite a linha" : "Digite a coluna"

    valid_move = false

    until valid_move
      begin
        move = gets.chomp.match(/\d+/)[0].to_i
      rescue
        puts "Input errado. O input deve ser um número"
      else
        if invalid_move?(move)
          puts "O número deve estar estar entre 1 e 3"
        else
          valid_move = true
        end
      end
    end

    move
  end

  def invalid_move?(move)
    true unless move >= 1 && move <= 3

    false
  end

  def game_welcome
    puts "Welcome to TicZapToe :D \n\n"

    puts "Please enter the name of the first player \n\n"
    player_1_name = gets.chomp

    @player_1 = Player.new(player_1_name, 'x')

    puts "Please enter the name of the second player \n\n"

    player_2_name = gets.chomp
    @player_2 = Player.new(player_2_name, 'o')

    puts "Ok, now we are ready to start! In your turn, each player should choose a line and a row, like '(1,2)'. After each move, the board will be printed again. \n \n Good luck!\n\n"
  end

  def is_game_over?
    if @board.has_full_line?
      return true
    elsif @board.has_full_row?
      return true
    elsif @board.has_full_diagonal?
      return true
    elsif @board.is_full?
      return true
    else
      return false
    end
  end

  def end_game
    @board.print_moves

    if !@board.has_full_line? && !@board.has_full_row? && !@board.has_full_diagonal? && @board.is_full?
      puts "The game is over. Is a tie! =|"
    else
      puts "The game is over. #{@turn.name.capitalize} has won! ;)"
    end
  end
end

TicTacToe.new()
