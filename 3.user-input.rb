# Textx

puts "What is your name?"
first_name = gets.chomp
puts "Hello, #{first_name}"

# Will not multiply, it will concatenite
puts "Enter anumber to multiply by 2"
input = gets.chomp
puts input * 2

# Solution
puts "Enter anumber to multiply by 2"
input = gets.chomp
#convert to integer
puts input.to_i * 2