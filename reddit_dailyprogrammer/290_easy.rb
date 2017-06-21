# https://www.reddit.com/r/dailyprogrammer/comments/5aemnn/20161031_challenge_290_easy_kaprekar_numbers/

def kaprekars(start,finish)
  (start..finish).map do |i|
    squared = (i * i).to_s
    split = squared.length / 2
    squared[0...split].to_i + squared[split..-1].to_i == i ? i : nil
  end.reject(&:nil?)
end

puts kaprekars(1,50).join(" ")
puts kaprekars(2,100).join(" ")
puts kaprekars(101,9000).join(" ")
