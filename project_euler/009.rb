# Problem 9
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
def brute_force
  (1..1001).each do |a|
    (a+1..1001).each do |b|
      c2 = a*a + b*b
      c = Math.sqrt(a*a + b*b)
      return [a,b,c.to_i] if (c.to_i == c) && (a + b + c == 1000)
    end
  end
end

result = brute_force

a = result[0]
b = result[1]
c = result[2]
puts "a: #{a} b: #{b} c: #{c}"
puts "a2 + b2 = c2: #{a*a} + #{b*b} = #{c*c}"
puts "a + b + c = #{a+b+c}"
puts "a * b * c = #{a*b*c}"

# Answer: 31875000
