numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

#I expect this to print [1, 2, 2, 3]
# very close – puts automatically calls to_s, 
# which is why it will output as
#1
#2
#2
#3  