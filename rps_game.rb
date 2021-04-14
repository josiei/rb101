VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp']

options = {
  "r" => {
    l: "lose",
    sc: "lose"
  },
  "p" => {
    r: "lose",
    sp: "lose"
  },
  "sc" => {
    p: "lose",
    l: "lose"
  },
  "l" => {
    sp: "lose",
    p: "lose"
  },
  "sp" => {
    sc: "lose",
    r: "lose"
  }
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second, opts ={})
  opts[first][:"#{second}"] == "lose"
end

def display_results(p_score, c_score)
  if p_score == 5
    prompt("Congratulations! You are the grand winner!")
  elsif c_score == 5
    prompt("Computer has won this time! Muahahhah")
  else
    prompt("Player: #{p_score}, Computer: #{c_score}")
  end
end

def increment_win(score)
  score + 1
end

loop do
  choice = ''
  player_score = 0
  computer_score = 0
  prompt("Welcome to rock (r), paper (p),
         scissors (sc), lizard (l), spock (sp)!")

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice")
      end
    end
    computer_choice = VALID_CHOICES.sample
    puts computer_choice

    if win?(choice, computer_choice, options)
      player_score = increment_win(player_score)
    elsif win?(computer_choice, choice, options)
      computer_score = increment_win(computer_score)
    else
      player_score = increment_win(player_score)
      computer_score = increment_win(computer_score)
    end
    display_results(player_score, computer_score)
    break if (player_score == 5) || (computer_score == 5)
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thanks for playing!")
