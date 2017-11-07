require File.expand_path("../player", __FILE__)
require File.expand_path("../board", __FILE__)

class Game
  PLAYER_1_MARKER = "X"
  PLAYER_2_MARKER = "O"

  attr_reader :board, :players, :status, :current_player, :played_turns

  def initialize
    @status = "not finished"
    @played_turns = 0
    @board = Board.new
    @players = []
    set_players
    @current_player = players.sample
  end

  def set_players
    player_1_name, player_2_name = ask_player_names
    player_1 = Player.new(player_1_name, PLAYER_1_MARKER)
    player_2 = Player.new(player_2_name, PLAYER_2_MARKER)
    players.push(player_1, player_2)
  end

  def ask_player_names
    puts "Please give me your name Player 1"
    player_1_name = gets.chomp
    puts "Your name Player 2"
    player_2_name = gets.chomp
    [player_1_name, player_2_name]
  end

  def do_turn
    ask_for_cell_number(current_player)
    @played_turns += 1
    board.display
    update_status if played_turns >= 5
    switch_player if status == "not finished"
  end

  def update_status
    check_for_victories
    if status != "victory" && board.full?
      @status = "draw"
      puts "Draw!"
    end
  end

  def check_for_victories
    if board.has_winning_combinations?
      @status = "victory"
      congratulate(current_player.name)
    end
  end

  def ask_for_cell_number(player)
    puts "OK #{player.name}. Make your move."
    cell_number = gets.chomp.to_i
    legal_move = board.drop_marker_at(cell_number, player.marker)
    while (legal_move == false)
      puts "Make a real move!"
      cell_number = gets.chomp.to_i
      legal_move = board.drop_marker_at(cell_number, player.marker)
    end
  end

  def switch_player
    @current_player == players[0] ? @current_player = players[1] : @current_player = players[0]
  end

  def finished?
    status == "draw" || status == "victory"
  end

  def congratulate(name)
    puts "Congratulations #{name}, you won!"
  end
end
