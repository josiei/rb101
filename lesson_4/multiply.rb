def multiply(numbers, criteria)
  counter = 0
  loop do
    break if counter == numbers.size
    numbers[counter] *= criteria
    counter += 1
  end
  p numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
