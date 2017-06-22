# https://www.reddit.com/r/dailyprogrammer/comments/5aemnn/20161031_challenge_290_easy_kaprekar_numbers/

def kaprekars(start,finish)
  (start..finish).map do |i|
    squared = (i * i).to_s
    kap = false
    (1...squared.length).each do |split|
      a = squared[0...split].to_i
      b = squared[split..-1].to_i
      kap = a > 0 && b > 0 && a + b == i
      break if kap
    end
    kap ? i : nil
  end.reject(&:nil?)
end

puts kaprekars(1,50).join(" ")
puts kaprekars(2,100).join(" ")
puts kaprekars(101,9000).join(" ")
