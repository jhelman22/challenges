# Problem 4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product
# of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#

def largest_palindrome
  largest = 0
  999.downto(100) do |i|
    999.downto(100) do |j|
      largest = i * j if "#{i * j}" == "#{i * j}".reverse && i * j > largest
    end
  end
  largest
end

puts largest_palindrome

# Answer: 906609
