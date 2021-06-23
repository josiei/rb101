flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|value| value[0,3]}
p flintstones