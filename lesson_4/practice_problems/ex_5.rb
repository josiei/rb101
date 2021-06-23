flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index {|item, index|
  if item.start_with?("Be")
    p index
  end
}