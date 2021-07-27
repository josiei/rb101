=begin
P: 
  Input: A nested array with a two item sub array with different objects
  Output: a hash where the first item is they key and the second is the symbol
E: 
  Explicit: first item is key, second is value
  Implicit: should be able to handle any data type 
  Can we bank on the subarrays being two items max? 
D: 
  - have an array
  - will need to iterate through and access each 
    subelement and assign key, val positions
  - need a new hash
A:
  initialize new hash 
  iterate through each subitem and grab values 
  at idx 0 and 1. 
  assign 0 to key in hash and item at idx 1 to val 
  return hash
=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = Hash.new

arr.each do |subarr|
hsh[subarr[0]] = subarr[1]
end
p hsh
