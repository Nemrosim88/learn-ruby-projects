# frozen_string_literal: true

# ========== String concatenation

name = 'Bruce'
surname = 'Wayne'
puts name + ' ' + surname

# ========== String interpolation

puts "My name is #{name}, and surname is #{surname}"
puts 'My name is #{name}, and surname is #{surname}'

# =========  Methods, how to find them
# ======================================

# Everithing is object
name.class
name.length
name.reverse
# Makes FIRST letter in cap BUT else will be small
name.capitalise
name.empty?
name.nil?

text = 'Welcome to Ukaine'
text.sub('Ukraine', 'England')

10.class
10.0.class

# convert to string
10.to_s

# show class methods
name.methods
