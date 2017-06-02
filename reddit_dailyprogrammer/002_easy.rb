#!/usr/bin/ruby

puts "Calculate potential earnings!"
print "Enter the number of users on your site: "
num_users = gets.chomp.to_i
print "Enter the monthly average value per user: "
value = gets.chomp.to_i
puts "\nWith those numbers, you would be making $#{value*num_users} per month and a whopping $#{value*num_users*12} per year!"
