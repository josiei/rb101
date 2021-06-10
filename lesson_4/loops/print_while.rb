numbers = []
while numbers.length < 5
  random_num = Random.new
  numbers << random_num.rand(100)
end
p numbers