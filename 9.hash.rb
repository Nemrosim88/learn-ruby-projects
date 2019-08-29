# frozen_string_literal: true

sample_hash = { 'a' => 1, 'b' => 2, 'c' => 3 }
sample_hash['a'] # Get value with key "a"
sample_hash.keys # ['a','b','c']
sample_hash.values # [1,2,3]
next_hash = { 'one' => 'two', 'two' => 'three' }
empty_hash = {}

# Symbols hash
sample_hash = { a: 1, b: 2, c: 3 } # {:a=>1, :b=>2 ...}
sample_hash[:a]
sample_hash[:b] = 5 # Will change key-value
sample_hash[:d] = 'Hello' # Will add key-value
sample_hash.delete(:d) # Will delete key-value