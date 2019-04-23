# https://www.reddit.com/r/dailyprogrammer/comments/pm6oj/2122012_challenge_4_easy/

puts "---- Password Generater v1.0 ------"
print "Enter number of passwords to generate: "
num_passwords = gets.chomp.to_i
print "Enter length of passwords: "
password_length = gets.chomp.to_i


alphanumerics = ("A".."Z").to_a + ("a".."z").to_a + (0..9).to_a
num_passwords.times do |i|
  puts "Password ##{i}: #{alphanumerics.shuffle[0...password_length].join}"
end
