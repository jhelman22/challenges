# Problem 14
#
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

def compute_chain_length(n)
  chain_length = 0
  while(n != 1) do
    n = n.odd? ? (3*n+1) : (n/2)
    chain_length += 1
  end
  chain_length
end

max_chain = [0,0]

(1...1000000).each do |n|
  chain_length = compute_chain_length(n)
  max_chain = [n, chain_length] if chain_length > max_chain[1]
end

puts max_chain

# Answer: 837799
