=begin
P: 
Input: An array of hashes (some with multiple elements)
Output: Return an array with only the hashes where the integers are even
E:
Implicit: no other elements beyond hashes in arr, returning 
a new array? 
Explicit: hashes may have multiple keys and multiple items in
its subarray
D: 
- iteration through subhashes and through their values
OR possible can get their keys in one array and check 
for odds
- your going to need some sort of selection to pick the
hash with only even integers
A: 
iterate through subhash
  check if any values are odd and reject if they are 


=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
new_arr = []
new_arr = arr.select do |hsh|
            hsh.values.flatten.all? {|num| num.even? }              
          end
p new_arr