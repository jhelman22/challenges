# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?
#
require 'prime'

# brute force to find nth prime and cheating using prime library
def brute_force(n)
  primes = []
  i = 2
  while primes.count < n
    primes.push(i) if i.prime?
    i += 1
  end
  primes.last
end

# Sieve of Eratosthenes https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# Input: an integer n > 1.
#
#  Let A be an array of Boolean values, indexed by integers 2 to n,
#  initially all set to true.
#
#  for i = 2, 3, 4, ..., not exceeding √n:
#    if A[i] is true:
#      for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n:
#        A[j] := false.
#
#  Output: all i such that A[i] is true.
# Since this sieve finds all primes up to a certain n,
# we set a max that would be enough to cover up to our desired
# 10001st prime. An incremental sieve would be needed to find any prime
def sieve_of_e(n)
  max = n * 15 # cheating to make list of primes at least 10,001 primes long
  a = (0..max).to_a
  a[0] = nil
  a[1] = nil
  (2..Math.sqrt(max)).each do |i|
    if a[i]
      it = 0
      j = i * i
      while j <= max
        a[j] = nil
        it += 1
        j = i * i + i * it
      end
    end
  end
  a.select{|i| i}[n-1]
end


puts "Brute force: #{brute_force(10001)}"
puts "Sieve of Eratosthenes: #{sieve_of_e(10001)}"

# Answer: 104743
