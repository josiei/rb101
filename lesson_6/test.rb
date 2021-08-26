def joinor(arr, separator = ",", joining_word = "or")
  arr[-1] = "#{joining_word} #{arr[-1]}"
  puts arr.join("#{separator} ")
end

