# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#

require 'prime'

# Fermat factorization as seen here (https://en.wikipedia.org/wiki/Fermat%27s_factorization_method)

# Basic Method
# FermatFactor(N): // N should be odd
#     a ← ceil(sqrt(N))
#     b2 ← a*a - N
#     while b2 is not a square:
#         a ← a + 1    // equivalently: b2 ← b2 + 2*a + 1
#         b2 ← a*a - N //               a ← a + 1
#     endwhile
#     return a - sqrt(b2) // or a + sqrt(b2)
# ** had to modify it to use recursion to build up the list of all prime factors then only return the largest
def fermat_basic(n)
  primes = []
  a = Math.sqrt(n).ceil
  b = a * a - n
  while Math.sqrt(b).to_i != Math.sqrt(b)
    a += 1
    b = a * a - n
  end
  low = a - Math.sqrt(b)
  high = a + Math.sqrt(b)
  primes << (low.to_i.prime? ? low : fermat_basic(low))
  primes << (high.to_i.prime? ? high : fermat_basic(high))
  primes.max
end

puts fermat_basic(600851475143)

# Answer: 6857
