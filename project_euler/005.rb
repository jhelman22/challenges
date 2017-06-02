# Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#
def not_divisible?(n)
  n % 20 != 0 ||
  n % 19 != 0 ||
  n % 18 != 0 ||
  n % 17 != 0 ||
  n % 16 != 0 ||
  n % 15 != 0 ||
  n % 14 != 0 ||
  n % 13 != 0 ||
  n % 12 != 0 ||
  n % 11 != 0
end

n = 2520
while not_divisible?(n)
  n += 1
end

puts n

# Answer: 232792560
