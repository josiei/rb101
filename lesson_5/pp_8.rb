hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value { |words|
  words.each { |word|
    p word.chars.select { |vowels| vowels =~ /[aeiou]/}
    
  }

}