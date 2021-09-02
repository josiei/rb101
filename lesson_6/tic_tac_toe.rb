require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
FIVE_WINS = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ",", joining_word = "or")
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{joining_word} ")
  else
    arr[-1] = "#{joining_word} #{arr[-1]}"
    arr.join("#{separator} ")
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry that's not a valid choice")
  end
  brd[square] = PLAYER_MARKER
end

def place_piece!(brd, crnt_player)
  if crnt_player == "player"
    player_places_piece!(brd)
  elsif crnt_player == "computer"
    computer_places_piece!(brd)
  end
end

def alternate_player(crnt_player)
  if crnt_player == "player"
    "computer"
  elsif crnt_player == "computer"
    "player"
  end
end

def player_chooses_first
  prompt("Who would you like to go first?")
  answer = gets.chomp.downcase
  if answer.start_with?("p")
    "player"
  elsif answer.start_with?("c")
    "computer"
  else
    computer_chooses_first
  end
end

def computer_chooses_first
  options = ["player", "computer"]
  answer = options.sample
end

def who_goes_first()
  first_player = nil
  prompt("Player picks or Computer picks?")
  user_input = gets.chomp

  if user_input.downcase.start_with?("p")
    first_player = player_chooses_first
  elsif user_input.downcase.start_with?("c")
    first_player = computer_chooses_first  
  end
  first_player
end

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def find_attack_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_attack_square(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
  end

  if !square
    if empty_squares(brd).include?(5)
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(brd, p_score, c_score)
  if detect_winner(brd) == 'Player'
    p_score = p_score + 1
  elsif detect_winner(brd) == 'Computer'
    c_score = c_score + 1
  else
    p_score += 1
    c_score += 1
  end
  score_array = [p_score, c_score]
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def first_to_five?(p_score, c_score)
  ultimate_winner = false
  if p_score == FIVE_WINS
    prompt "Player is the ULTIMATE winner"
    ultimate_winner = true
  elsif c_score == FIVE_WINS
    prompt "Computer is the ULTIMATE winner"
    ultimate_winner = true
  end
  ultimate_winner
end

def display_score(p_score, c_score)
  prompt "PLAYER: #{p_score}, COMPUTER: #{c_score}"
end

def reset_score!(p_score, c_score)
  p_score = 0
  c_score = 0
  score_array = [p_score, c_score]
end

player_score = 0
computer_score = 0
current_player = who_goes_first

loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
  else
    prompt "It's a tie!"
  end

  player_score, computer_score = update_score(board, player_score, computer_score)
  display_score(player_score, computer_score)
  if first_to_five?(player_score, computer_score) == true
    player_score, computer_score = reset_score!(player_score, computer_score)
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
