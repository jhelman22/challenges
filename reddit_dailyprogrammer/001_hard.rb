#!/usr/bin/ruby

puts "Pick a number between 1 and 100 and I'll start guessing..."
puts "Got your number? Press ENTER to start"
gets
count = 0
min = 1
max = 100
while true
  count += 1
  range = (min..max).to_a
  guess = range[(range.count / 2.0).floor - 1]
  puts "I guess #{guess}! Is your number (h)igher, (l)ower, or is my guess (c)orrect?"
  resp = gets.chomp
  break if resp == 'c'
  if resp == 'h'
    min = guess + 1
  else
    max = guess - 1
  end
end

puts "I guessed correctly in only #{count} tries! Your number was #{guess}!"
