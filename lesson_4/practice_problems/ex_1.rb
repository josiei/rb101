flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = Hash.new
flintstones.each_with_index {|item, index|
  hash[item] = index
}
p hash
