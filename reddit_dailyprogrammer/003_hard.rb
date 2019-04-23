# https://www.reddit.com/r/dailyprogrammer/comments/pkwgf/2112012_challenge_3_difficult/

# attempted at first with regex but we're just gonna brute force it
# since it's a relatively small word list
def unscramble(scrambled_word, dictionary)
  # slight optimization to only check against words in the dictionary
  # with the same length
  words_by_size = dictionary.inject({}) do |h, word|
    h[word.size] = h[word.size] ? h[word.size] << word : [word]
    h
  end

  words_to_check = words_by_size[scrambled_word.size]
  scrambled_word.chars.each do |c|
    words_to_check = words_to_check.select{|w| w.include? c}
  end

  words_to_check = words_to_check.select{|w| w.chars.all?{|c| scrambled_word.include? c}}

  puts "#{scrambled_word} ==> #{words_to_check.first}"
end

# alternate version using sorted strings after looking at other solutions
# I should benchmark these to see how costly the sort is
def unscramble_with_sort(scrambled_words, dictionary)
  # by maintaining their array index i can restore to unsorted version
  sorted_dictionary = dictionary.map{|i| i.chars.sort.join}
  sorted_scrambled_words = scrambled_words.map{|i| i.chars.sort.join}

  sorted_scrambled_words.each_with_index do |word,i|
    puts "#{scrambled_words[i]} ==> #{dictionary[sorted_dictionary.index(word)]}"
  end
end

words = File.read("003/wordlist.txt").split("\r\n");
scrambled = [
  "mkeart",
  "sleewa",
  "edcudls",
  "iragoge",
  "usrlsle",
  "nalraoci",
  "nsdeuto",
  "amrhat",
  "inknsy",
  "iferkna"]

scrambled.each do |word|
  unscramble(word, words)
end

puts "--------- Using SORT ------------"
unscramble_with_sort(scrambled, words)



