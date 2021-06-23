def select_letter(sentence, letter)
  selected = ''
  counter = 0
  loop do
    break if counter == sentence.size
    selected << sentence[counter] if sentence[counter] == letter
    counter += 1
  end
  p selected
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""