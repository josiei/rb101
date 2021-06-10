produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hsh)
  hsh.select! {|key,val| val == "Fruit"}
  p hsh
end

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}