a = [1, 2, 3, 4, 5]
a.last # 5
a.first # 1
a.empty? # false
a.unshift('Hello') # will add to the beginning
a.append('Hello') # will add to the end
a.push('Hello') # will add to the end
a.pop # will return last element and removes it from array
a.uniq!
a.join # will combine all elements in one string
a.join('-') # will combine all elements in one string like "1-2-3-4-5..."
a.split('-') # will splite string to array
a.include?('Hello') # true
a << 6 # will add to array

b = 1..100

b.class # Range
b.to_a # converts to array
b.to_a.shuffle # converts to array and randomly shufle

%w[may name is Bruce] # => ['my', 'name', 'is', 'Bruce']
