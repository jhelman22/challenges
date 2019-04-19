# https://www.reddit.com/r/dailyprogrammer/comments/pkw2m/2112012_challenge_3_easy/

# Caesar cipher
def encrypt(plaintext, rot=13)
  alph = ('a'..'z').to_a
  plaintext.downcase.split("").map do |c| 
    alph.include?(c) ? alph[(alph.index(c) + rot) % 25] : c
  end.join
end

def decrypt(ciphertext, rot=13)
  encrypt(ciphertext, -rot)
end

print "Enter your text to be encrypted>"
puts "Here is your ciphertext: #{encrypt(gets.chomp)}"

print "Enter your text to be decrypted>"
puts "Here is your plaintext: #{decrypt(gets.chomp)}"
