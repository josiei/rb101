=begin
P:
  Input: A hash, with a sub hash of attributes
  Output: An array, with the COLORS of the fruit
  (capitalized), and the SIZE of the vegetables 
  (uppercased)
  SO
  When iterating through, you must CHECK if it is
  a fruit or vegetable, then SELECT the 
  corresponding attribute, then MODIFY attribute,
  then add to array. 
  - be wary if your modification will affect 
  original hash. 
E:
  Explicit: Colors must be capitalized. size must
  be uppercased.
  Implicit: Colors may be an array of 1 or more. 
  Assuming color or size won't be empty. 
  Assuming size will only be one type of size.
  i.e No Medium and Large.
D: 
  - given a nested hash
  - returning a new array
A:
initialize new array.
iterate through hash.
  check hash[:type]
    if :type == fruit
      map colors value to capitalized 
      version and add to array.
    if :type == vegetable
      map size value to uppercased
      version and add to array.
    end
  end
end
return array
=end

colors_and_sizes = []
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.each do |produce|
  if produce[1][:type] == "fruit"
    colors_and_sizes << produce[1][:colors].map {|color| color.capitalize}
  elsif produce[1][:type] == "vegetable"
    colors_and_sizes << produce[1][:size].upcase
  else
    p "Not a fruit or vegetable"
  end
end

p colors_and_sizes