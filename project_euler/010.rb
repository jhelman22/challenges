# Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
#

def sieve_of_e(n)
  a = (0...n).to_a
  a[0] = nil
  a[1] = nil
  (2..Math.sqrt(n)).each do |i|
    if a[i]
      it = 0
      j = i * i
      while j <= n
        a[j] = nil
        it += 1
        j = i * i + i * it
      end
    end
  end
  a.select{|i| i}
end

puts sieve_of_e(2000000).inject(&:+)

# Answer: 142913828922
