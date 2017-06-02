# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#
require 'prime'
class PrimeNumbers
  def initialize
    @primes = [2,3,5,7,9]
  end

  def is_prime?(num)
    return true if @primes.include? num
    (2...(num/2.0).floor).each do |i|
      return false if num % i == 0
    end
    @primes.push(num)
    true
  end
end

primer = PrimeNumbers.new
num = (600851475143/2.0).floor
largest = nil
(num).downto(1) do |n|
  largest = n if num % n == 0 && n.prime? # primer.is_prime?(n)
  break if largest
end

puts largest
