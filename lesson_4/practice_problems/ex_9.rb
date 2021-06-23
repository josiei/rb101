words = "the flintstones rock"

def titleize(string)
  split_array = string.split(" ")
  split_array.map! {|word| word[0].upcase + word[1..-1]}
  p split_array.join(" ")
end

titleize(words)