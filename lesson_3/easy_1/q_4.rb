numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)

=begin
  numbers.delete(1) will actually 
  delete the number 1, while
  numbers.delete_at(1) will delete
  at index 1 so [2]. 
=end
