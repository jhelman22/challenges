# https://www.reddit.com/r/dailyprogrammer/comments/pkwb1/2112012_challenge_3_intermediate/

# Mono alphabetic substition cipher
# Takes in a key that is placed at beginning of alphabet
# shifting all characters not in the key "right"
# and doing alphabetic substition on the plaintext with the "new" cipher alphabet
def cipher(text, key, encrypt)
  alph = ('a'..'z').to_a
  uniq_key = key.chars.uniq
  cipher_alph = uniq_key + (alph - uniq_key)

  text.downcase.chars.map do |c| 
    if alph.include?(c)
      encrypt ? cipher_alph[alph.index(c)] : alph[cipher_alph.index(c)]
    else
      c
    end
  end.join
end

print "Enter your text>"
txt = gets.chomp
print "Enter your secret key>"
key = gets.chomp
print "Encrypt(e)? Decrypt(d)?>"
flag = gets.chomp == 'e' ? true : false

puts "---------------------------"
puts cipher(txt, key, flag)
puts "---------------------------"
