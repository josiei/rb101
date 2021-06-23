ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
min_age = Float::INFINITY
ages.each_value {|val| 
  if val < min_age
    min_age = val
  end
}
p min_age