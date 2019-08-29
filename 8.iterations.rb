a = [1, 2, 3, 4, 5]
# Traditional way to for-loop
a.each do |item|
  print item
end

# Ruby way to for-loop
a.each do |item|
  print item.to_s
end

# Ruby way to for-loop HASH
a.each do |key, value|
  print "#{key} and #{value}"
end

# Ruby one-line-way to for-loop
a.each { |item| print item }

# SELECT array method
a.select(&:odd?) # [1,3,5]

while true
#some code
break if true
end