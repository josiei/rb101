def odd_indicies(nums)
  double_odd_numbers = []
  counter = 0
  
  loop do
    break if counter == nums.size
    current_num = nums[counter]
    current_num *= 2 if counter.odd?
    double_odd_numbers << current_num

    counter += 1
  end
  p double_odd_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
odd_indicies(my_numbers)  # => [2, 4, 6, 14, 2, 6]
